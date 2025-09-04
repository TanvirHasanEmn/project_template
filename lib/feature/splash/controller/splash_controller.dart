import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/route/app_route.dart';
import '../../auth/screens/signup.dart';
import '../../onboarding/screens/onboarding.dart';

class SplashController extends GetxController {
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
  void startTimer() {
    timer = Timer(const Duration(seconds: 1), () {
      decideNextScreen();
    });
  }

  Future<void> decideNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('is_first_time') ?? true;

    if (isFirstTime) {
      await prefs.setBool('is_first_time', false);
      Get.offAllNamed(AppRoute.signin);
    } else {
      final token = prefs.getString('accessToken');
      final role = prefs.getString('userRole') ?? 'client';

      if (token == null || token.isEmpty) {
        //Get.offAll(() => SignInScreen());
        Get.offAllNamed(AppRoute.signin);
      } else {
        // Redirect based on role (case insensitive)
        if (role.toString().toLowerCase() == 'client') {
          // Get.offAll(() => NavBar());
        } else if (role.toString().toLowerCase() == 'worker') {
          // Get.offAll(() => NavBarOperator());
        } else {
          Get.snackbar('Error', 'Unknown role: $role');
        }

      }
    }
  }
  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
