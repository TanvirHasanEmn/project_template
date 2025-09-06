import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountsiController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final testController = TextEditingController();
  final dateController = TextEditingController();
  RxString selectedCountry = ''.obs;

  void onNextPressed() {
    debugPrint("Full Name: ${nameController.text}");
    debugPrint("Email: ${emailController.text}");
    debugPrint("Password: ${passwordController.text}");
    debugPrint("Test: ${testController.text}");
    debugPrint("DOB: ${dateController.text}");
    debugPrint("Country: ${selectedCountry.value}");
  }

  void updateSelectedCountry(String? value) {
    selectedCountry.value = value ?? '';
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    testController.dispose();
    dateController.dispose();
    super.onClose();
  }
}
