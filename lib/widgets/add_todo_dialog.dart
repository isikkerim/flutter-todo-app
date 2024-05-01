import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoappnotdatabaseinclude/controllers/checkbox_controller.dart';
import 'package:todoappnotdatabaseinclude/widgets/edit_todo_dialog.dart';
import '../models/todo.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController titleController = TextEditingController();
  final checkboxController = Get.put(CheckboxController());

  final TextEditingController contentController = TextEditingController();

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
                  borderSide:  BorderSide(color:Colors.pinkAccent.shade200),
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
                // Kullanıcıya ipucu veren metin
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color:Colors.pinkAccent.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(color:Colors.pinkAccent.shade200, width: 2.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0),
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
                controller.addTodo(todo);
                Get.back();
              },
              child: const Text("Add"),
            )
          ],
        ),
      ],
    );
  }
}
