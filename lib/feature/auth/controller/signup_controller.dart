import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ import Firebase Auth

import '../../../core/route/app_route.dart';
import '../../home/screen/home.dart';

class CreateAccountsiController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Login function
  Future<void> onNextPressed() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    debugPrint("Attempting login with Email: $email and Password: $password");

    try {
      // ✅ Try login
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint("✅ Login successful! User UID: ${userCredential.user?.uid}");
      Get.offAll(() => const Home());

    } on FirebaseAuthException catch (e) {
      debugPrint("❌ FirebaseAuthException: ${e.code} | ${e.message}");

      String message;
       if (e.code == 'invalid-credential') {
        message = "Invalid email or password. Please try again.";
      } else {
        message = "Login failed. ${e.message ?? ''}";
      }

      Get.snackbar(
        "Login Error",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      debugPrint("❌ Unknown error: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Try again later.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }




  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
//import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../../home/screen/home.dart';
//
// class CreateAccountsiController extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> onNextPressed() async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       Get.offAll(() => const Home());
//     } catch (_) {
//       // do nothing
//     }
//   }
//
//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.onClose();
//   }
// }