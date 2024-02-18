import 'package:assessment_app/configs/routes/main_route.dart';
import 'package:assessment_app/src/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../../../../configs/themes/color_themes.dart';
import '../../../widgets/custom_item_list.dart';
import '../../../widgets/custom_text.dart';
import '../controllers/list_assessment_controller.dart';

class ListAssessmentView extends StatelessWidget {
  const ListAssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ListAssessmentController.to;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorThemes.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StickyHeader(
                    header: Container(
                      alignment: Alignment.centerLeft,
                      width: Get.width,
                      color: ColorThemes.white,
                      child: Column(
                        children: [
                          SizedBox(height: 24.w),
                          CustomText(
                            title: 'Halaman Assessment',
                            size: 17.sp,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(height: 24.w),
                        ],
                      ),
                    ),
                    content: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = controller.assessmentList[index];
                        return CustomItemList(
                          onTap: () => Get.toNamed(
                            MainRoute.testAssessment,
                            arguments: item.id,
                          ),
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
                    SizedBox(height: 16.h),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
