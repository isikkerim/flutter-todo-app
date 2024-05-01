import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              const HomePage(),
              transition: Transition.zoom,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds:750),
            );
          },
          child: const Text('log in anonymously'),
        ),
      ),
    );
  }
}
