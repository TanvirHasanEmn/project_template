import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/route/app_route.dart';
import '../../home/screen/home.dart';

class CreateAccountsiController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  void onNextPressed() {
    debugPrint("Email: ${emailController.text}");
    debugPrint("Password: ${passwordController.text}");

    //Get.offAllNamed(AppRoute.home);
    Get.to(()=> Home());

  }

  @override
  void onClose() {
    emailController.clear();
    passwordController.clear();
    super.onClose();
  }
}
