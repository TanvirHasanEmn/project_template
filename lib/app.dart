import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/binding/binding.dart';
import 'core/route/app_route.dart';
import 'core/theme/dart_theme.dart';
import 'core/theme/light_theme.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBinding(),
          debugShowCheckedModeBanner: false,
          title: 'Car Parking',
          theme: lightThemeData(),
          darkTheme: darkThemeData(),
          themeMode: ThemeMode.light,
          initialRoute: AppRoute.splash,
          getPages: AppRoute.route,
          locale: const Locale("en", "US"),
          fallbackLocale: const Locale("en", "US"),
        );
      },
    );
  }
}
