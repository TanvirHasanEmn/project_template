import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_template/core/global_widget/custom_button.dart';
import 'package:project_template/core/utility/app_colors.dart';
import 'package:project_template/feature/auth/screens/signup.dart';
import '../../../core/global_widget/custom_testfield_prefix.dart';
import '../../../core/validation/validator.dart';
import '../controller/signin_controller.dart';
import 'forgot_password.dart';

class SigninScreen extends StatelessWidget {

  SigninScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SigninController());
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
                  "Login Your Account",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Login and enjoy all services",
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

                SizedBox(height: 20.h,),

                //* Forget Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() => ForgotPassword());
                      },
                      child: Text("Forgot Password",
                          style: GoogleFonts.poppins(
                            color: AppColor.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),


                CustomButton(text: "Sign in",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      controller.onNextPressed();
                    }
                 },
                ),
                SizedBox(height: 30.h),
                CustomButton(text: "Sign in with google",
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {
                      controller.onNextPressed();
                    }
                  },
                ),

                SizedBox(height: 80.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(() => SignupScreen());
                      },
                      child: Text("-----------SignUp-----------",
                        style: GoogleFonts.poppins(
                          color: AppColor.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
