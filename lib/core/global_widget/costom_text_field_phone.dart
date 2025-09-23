import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../utility/app_colors.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? initialCountryCode;

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.onChanged,
    this.initialCountryCode = "IN", // default to India
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: IntlPhoneField(
        controller: controller,
        initialCountryCode: initialCountryCode,
        disableLengthCheck: true,
        decoration: InputDecoration(
          hintText: "Enter your phone",
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: AppColor.fontGray,
          ),
        ),
        onChanged: (PhoneNumber phone) {
          if (onChanged != null) {
            onChanged!(phone.completeNumber);
          }
        },
      ),
    );
  }
}
// CustomPhoneField(controller: controller.phoneController),

// final phoneController = TextEditingController();
//   RxString fullPhoneNumber = "".obs;
//
//   void onNextPressed() {
//     debugPrint("Phone Number: ${fullPhoneNumber.value}");
//   }


