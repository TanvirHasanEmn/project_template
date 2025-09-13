import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Signup function
  Future<void> onNextPressed() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmpassword = confirmpasswordController.text.trim();

    debugPrint("=============== SIGNUP STARTED ===============");
    debugPrint("Entered Email: $email");
    debugPrint("Entered Password: $password");
    debugPrint("Entered Confirm Password: $confirmpassword");

    if (password != confirmpassword) {
      debugPrint("❌ Passwords do not match!");
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    try {
      debugPrint("👉 Creating user with FirebaseAuth...");
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        debugPrint("✅ User created successfully: ${user.uid}");

        if (!user.emailVerified) {
          debugPrint("📧 Sending email verification...");
          await user.sendEmailVerification();
          Get.snackbar(
            "Verification Email Sent",
            "Please check your inbox and verify your email before logging in.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
          );
        } else {
          debugPrint("⚡ User email already verified.");
        }
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("❌ FirebaseAuthException: ${e.code} - ${e.message}");
      String errorMessage = "Something went wrong";
      if (e.code == 'weak-password') {
        errorMessage = "The password is too weak.";
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "The account already exists for this email.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is invalid.";
      }

      Get.snackbar(
        "Signup Failed",
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      debugPrint("❌ Unknown error during signup: $e");
      Get.snackbar(
        "Error",
        "An unexpected error occurred",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }

    debugPrint("=============== SIGNUP ENDED ===============");
  }
}
