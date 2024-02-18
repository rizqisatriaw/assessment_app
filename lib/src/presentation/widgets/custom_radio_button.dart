import 'package:assessment_app/src/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.title,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final int groupValue;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: CustomText(
            title: title,
            size: 15.sp,
            weight: FontWeight.w400,
          ),
          value: 1,
          groupValue: groupValue,
          onChanged: (value) => onChanged,
        ),
        RadioListTile(
          title: CustomText(
            title: title,
            size: 15.sp,
            weight: FontWeight.w400,
          ),
          value: 2,
          groupValue: groupValue,
          onChanged: (value) => onChanged,
        ),
        RadioListTile(
          title: CustomText(
            title: title,
            size: 15.sp,
            weight: FontWeight.w400,
          ),
          value: 3,
          groupValue: groupValue,
          onChanged: (value) => onChanged,
        ),
        RadioListTile(
          title: CustomText(
            title: title,
            size: 15.sp,
            weight: FontWeight.w400,
          ),
          value: 4,
          groupValue: groupValue,
          onChanged: (value) => onChanged,
        ),
      ],
    );
  }
}
