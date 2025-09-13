import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Reset Password function
  Future<void> onNextPressed() async {
    final email = emailController.text.trim();

    debugPrint("📩 Attempting password reset for Email: $email");

    try {
      await _auth.sendPasswordResetEmail(email: email);

      debugPrint("✅ Password reset email sent to: $email");

      Get.snackbar(
        "Success",
        "Password reset email has been sent to $email. Please check your inbox.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    } on FirebaseAuthException catch (e) {
      debugPrint("❌ FirebaseAuthException: ${e.code} | ${e.message}");

      String message;
      if (e.code == 'user-not-found') {
        message = "No account found with this email.";
      } else if (e.code == 'invalid-email') {
        message = "Invalid email address.";
      } else {
        message = "Failed to send reset email. ${e.message ?? ''}";
      }

      Get.snackbar(
        "Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );

    } catch (e) {
      debugPrint("❌ Unknown error: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
