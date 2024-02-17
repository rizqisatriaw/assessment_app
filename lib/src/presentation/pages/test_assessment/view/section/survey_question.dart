import 'package:assessment_app/configs/themes/color_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_item_grid.dart';
import '../../../../widgets/custom_text.dart';
import '../../controller/test_assessment_controller.dart';

class SurveyQuestion extends StatelessWidget {
  const SurveyQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TestAssessmentController controller =
        Get.put(TestAssessmentController());

    return Container(
      color: ColorThemes.white,
      child: Padding(
        padding: EdgeInsets.only(top: 32.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            CustomText(
              title: 'Survei Question',
              size: 18.sp,
              weight: FontWeight.w500,
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              height: 2.h,
              color: ColorThemes.lightColor,
            ),
            GridView.builder(
              padding: EdgeInsets.only(top: 18.h, bottom: 24.h),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.w,
              ),
              itemCount: controller.number.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.number[index];
                return CustomItemGrid(
                  number: item.toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
