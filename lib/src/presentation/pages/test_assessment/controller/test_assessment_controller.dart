import 'package:get/get.dart';

import '../../../../../configs/themes/color_themes.dart';

class TestAssessmentController extends GetxController {
  static TestAssessmentController get to => Get.find();

  /// Number
  final List<int> number = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];

  Future<void> getNumberAssessment() async {
    var data = number;
    if (data != []) {
      number.addAll(data);
    } else {
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.white,
      );
    }
  }
}
