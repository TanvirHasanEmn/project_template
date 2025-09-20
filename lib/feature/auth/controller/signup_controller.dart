import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_template/feature/auth/controller/signup_db_sqflite.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dateController = TextEditingController();
  RxString selectedCountry = ''.obs;

  void updateSelectedCountry(String? value) {
    selectedCountry.value = value ?? '';
  }

Future<void> onPrint() async {
  final users = await SignupDatabase.instance.getUsers();
  debugPrint("📂 All Users: $users");
}


  void onNextPressed() async {
    final email = emailController.text.trim();

    // Check if email already exists
    final exists = await SignupDatabase.instance.userExists(email);

    if (exists) {
      Get.snackbar(
        "Error",
        "User already Exist",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    final user = {
      'name': nameController.text,
      'email': email,
      'password': passwordController.text,
      'country': selectedCountry.value,
      'dob': dateController.text,
    };

    // Save into database
    await SignupDatabase.instance.createUser(user);

    // 🔥 Fetch again after insert
    final users = await SignupDatabase.instance.getUsers();

    Get.snackbar(
      "Success",
      "User created successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: Colors.white,
    );

    debugPrint("📂 All Users After Insert: $users");
  }


  // Future<void> onNextPressed() async {
  //   debugPrint("Full Name: ${nameController.text}");
  //   debugPrint("Email: ${emailController.text}");
  //   debugPrint("Password: ${passwordController.text}");
  //   debugPrint("DOB: ${dateController.text}");
  //   debugPrint("Country: ${selectedCountry.value}");
  //
  //
  //   //*sqflite integration
  // //   final user = {
  // //     'name': nameController.text,
  // //     'email': emailController.text,
  // //     'password': passwordController.text,
  // //     'country': selectedCountry.value,
  // //     'dob': dateController.text,
  // //   };
  // //
  // //   // Save into database
  // //   await SignupDatabase.instance.createUser(user);
  // //
  // //   debugPrint("✅ User saved in database: $user");
  // //
  // //   // (Optional) fetch all users to check
  // //   final users = await SignupDatabase.instance.getUsers();
  // //   debugPrint("📂 All Users: $users");
  // // }

  @override
  void onClose() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    dateController.clear();
    super.onClose();
  }
}
