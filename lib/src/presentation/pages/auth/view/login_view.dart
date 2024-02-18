import 'package:assessment_app/configs/themes/color_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_form.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorThemes.white,
        body: Padding(
          padding: EdgeInsets.all(24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Title
                CustomText(
                  title: 'Login to Synapsis',
                  size: 21.sp,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 34.h),

                /// Form Email
                CustomText(
                  title: 'Email',
                  size: 13.sp,
                  weight: FontWeight.w400,
                  colorText: ColorThemes.lightColor,
                ),
                SizedBox(height: 4.h),
                CustomTextForm(
                  isPass: false,
                  obscure: false,
                  controller: controller.usernameController,

                  /// condition if use email validator
                  // validator: (email) {
                  //   final error = Validator.emailAddress(
                  //     value: email,
                  //   );
                  //   return error;
                  // },
                ),
                SizedBox(height: 16.h),

                /// Form Password
                CustomText(
                  title: 'Password',
                  size: 13.sp,
                  weight: FontWeight.w400,
                  colorText: ColorThemes.lightColor,
                ),
                SizedBox(height: 4.h),
                Obx(
                  () => CustomTextForm(
                    isPass: true,
                    obscure: controller.obscureText.value,
                    controller: controller.passwordController,

                    /// condition if use pass validator
                    // validator: (password) {
                    //   final error = Validator.password(
                    //     length: 6,
                    //     value: password,
                    //   );
                    //   return error;
                    // },
                    gestureDetector: GestureDetector(
                      child: Icon(
                        controller.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        controller.obscureText.toggle();
                      },
                    ),
                  ),
                ),

                /// CheckBox
                Row(
                  children: <Widget>[
                    Obx(
                      () => Checkbox(
                        checkColor: ColorThemes.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r))),
                        side: BorderSide(color: ColorThemes.hover),
                        visualDensity: VisualDensity.compact,
                        value: controller.isChecked.value,
                        onChanged: (value) {
                          controller.isChecked.value = value!;
                        },
                      ),
                    ),
                    CustomText(
                      title: 'Remember me',
                      size: 15.sp,
                      weight: FontWeight.w400,
                      colorText: ColorThemes.textColor,
                    )
                  ],
                ),
                SizedBox(height: 36.h),

                /// Button Login
                CustomButton(
                  onTap: () => controller.postLogin(),
                  isEnable: true,
                  isBorder: false,
                  title: 'Log in',
                ),
                SizedBox(height: 16.h),
                Center(
                  child: CustomText(
                    title: 'or',
                    size: 15.sp,
                    weight: FontWeight.w500,
                    colorText: ColorThemes.primaryColor,
                  ),
                ),
                SizedBox(height: 16.h),

                /// Button Fingerprint
                CustomButton(
                  onTap: () => controller.fingerPrint(),
                  isEnable: controller.isAuthenticated.value,
                  isBorder: true,
                  title: 'Fingerprint',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
