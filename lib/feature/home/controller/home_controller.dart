import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/route/app_route.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    try {
      await _auth.signOut();
      debugPrint("✅ User logged out successfully");

      Get.offAllNamed(AppRoute.signin);
    } catch (e) {
      debugPrint("❌ Logout error: $e");
      Get.snackbar(
        "Logout Failed",
        "Something went wrong while logging out.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
