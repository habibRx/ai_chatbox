
import 'package:ed_chat/core/app_theme/sizes.dart';
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'EduChat AI';
  static const String appDomain = '';
  static const String appHostName = '';
  static const String appDescription = 'AI ChatBot';
  static const double viewPaddingHorizontal = AppSizes.size16;
  static const double viewPaddingGrid = AppSizes.size10;
  static const double viewPaddingVertical = AppSizes.size20;
  static const double smallPaddingVertical = AppSizes.size10;
  static const double scrollUnderElevation = 5;
  static const String appErrorMessage = 'Please try again';
  static const String appCurrency = "\$";
  static const double authenticationMaxWidth = 660.0;
  static const double viewMaxWidth = 660.0;
  static const double estimatedAverageEfficiency = 3.5;
  static const double fabPadding = 20.0;

  static const int maximumVideoFileSizeMB = 15;
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: AppSizes.size10,
    vertical: AppSizes.size12,
  );

  static const double borderRadiusLarge = 25;
  static const double borderRadius = 10.0;
  static const double borderRadiusSmall = 5.0;
  static const double borderRadiusMedium = 8.0;
  static const String privacyPolice =
      "https://ecomoto-mu.vercel.app/policies/privacy-policy";
  static const String termsOfUse =
      "https://ecomoto-mu.vercel.app/policies/terms-of-service";

  static const String contactUs =
      "Call us at +1(555) 666-7788(M-F, 10:00am-6:00pm ET)";
}
