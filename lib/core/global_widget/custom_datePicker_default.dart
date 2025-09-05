import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDatePickerDefault extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback? onClick;

  const CustomDatePickerDefault({
    super.key,
    this.hintText,
    this.controller,
    this.onClick,
  });

  Future<void> _pickDate(BuildContext context) async {
    DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Default body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                textStyle: TextStyle(
                  fontSize: 16.sp, // ✅ OK / Cancel font size
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            textTheme: TextTheme(
              // 📌 Calendar header (month & year)
              headlineMedium: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              // 📌 Days of week labels (S, M, T…)
              titleMedium: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              // 📌 Day numbers (1,2,3…)
              bodyLarge: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller?.text = formattedDate;

      if (onClick != null) {
        onClick!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFEDEEF4),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () => _pickDate(context),
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.calendar_month, color: Colors.grey),
          hintStyle: GoogleFonts.poppins(
            color: const Color(0xff1F2C37),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        ),
      ),
    );
  }
}


//* Uses

// CustomDatePickerDefault(
//                   hintText: "Select Date",
//                   controller: controller.dateController,
//                   onClick: () {
//                     debugPrint("Date Selected: ${controller.dateController.text}");
//                   },
//                 ),