import 'package:coffe_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  static ThemeData setLightMode() => ThemeData.light(useMaterial3: true).copyWith(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.deepBrown,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: AppColors.secondryColor,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: AppColors.primaryColor,
        ),
      );
}
