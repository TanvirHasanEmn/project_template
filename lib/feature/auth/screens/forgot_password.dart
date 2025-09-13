import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_template/core/global_widget/custom_button.dart';
import 'package:project_template/core/utility/app_colors.dart';
import '../../../core/global_widget/custom_testfield_prefix.dart';
import '../../../core/validation/validator.dart';
import '../controller/forgot_password_controller.dart';
import '../controller/signin_controller.dart';

class ForgotPassword extends StatelessWidget {

  ForgotPassword({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
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
                  "Reset Your Password",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Enter Your E-mail to reset Your Password",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 25.h),




                Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontGray,
                  ),
                ),
                SizedBox(height: 10.h,),
                CustomTextFieldWithIcon(
                  validator: Validation().validateEmail,
                  hintText: "Email",
                  prefixIconPath: "assets/icons/mail.png",
                  controller: controller.emailController,
                ),
                SizedBox(height: 60.h),




                CustomButton(text: "Sign in",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.onNextPressed();
                    }
                  },
                ),
                SizedBox(height: 30.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
