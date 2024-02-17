import 'package:assessment_app/configs/themes/color_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_button.dart';
import 'section/survey_question.dart';

class TestAssessmentView extends StatelessWidget {
  const TestAssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.h),
      color: ColorThemes.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomButton(
                title: '45 Second Left',
                onTap: () {},
                isEnable: true,
                isBorder: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
