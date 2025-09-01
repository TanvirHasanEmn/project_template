import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utility/app_colors.dart';
import '../../../core/utility/imagePath.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
     const SplashScreen({super.key});

  //  final lang = Get.find<LocalizationController>();

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.gradient1,
              AppColor.gradient2,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 260.h, width: 10.w),
            Image.asset(
              ImagePath.splash,
              height: 178.h,
              width: 189.w,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10.h,),
            Text("ManosPro", style: GoogleFonts.inter(
               fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              color: Colors.white
            ),),
            Text( 'Splash', style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.white
            ),),

            Spacer(),
            SizedBox(
              height: 60.h,
              width: 60.w,
              child: SpinKitCircle(
                duration: const Duration(seconds: 3),
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 90.h,),
          ],
        ),
      ),
    );
  }
}
