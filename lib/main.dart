import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:islamic_unveristy/services/local_data/share_pref.dart';
import 'package:islamic_unveristy/shared/binding.dart';
import 'package:islamic_unveristy/shared/constant.dart';
import 'package:islamic_unveristy/utils/languages/translation.dart';
import 'package:islamic_unveristy/utils/themes/light_theme.dart';

import 'moduls/auth/view/screen/begin_screen.dart';

void main() async {
  runApp(const MyApp());
  await SharePref.init();
  token = await SharePref.getData(key: 'token');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, s) => GetMaterialApp(
        smartManagement: SmartManagement.onlyBuilder,
        initialBinding: MainBinding(),
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        translations: Messages(),
        locale: Locale(lang!),
        fallbackLocale: Locale(lang!),
        home: BeginScreen(),
      ),
    );
  }
}
