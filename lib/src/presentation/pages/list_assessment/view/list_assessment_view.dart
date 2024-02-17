import 'package:assessment_app/src/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../configs/themes/color_themes.dart';
import '../../../widgets/custom_item_list.dart';
import '../../../widgets/custom_text.dart';
import '../controllers/list_assessment_controller.dart';

class ListAssessmentView extends StatelessWidget {
  const ListAssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ListAssessmentController.to;
    return Scaffold(
      backgroundColor: ColorThemes.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 44.h),
                CustomText(
                  title: 'Halaman Assessment',
                  size: 17.sp,
                  weight: FontWeight.w500,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = controller.assessmentList[index];
                    return CustomItemList(
                      image: item.image ?? '',
                      title: item.name ?? '-',
                      createDate: item.assessmentDate ?? '-',
                      lastDate: item.updatedAt ?? '-',
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.h,
                  ),
                  itemCount: controller.assessmentList.length,
                ),
                if (controller.isLoading.value) ...[
                  SizedBox(height: 16.h),
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
                if (controller.isLoadMore) ...[
                  SizedBox(height: 16.h),
                  Center(
                    child: CustomButton(
                      title: 'Load More',
                      isEnable: true,
                      onTap: () => controller.fetchListAssessment(),
                      isBorder: false,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
