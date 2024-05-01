import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoappnotdatabaseinclude/controllers/checkbox_controller.dart';
import '../controllers/todo_controller.dart';
import '../models/todo.dart';

var updatedTodo;
var checboxPrivateValue;
var importantValue;
final controller = Get.put(TodoController());

class EditTodoDialog extends StatefulWidget {
  int index;

  EditTodoDialog(@required this.index, {super.key});

  @override
  State<EditTodoDialog> createState() => _EditTodoDialogState();
}

final TextEditingController titleController = TextEditingController();
final TextEditingController contentController = TextEditingController();
final checkboxController = Get.put(CheckboxController());

class _EditTodoDialogState extends State<EditTodoDialog> {
  @override
  void initState() {
    super.initState();
    updatedTodo = controller.todos[widget.index];

    titleController.text = updatedTodo.title;
    contentController.text = updatedTodo.content;
    checboxPrivateValue = updatedTodo.isPrivate;
    importantValue = updatedTodo.importantLevel;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.task,
        color: Colors.green,
        size: 50,
      ),
      title: const Text('Create new task'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              maxLength: 40,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                labelText: 'Task Title',
                hintText: 'Example: Homework',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color: Colors.pinkAccent.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color: Colors.pinkAccent.shade200, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: contentController,
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Task Content',
                hintText: 'Do your homework',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color: Colors.pinkAccent.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color: Colors.pinkAccent.shade200, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("back"),
            ),
            ElevatedButton(
              onPressed: () {
                var todo = Todo(
                    title: titleController.text,
                    content: contentController.text,
                    dateAdded: DateTime.now().toString(),

                    isPrivate: checkboxController.checkBoxIsPrivate.value);
                controller.updateTodo(widget.index, todo);
                Get.back();
              },
              child: const Text("Update"),
            )
          ],
        ),
      ],
    );
  }
}
