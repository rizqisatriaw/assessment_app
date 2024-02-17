import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/color_themes.dart';
import 'custom_text.dart';

class CustomButtonList extends StatelessWidget {
  const CustomButtonList({
    super.key,
    required this.title,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: ColorThemes.black,
      ),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: 0,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.list_alt_outlined,
              color: ColorThemes.white,
              size: 20.sp,
            ),
            SizedBox(height: 2.h),
            CustomText(
              title: title,
              size: 15.sp,
              weight: FontWeight.w600,
              colorText: ColorThemes.white,
            ),
          ],
        ),
      ),
    );
  }
}
