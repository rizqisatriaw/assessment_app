import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/color_themes.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    required this.isPass,
    required this.obscure,
    required this.controller,
    this.gestureDetector,
    this.validator,
    this.onChange,
  }) : super(key: key);

  final bool isPass;
  final bool obscure;
  final GestureDetector? gestureDetector;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      onChanged: onChange,
      obscureText: isPass ? obscure : false,
      decoration: InputDecoration(
        suffixIcon: isPass ? gestureDetector : null,
        focusColor: ColorThemes.hover,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}
