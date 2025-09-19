import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_template/core/global_widget/custom_button.dart';
import 'package:project_template/core/utility/app_colors.dart';
import 'package:project_template/feature/auth/screens/signup.dart';
import '../../../core/global_widget/custom_date_time_picker.dart';
import '../../../core/global_widget/custom_drop_down.dart';
import '../../../core/global_widget/custom_testfield_prefix.dart';
import '../../../core/validation/validator.dart';
import '../controller/signin_controller.dart';
import '../controller/signup_controller.dart';

class Signin extends StatelessWidget {
  final controller = Get.put(SigninController());
  Signin({super.key});
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
                  "Signin your account",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Signin your account",
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
                SizedBox(height: 10.h,),
                CustomTextFieldWithIcon(
                  validator: Validation().validateEmail,
                  hintText: "Email",
                  prefixIconPath: "assets/icons/mail.png",
                  controller: controller.emailController,
                ),
                SizedBox(height: 16.h),



                Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontGray,
                  ),
                ),
                SizedBox(height: 10.h,),
                CustomTextFieldWithIcon(
                  validator: Validation().validatePassword,
                  hintText: "Password",
                  prefixIconPath: "assets/icons/lock.png",
                  controller: controller.passwordController,
                  isPasswordField: true,
                ),
                SizedBox(height: 20.h),

                SizedBox(height: 25.h),

                CustomButton(text: "Next",

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      controller.onNextPressed();
                    }
                 },
                ),
                SizedBox(height: 60.h,),


                CustomButton(text: "Print DB",
                  onPressed: () {
                      controller.onPrint();
                  },
                ),
                SizedBox(height: 20.h),

                InkWell(
                  onTap: (){
                    Get.to(Signup());
                  },
                  child: Text(
                    "Signup",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.fontGray,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
