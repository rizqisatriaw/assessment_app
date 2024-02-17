import 'package:assessment_app/src/domain/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

import 'configs/routes/main_page.dart';
import 'configs/routes/main_route.dart';
import 'configs/themes/main_theme.dart';

void main() async {
  await LocalStorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Assessment App',
          debugShowCheckedModeBanner: false,
          theme: mainTheme,
          defaultTransition: Transition.fadeIn,
          getPages: MainPage.main,
          initialRoute: MainRoute.login,
        );
      },
    );
  }
}
