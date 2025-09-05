import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_template/core/utility/app_colors.dart';
class CustomTextFieldWithIcon extends StatelessWidget {
  final String? hintText;
  final String? prefixIconPath;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CustomTextFieldWithIcon({
    super.key,
    this.hintText,
    this.validator,
    this.prefixIconPath,
    this.isPasswordField = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool localPasswordHidden = true.obs;

    InputDecoration baseDecoration({Widget? suffix}) {
      return InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 15.sp,
        ),
        hoverColor: AppColor.primaryColor,

        errorStyle: GoogleFonts.poppins(
          color: Colors.redAccent,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),

        prefixIcon: prefixIconPath != null
            ? Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(prefixIconPath!, width: 20.w, height: 20.w),
        )
            : null,
        contentPadding: prefixIconPath == null
            ? EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h)
            : null,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      );
    }

    if (isPasswordField) {
      return Obx(() => TextFormField(
        controller: controller,
        obscureText: localPasswordHidden.value,
        validator: validator, // <-- This will now work
        style: GoogleFonts.poppins(
          color: const Color(0xFF545D71),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        decoration: baseDecoration(
          suffix: GestureDetector(
            onTap: () => localPasswordHidden.value =
            !localPasswordHidden.value,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Image.asset(
                localPasswordHidden.value
                    ? "assets/icons/eye_off.png"
                    : "assets/icons/eye.png",
                width: 20.w,
                height: 20.w,
              ),
            ),
          ),
        ),
      ));
    } else {
      return TextFormField(
        controller: controller,
        validator: validator, // <-- This will now work
        style: GoogleFonts.poppins(
          color: const Color(0xFF636F85),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        decoration: baseDecoration(),
      );
    }
  }
}


// CustomTextFieldWithIcon(
//                   validator: Validation().validatePassword,
//                   hintText: "Password",
//                   prefixIconPath: "assets/icons/lock.png",
//                   controller: controller.passwordController,
//                   isPasswordField: true,
//                 ),