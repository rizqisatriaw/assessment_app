import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/color_themes.dart';
import 'custom_text.dart';

class CustomItemGrid extends StatelessWidget {
  const CustomItemGrid({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          margin: EdgeInsets.zero,
          color: ColorThemes.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Center(
              child: CustomText(
                title: number ?? '',
                size: 18.sp,
                weight: FontWeight.w400,
                colorText: ColorThemes.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
