import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

CustomCircularProgressIndicator() {
  return Container(
      height: 80.h,
      width: 80.w,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: AppColors.primaryColor,
        strokeWidth: 2,
      ));
}
