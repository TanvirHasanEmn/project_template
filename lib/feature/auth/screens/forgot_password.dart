import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_template/core/global_widget/custom_button.dart';
import 'package:project_template/core/global_widget/custom_testfield_prefix.dart';
import 'package:project_template/core/utility/app_colors.dart';
import 'package:project_template/feature/auth/screens/signin.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final controller = Get.put(ForgotPasswordController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
                SizedBox(height: 20.h),

                Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Reset your account password",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16.h),

                Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontGray,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWithIcon(
                  controller: controller.emailController,
                  hintText: "Enter your email",
                  prefixIconPath: "assets/icons/mail.png",
                ),
                SizedBox(height: 16.h),

                Text(
                  "New Password",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontGray,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWithIcon(
                  controller: controller.newPasswordController,
                  hintText: "Enter new password",
                  prefixIconPath: "assets/icons/lock.png",
                  isPasswordField: true,
                ),
                SizedBox(height: 30.h),

                CustomButton(
                  text: "Reset Password",
                  onPressed: () {
                    Get.to(()=> Signin());
                    if (_formKey.currentState!.validate()) {
                      controller.resetPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
