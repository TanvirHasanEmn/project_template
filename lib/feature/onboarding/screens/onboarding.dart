import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/utility/app_colors.dart';
import '../controllers/onboarding_controller.dart';


class OnboardingPage extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());
  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {


    final List<OnboardingModel> pages = [
      OnboardingModel(
        image: 'assets/images/onboarding1.png',
        title: 'onboarding_title_1',
        subtitle: 'onboarding_description_1',
      ),
      OnboardingModel(
        image: 'assets/images/onboarding2.png',
        title: 'onboarding_title_2',
        subtitle: 'onboarding_description_2',
      ),
      OnboardingModel(
        image: 'assets/images/onboarding3.png',
        title: 'onboarding_title_3',
        subtitle: 'onboarding_description_3',
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView.builder(
          controller: controller.pageController,
          itemCount: pages.length,
          onPageChanged: controller.onPageChanged,
          itemBuilder: (context, index) {
            final page = pages[index];
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    page.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: CurvedClipper(),
                    child: Container(
                      height: 0.53.sh,
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 32.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30.h),
                          Text(
                            page.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            page.subtitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF7C8091),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          SmoothPageIndicator(
                            controller: controller.pageController,
                            count: pages.length,
                            effect: WormEffect(
                              dotHeight: 10.h,
                              dotWidth: 10.w,
                              spacing: 12.w,
                              dotColor: Colors.grey.shade300,
                              activeDotColor: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(height: 50.h),
                          SizedBox(
                            width: double.infinity,
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                              ),
                              onPressed: controller.nextPage,
                              child: Obx(() => Text(
                                controller.currentIndex.value == 2
                                    ? 'get_started_button'
                                    : 'next_button',
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

