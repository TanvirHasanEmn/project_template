import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
as picker;

class CustomDateTimePicker extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback? onClick;

  const CustomDateTimePicker({
    super.key,
    this.hintText,
    this.controller,
    this.onClick,
  });

  Future<void> _pickDate(BuildContext context) async {
    picker.DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
      theme: picker.DatePickerTheme(
        headerColor: Colors.white,
        backgroundColor: Colors.white,
        itemStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        doneStyle: TextStyle(
          color: Colors.blue,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        cancelStyle: TextStyle(
          color: Colors.red,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      onConfirm: (date) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(date);
        controller?.text = formattedDate;

        if (onClick != null) {
          onClick!();
        }
      },
      currentTime: DateTime.now(),
      locale: picker.LocaleType.en,
    );
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

// CustomDateTimePicker(
//                   hintText: "Select Date",
//                   controller: controller.dateController,
//                   onClick: () {
//                     debugPrint("Date Selected: ${controller.dateController.text}");
//                   },
//                 ),