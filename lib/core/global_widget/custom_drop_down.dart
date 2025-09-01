import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/app_colors.dart';


class CustomDropDown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropDown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xFFEDEEF4), // Border color
          width: 1, // Border width
        ),
      ),
      child: Center(
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey.shade600,
            size: 20.sp,
          ),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.grey.shade600,
          ),
          decoration: const InputDecoration(border: InputBorder.none),
          hint: Text(
            hintText,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          items:
          items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
