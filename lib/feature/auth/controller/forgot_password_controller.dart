import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ import Firebase Auth

import '../../../core/route/app_route.dart';
import '../../home/screen/home.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Login function
  Future<void> onNextPressed() async {
    final email = emailController.text.trim();

    debugPrint("Attempting login with Email: $email");
  }

}