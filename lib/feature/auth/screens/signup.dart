import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_template/core/global_widget/custom_button.dart';
import 'package:project_template/core/utility/app_colors.dart';
import '../../../core/global_widget/custom_date_time_picker.dart';
import '../../../core/global_widget/custom_testfield_prefix.dart';
import '../../../core/validation/validator.dart';
import '../controller/signup_controller.dart';

class SigninScreen extends StatelessWidget {
  final controller = Get.put(CreateAccountsiController());
  SigninScreen({super.key});
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
                  "Create Your Account",
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Create account and enjoy all services",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 25.h),
                Text(
                  "Name",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontGray,
                  ),
                ),
                SizedBox(height: 10.h,),
                CustomTextFieldWithIcon(
                  validator: Validation().validateName,
                  hintText: "Full name",
                  prefixIconPath: "assets/icons/user.png",
                  controller: controller.nameController,
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

                Text(
                  "Nothing",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.fontGray,
                  ),
                ),
                SizedBox(height: 10.h,),
                CustomTextFieldWithIcon(
                  hintText: " Test Field",
                  controller: controller.testController,
                ),

                SizedBox(height: 25.h),


                CustomDateTimePicker(
                  hintText: "Select Date",
                  controller: controller.dateController,
                  onClick: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    // if (pickedDate != null) {
                    //   // Format the picked date if needed
                    //   String formattedDate = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                    //   dateController.text = formattedDate;
                    // }
                  },
                ),

                SizedBox(height: 25.h),

                CustomButton(text: "Next",

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      controller.onNextPressed();
                    }
                 },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
