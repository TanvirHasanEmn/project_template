import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utility/app_colors.dart';

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0XffFFFFFF),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    iconTheme: const IconThemeData(color: Color(0xff4C4C4C), size: 24),
    // inputDecorationTheme: const InputDecorationTheme(
    //   fillColor: Colors.white,
    //   filled: true,
    //   hintStyle: TextStyle(color: AppColors.lightGrey, fontSize: 16),
    //   border: OutlineInputBorder(borderSide: BorderSide.none),
    //   enabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.musicTabBorderDark)),
    //   focusedBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.lightPrimary)),
    //   errorBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.primaryPurple)),
    //   focusedErrorBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: AppColors.primaryPurple)),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //       fixedSize: const Size.fromWidth(double.maxFinite),
    //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       backgroundColor: AppColors.lightPrimary,
    //       foregroundColor: Colors.white),
    // ),
    // expansionTileTheme: ExpansionTileThemeData(
    //   shape: RoundedRectangleBorder(
    //     side: const BorderSide(color: Colors.transparent),
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    // ),
    textTheme: TextTheme(

      labelLarge: GoogleFonts.poppins(
          color: const Color(0xff262626),
          fontSize: 3.w,
          fontWeight: FontWeight.w600),

      labelMedium: GoogleFonts.poppins(
          color: const Color(0xff2D2D2D),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500),

      labelSmall: GoogleFonts.poppins(
          color: const Color(0xff636F85),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),

      titleLarge: GoogleFonts.poppins(
          color: const Color(0xff2D2D2D),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600),

      titleMedium: GoogleFonts.poppins(
          color: const Color(0xff2D2D2D),
          fontSize: 30.sp,
          fontWeight: FontWeight.w600),

      titleSmall: GoogleFonts.poppins(
          color: const Color(0xff2D2D2D),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),

      bodyLarge: GoogleFonts.poppins(
          color: const Color(0xff2D2D2D),
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
      bodyMedium: GoogleFonts.poppins(
          color: const Color(0xffFFFFFF),
          fontSize: 18.sp,
          fontWeight: FontWeight.w600),
      bodySmall: GoogleFonts.poppins(
          color: const Color(0xff636F85),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),
      headlineLarge: GoogleFonts.poppins(
          color: Colors.white, fontSize: 3.w, fontWeight: FontWeight.w400),
    ),
  );
}
