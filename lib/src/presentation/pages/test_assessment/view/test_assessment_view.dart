import 'dart:developer';

import 'package:assessment_app/configs/themes/color_themes.dart';
import 'package:assessment_app/src/presentation/pages/test_assessment/view/section/survey_question.dart';
import 'package:assessment_app/src/presentation/widgets/custom_button_icon.dart';
import 'package:assessment_app/src/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button.dart';
import '../controller/test_assessment_controller.dart';

class TestAssessmentView extends StatelessWidget {
  const TestAssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<TestAssessmentController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            color: ColorThemes.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            title: '45 Second Left',
                            onTap: () {},
                            isEnable: true,
                            isBorder: true,
                          ),
                          Obx(
                            () => CustomButtonIcon(
                              title: '${controller.indexQuestion.value + 1}/'
                                  '${controller.questionList.length.toString()}',
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    height: 1.sh,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        const SurveyQuestion(),
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          child: const Spacer(),
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  enableDrag: true,
                                  isScrollControlled: true,
                                  ignoreSafeArea: false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.w),
                        child: CustomText(
                          title: controller.testResponse?.data?.name ??
                              'Test Name',
                          size: 16.sp,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Obx(
                        () => CustomText(
                          title: controller
                                  .questionList[controller.indexQuestion.value]
                                  .questionName ??
                              '',
                          size: 16.sp,
                          weight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 14.h),
                    ],
                  ),
                ),
                Container(
                  color: ColorThemes.lightColor,
                  height: 8.h,
                  width: 1.sw,
                ),
                Padding(
                  padding: EdgeInsets.all(24.w),
                  child: CustomText(
                    title: 'Answer',
                    size: 15.sp,
                    weight: FontWeight.w500,
                  ),
                ),
                Container(
                  color: ColorThemes.lightColor,
                  height: 1.h,
                  width: 1.sw,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.currentQuestion.options?.length,
                      itemBuilder: (context, index) {
                        log(controller.currentQuestion.options?.length
                                .toString() ??
                            '');
                        return Obx(
                          () => controller.currentQuestion.type ==
                                  'multiple_choice'
                              ? RadioListTile(
                                  title: CustomText(
                                    title: controller.currentQuestion
                                            .options?[index].optionName ??
                                        '',
                                    size: 15.sp,
                                    weight: FontWeight.w400,
                                  ),
                                  value: controller
                                      .currentQuestion.options?[index],
                                  groupValue: controller.selectedOption.value,
                                  onChanged: (value) {
                                    value = controller
                                        .currentQuestion.options?[index];
                                  },
                                )
                              : Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        checkColor: ColorThemes.primaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.r))),
                                        side: BorderSide(
                                            color: ColorThemes.hover),
                                        visualDensity: VisualDensity.standard,
                                        value: controller.isChecked.value,
                                        onChanged: (value) {
                                          controller.isChecked.value = value!;
                                        },
                                      ),
                                      CustomText(
                                        title: controller.currentQuestion
                                                .options?[index].optionName ??
                                            '',
                                        size: 15.sp,
                                        weight: FontWeight.w400,
                                        colorText: ColorThemes.textColor,
                                      )
                                    ],
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomButton(
                          isEnable: true,
                          isBorder: true,
                          title: 'Back',
                          onTap: () {
                            if (controller.indexQuestion > 0) {
                              controller.indexQuestion.value -= 1;
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        flex: 3,
                        child: CustomButton(
                          isEnable: true,
                          isBorder: false,
                          title: 'Next',
                          onTap: () {
                            if (controller.indexQuestion <=
                                controller.questionList.length) {
                              controller.indexQuestion.value += 1;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
