import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_template/feature/auth/controller/signup_db_sqflite.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();

  Future<void> resetPassword() async {
    final email = emailController.text.trim();
    final newPassword = newPasswordController.text.trim();

    if (email.isEmpty || newPassword.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final users = await SignupDatabase.instance.getUsers();
    final user = users.firstWhere(
          (u) => u['email'] == email,
      orElse: () => {},
    );

    if (user.isEmpty) {
      Get.snackbar("Error", "User not found",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Update password in DB
    await SignupDatabase.instance.updatePassword(email, newPassword);

    Get.snackbar("Success", "Password updated successfully",
        snackPosition: SnackPosition.BOTTOM);

    emailController.clear();
    newPasswordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }
}
