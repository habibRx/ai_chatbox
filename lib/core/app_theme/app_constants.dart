
import 'package:ed_chat/core/app_theme/sizes.dart';
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'DashStitch';
  static const String ecobookName = 'Ecobook';
  static const String appDomain = 'https://ecomoto.io';
  static const String appHostName = 'ecomoto.io';
  static const String appDescription = 'Vehicle Rental';
  static const double viewPaddingHorizontal = AppSizes.size16;
  static const double viewPaddingGrid = AppSizes.size10;
  static const double viewPaddingVertical = AppSizes.size20;
  static const double smallPaddingVertical = AppSizes.size10;
  static const double transactionTimeout = 120;
  static const double transactionConfirmationTimeout = 120;
  static const double scrollUnderElevation = 5;
  static const String appErrorMessage = 'Please try again';
  static const String rentVehicleErrorMessage =
      'You cannot rent a vehicle because you do not meet the minimum age requirement.';
  static const String rentOwnVehicleErrorMessage =
      'Oops! You cannot rent a vehicle that you own. Please choose a different vehicle to proceed.';

  static const String appCurrency = "\$";
  static const double distanceToUnlockVehicle = 15.0;
  static const double endTripParkingLocationRadius = 20;
  static const double endTripParkingLocation = 30;

  static const double authenticationMaxWidth = 660.0;
  static const double viewMaxWidth = 660.0;

  static const double estimatedAverageEfficiency = 3.5;

  static const double fabPadding = 20.0;
  static const bool isManualDriverLicenseVerification = true;

  static const Duration vehicleVideoDuration = Duration(minutes: 1);
  static const Duration feedVideoDuration = Duration(minutes: 3);
  static const int maximumVideoFileSizeMB = 15;
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: AppSizes.size10,
    vertical: AppSizes.size12,
  );

  static const int minVehicleImages = 6;
  static const double borderRadiusLarge = 25;
  static const double borderRadius = 10.0;
  static const double borderRadiusSmall = 5.0;
  static const double borderRadiusMedium = 8.0;

  static const String newToWeb3 = "https://hbr.org/2022/05/what-is-web3";
  static const String privacyPolice =
      "https://ecomoto-mu.vercel.app/policies/privacy-policy";
  static const String termsOfUse =
      "https://ecomoto-mu.vercel.app/policies/terms-of-service";

  static const int vehicleListingDefaultMinimumPrice = 10;
  static const int vehicleListingDefaultMaximumPrice = 30;

  static const List<String> tripCancellationReasons = [
    "I don't need the vehicle anymore",
    "My Appointment got cancelled",
    "My schedule changed",
    "Others"
  ];

  static const String contactUs =
      "Call us at +1(555) 666-7788(M-F, 10:00am-6:00pm ET)";
  static const String disconnectGeneratedWalletWarning =
      "By disconnecting this generated wallet, you will no longer be able to use it on Ecomoto. To use this wallet again, you'll need to import it with a wallet provider like Metamask or Trust Wallet. Please ensure that you have the wallet information file downloaded on your device, as you will need it to import your wallet with other wallet providers. If you haven't done that yet, cancel this action and click the 'Wallet Info' button below. If you understand this and wish to continue disconnecting your wallet, you can click 'Continue'.";
}
