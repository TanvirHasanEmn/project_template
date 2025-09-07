import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/route/app_route.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 400.h),
          Center(
            child: CustomButton(
              text: "Logout",
              onPressed: () {
                controller.logout();
              },
              // onPressed: () async {
              //   try {
              //     await FirebaseAuth.instance.signOut();
              //     debugPrint("✅ User logged out successfully");
              //
              //     Get.offAllNamed(AppRoute.signin);
              //   } catch (e) {
              //     debugPrint("❌ Logout error: $e");
              //     Get.snackbar(
              //       "Logout Failed",
              //       "Something went wrong while logging out.",
              //       snackPosition: SnackPosition.BOTTOM,
              //       backgroundColor: Colors.redAccent,
              //       colorText: Colors.white,
              //     );
              //   }
              // },
            ),
          ),
        ],
      ),
    );
  }
}
