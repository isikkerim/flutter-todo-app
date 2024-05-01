import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../controllers/theme_controller.dart';
import '../controllers/todo_controller.dart';
import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final textController = TextEditingController();

class _HomePageState extends State<HomePage> {
  final controller = Get.put(TodoController());
  final themeController = Get.put(ThemeController());

  @override
  void initState() {
    controller.getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Obx(
          () => Text(themeController.currentTheme.value == ThemeMode.dark
              ? "Dark Theme"
              : "Light Theme"),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(
                () => Switch(
                  value: themeController.currentTheme.value == ThemeMode.dark,
                  onChanged: (value) {
                    themeController.switchTheme();
                    Get.changeThemeMode(themeController.currentTheme.value);
                  },
                ),
              ))
        ],
      ),
      body: GetBuilder<TodoController>(builder: (controller) {
        return controller.isPermissionDenied.value == false
            ? Column(
                children: [
                  Expanded(
                    child: GetBuilder<TodoController>(
                      assignId: true,
                      builder: (logic) {
                        return ListView.builder(
                          itemCount: logic.todos.length,
                          itemBuilder: (context, index) {
                            return TodoCard(index);
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Center(
                child: Text("izinleri kontrol edin"),
              );
      }),
      floatingActionButton: controller.isPermissionDenied.value == false
          ? FloatingActionButton(
              onPressed: () {
                Get.dialog(
                  TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 200),
                    builder:
                        (BuildContext context, double value, Widget? child) {
                      return Transform.rotate(
                        angle: value * 2 * pi,
                        child: const AddTodoDialog(),
                      );
                    },
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : Container(),
    );
  }
}
