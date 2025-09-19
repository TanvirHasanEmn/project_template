import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_template/feature/auth/controller/signup_db_sqflite.dart';

import '../screens/home.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onPrint() async {
    final users = await SignupDatabase.instance.getUsers();
    debugPrint("📂 All Users: $users");
  }

  void onNextPressed() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final user = await SignupDatabase.instance.getUserByEmail(email);

    if (user == null) {
      // Email not found
      Get.snackbar(
        "Error",
        "User not found",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    if (user['password'] != password) {
      // Wrong password
      Get.snackbar(
        "Error",
        "Password not matched",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    // Success → go to HomeScreen
    Get.snackbar(
      "Success",
      "Login successful",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: Colors.white,
    );

    Get.offAll(() => const HomeScreen());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
