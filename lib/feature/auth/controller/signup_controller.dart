import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountsiController extends GetxController {
  // Controllers for textfields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final testController = TextEditingController();
  final TextEditingController dateController = TextEditingController();


  void onNextPressed() {
    debugPrint("Full Name: ${nameController.text}");
    debugPrint("Email: ${emailController.text}");
    debugPrint("Password: ${passwordController.text}");
    debugPrint("Test: ${testController.text}");
    debugPrint("DOB : ${dateController.text}");
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
