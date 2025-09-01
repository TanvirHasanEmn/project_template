import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  final String hintText;

  const CustomContainer({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h, // Same height as CustomTextField
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB), // Same background color
        borderRadius: BorderRadius.circular(12), // Same border radius
        border: Border.all(
          color: const Color(0xFFEDEEF4), // Same border color
          width: 1, // Same border width
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w), // Same padding
      alignment: Alignment.centerLeft, // Align text to left
      child: Text(
        hintText,
        style: GoogleFonts.poppins(
          color: const Color(0xff1F2C37),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
