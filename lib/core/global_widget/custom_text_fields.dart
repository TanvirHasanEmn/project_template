import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure you have the screenutil package for responsive height

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool isReadonly;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.validator,
    this.controller,
    this.isReadonly = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

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
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        readOnly: isReadonly,
        decoration: InputDecoration(
            hintStyle: GoogleFonts.poppins(
                color: Color(0xff1F2C37),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            hintText: hintText,
            border: InputBorder.none, // Remove default border
            contentPadding: EdgeInsets.all(10) // Padding inside the field
            ),
      ),
    );
  }
}
