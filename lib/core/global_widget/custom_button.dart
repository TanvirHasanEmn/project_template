import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utility/app_colors.dart';


class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  final Widget? widget;
  final double? borderRadius;
  final bool loading;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.onPressed,
    this.widget,
    required this.text,
    this.borderRadius,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      loading
          ?  SpinKitFadingCircle(color: AppColor.primaryColor, size: 60.0)
          : ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          minimumSize: Size(width ?? 335.w, height ?? 52.h),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
