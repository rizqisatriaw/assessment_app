import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/color_themes.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isEnable,
    required this.isBorder,
  });

  final VoidCallback onTap;
  final String title;
  final bool isEnable;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return isBorder

        /// With Border
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isEnable
                    ? ColorThemes.primaryColor
                    : ColorThemes.lightColor,
              ),
              borderRadius: BorderRadius.circular(4.r),
              color: Colors.transparent,
            ),
            child: MaterialButton(
              onPressed: () => isEnable ? onTap() : null,
              minWidth: 0,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
              child: CustomText(
                title: title,
                size: 15.sp,
                weight: FontWeight.w600,
                colorText: isEnable
                    ? ColorThemes.primaryColor
                    : ColorThemes.lightColor,
              ),
            ),
          )

        /// Without Border
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color:
                  isEnable ? ColorThemes.primaryColor : ColorThemes.lightColor,
            ),
            child: MaterialButton(
              onPressed: () => isEnable ? onTap() : null,
              minWidth: 0,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
              child: CustomText(
                title: title,
                size: 15.sp,
                weight: FontWeight.w600,
                colorText: ColorThemes.white,
              ),
            ),
          );
  }
}
