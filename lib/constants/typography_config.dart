import 'package:flutter/material.dart';
import 'package:login_screen_teste/constants/color_theme.dart';
import 'package:login_screen_teste/constants/responsive_utils.dart';

class TypographyConfig {
  final ResponsiveUtils responsiveUtils = ResponsiveUtils();

  TextTheme getTextTheme (BuildContext context) {
    return TextTheme(
      titleSmall: TextStyle(
        fontSize: 24 * responsiveUtils.getTextScale(context), 
        color: ColorTheme.white
      ),
      bodyMedium: TextStyle(
        color: ColorTheme.grey, 
        fontSize: 20 * responsiveUtils.getTextScale(context), 
        fontWeight: FontWeight.w400
      ),
      bodySmall: TextStyle(
        color: ColorTheme.white, 
        fontSize: 16 * responsiveUtils.getTextScale(context)
      ),
      bodyLarge: TextStyle(
        color: ColorTheme.white, 
        fontSize: 18 * responsiveUtils.getTextScale(context)
        ),
        displaySmall: TextStyle(
          color: ColorTheme.white, 
          fontSize: 16 * responsiveUtils.getTextScale(context)
        ),
    );
  }
}