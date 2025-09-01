import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure you have the screenutil package for responsive height

class CustomDateTimePicker extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Function onClick;

  const CustomDateTimePicker({
    Key? key,
    this.hintText,
    this.controller,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFEDEEF4),
          width: 1, // Border width
        ),
      ),
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                onClick();
              },
              icon: Icon(Icons.calendar_month)),
          hintStyle: GoogleFonts.poppins(
              color: Color(0xff1F2C37),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          hintText: hintText,
          border: InputBorder.none,
          contentPadding:
            EdgeInsets.all(10)
        ),
      ),
    );
  }
}
