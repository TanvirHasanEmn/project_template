import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure you have the screenutil package for responsive height

class CustomPasswordField extends StatelessWidget {
  RxBool isVisible = true.obs;

  final String hints;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomPasswordField(
      {super.key, required this.hints, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h, // Responsive height using ScreenUtil
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB), // Background color
        borderRadius: BorderRadius.circular(12), // Radius
        border: Border.all(
          color: const Color(0xFFEDEEF4), // Border color
          width: 1, // Border width
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => TextFormField(
                validator: validator,
                obscureText: isVisible.value,
                controller: controller,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                      color: Color(0xff1F2C37),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                  hintText: hints,
                  errorMaxLines: 3,
                  border: InputBorder.none, // Remove default border
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16), // Padding inside the field
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          InkWell(
            onTap: () {
              if (isVisible.value == true) {
                isVisible.value = false;
              } else {
                isVisible.value = true;
              }
            },
            child: Obx(
              () => isVisible == true
                  ? Icon(
                      Icons.visibility_off,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
            ),
          ),
          SizedBox(
            width: 18,
          ),
        ],
      ),
    );
  }
}
