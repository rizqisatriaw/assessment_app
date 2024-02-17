import 'package:assessment_app/configs/constants/assets_const.dart';
import 'package:assessment_app/configs/extenssion/date_format.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/color_themes.dart';
import 'custom_text.dart';

class CustomItemList extends StatelessWidget {
  const CustomItemList({
    Key? key,
    required this.image,
    required this.title,
    required this.createDate,
    this.lastDate,
  }) : super(key: key);

  final String image;
  final String title;
  final String createDate;
  final String? lastDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: ColorThemes.lightColor),
        color: ColorThemes.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 18.w),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 54.w,
                height: 54.w,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    Image.asset(AssetsConst.surveyImage),
                progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator(),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  CustomText(
                    title: title,
                    size: 14.sp,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(height: 8.h),

                  /// Create Date
                  CustomText(
                    title: 'Created At : ${createDate.toGeneralDate()}',
                    size: 12.sp,
                    weight: FontWeight.w500,
                    colorText: ColorThemes.greenTextColor,
                  ),
                  SizedBox(height: 8.h),

                  /// Last Download Date
                  CustomText(
                    title:
                        'Last Download : ${lastDate?.toGeneralDate() ?? '-'}',
                    size: 12.sp,
                    weight: FontWeight.w500,
                    colorText: ColorThemes.greenTextColor,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.file_download_outlined),
              color: ColorThemes.black,
              iconSize: 24.sp,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
