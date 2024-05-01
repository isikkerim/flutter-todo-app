import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import '../models/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var isPermissionDenied = false.obs;

  void getAllTodos() async {
    var status = await Permission.storage.status;
    print("status $status");
    if (!status.isGranted) {
      print("izin iste");
      status = await Permission.storage.request();
      print("sds");
      if (!status.isGranted) {
        isPermissionDenied.value = false;

        update();

      } else {
        print("izin verilmedi");

        Directory directory = await getApplicationDocumentsDirectory();
        String path = directory.path;

        File file = File('$path/todos.json');
        if (await file.exists()) {
          String jsonTodos = await file.readAsString();
          List<dynamic> decodedTodos = jsonDecode(jsonTodos);
          todos = RxList<Todo>(decodedTodos.map((e) => Todo.fromJson(e)).toList());

          print(jsonEncode(todos.map((e) => e.toJson()).toList()));
          isPermissionDenied.value = false;
          update();
        } else {
          print('todos.json does not exist.');
        }
      }
    }
  }

  void addTodo(Todo todo) {
    todos.add(todo);
    saveTodos();
    update();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    saveTodos();
    update();
  }

  void updateTodo(int oldTodoIndex, Todo newTodo) {
    todos[oldTodoIndex] = newTodo;
    saveTodos();
    update();
  }

  void saveTodos() async {
    String jsonTodos = jsonEncode(todos.map((e) => e.toJson()).toList());

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        return;
      }
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path;

    File file = File('$path/todos.json');
    file.writeAsString(jsonTodos);
    update();
  }
}
