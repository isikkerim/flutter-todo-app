import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:todoappnotdatabaseinclude/controllers/todo_controller.dart';
import 'package:todoappnotdatabaseinclude/widgets/edit_todo_dialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class TodoCard extends StatefulWidget {
  int index;

  TodoCard(@required this.index, {super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  final controller = Get.put(TodoController());

  @override
  void initState() {
    controller.getAllTodos();
  }

  Widget build(BuildContext context) {
    return Obx(() {
      return Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) {
                Get.dialog(
                  transitionCurve: Curves.easeInOut,
                  transitionDuration: const Duration(seconds: 2),
                  EditTodoDialog(widget.index),
                );
              },
              backgroundColor: const Color(0xFF7BC043),
              foregroundColor:  const Color(0xFFFFFFFF),
              icon: Icons.update,
              label: 'Update',
            ),
            SlidableAction(
              onPressed: (context) {
                controller.deleteTodo(controller.todos[widget.index]);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
          child: ListTile(
            title: Text(controller.todos[widget.index].title),
            trailing: const Icon(Icons.add),
            subtitle: Text(controller.todos[widget.index].content),
            subtitleTextStyle: const TextStyle(fontSize: 25, color: Colors.brown),
          ),
        )),
      )
          .animate(delay: const Duration(milliseconds: 200))
          .fade(delay: const Duration(milliseconds: 200))
          .scale(delay: const Duration(milliseconds: 200));
    });
  }
}
