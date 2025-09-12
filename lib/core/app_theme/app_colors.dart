/*
  Define all the custom colors used across the app
 */

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();


  static const primaryColor = Color(0xFFD4AF37); // Gold
  static const secondaryColor = Color(0xFFF66B6B); // Black
  static const accentColor = Color(0xFFE6B31E); // Amber

  static const editAddressButtonColor = Color(0xFFF80000);
  // Backgrounds
  static const darkScaffold = Color(0xFF121212);
  static const lightScaffold = Color(0xFFD4AF37);

  // Text
  static const darkText = Color(0xFFFFFFFF);
  static const lightText = Color(0xFF000000);
  static const subtleTextDark = Color(0xFFB0B0B0);
  static const subtleTextLight = Color(0xFF555555);

  // States
  static const successColor = Color(0xFF00B894);
  static const errorColor = Color(0xFFD63031);
  // static const darkScaffold = Color(0xFF000000);
  static const postBackgroundColor = Color(0xFFF8FAFC);

  static const headlineTextColor = Color(0xFF1A1A1A);
  static const lowOpacityTextColor = Color(0xFF7A8D9C);
  static const postTextColor = Color(0xFF4E5D6A);

  // static const successColor = Color(0xFF00B894);
  // static const errorColor = Color(0xFFD63031);
  static const lightErrorColor = Color(0xFFFFDAD6);

  static const disabledColor = Color(0xFFE0E0E0);
  static const lightGreyBorderColor = Color(0xFFF1F1F1);
  static const inActiveBottomNavigationColor = Color(0x96B0BEC5);
  static const activeBottomNavigationColor = Color(0xFF00E6B8);

  static const lightGreenBorderColor = Color(0xFFCFF1E6);
  static const checkBoxColor = Color(0xFF44CE6F);

  static const disabledLightColor = Color(0xFFF9D2DA);

  static const hyperLinkColor = Color(0xFF065AFF);
  static const lightPurple = Color(0xFF5F4AE5);
  static const lightPurpleSecondary = Color(0xFFD2CCFA);

  static const registerFormColor = Color(0x12263238);


  static const primaryLight = Color.fromARGB(255, 116, 132, 154);
  static const primaryDark = Color(0xFF596780);
  static const lightGreyColor = Color(0xFFD3D3D3);
  static const darkGreyColor = Color(0xFF717171);
  static const darkGreyColor2 = Color(0xFFD9D9D9);

  static const inactiveToggleButtonColor = Color(0xFFB9B9B9);

  static const rentalUsedColor = Color(0xFF18428C);
  static const rentalDateViewColor = Color(0xFF18428C);

  static Color privacyBackgroundColor =
      const Color(0xFF215759).withOpacity(.10);

  static const colorBlack = Colors.black;
  static const ratingColor = Color(0xFFFBAD39);

  static const searchBarColor = Color(0xFFF5F7FA);

  static const rentActiveColor = Color(0xFFDCA80D);
  static const rentActiveColorLight = Color(0xFFFAF5E5);

  static const rentCompletedColor = Color(0xFF13E060);
  static const rentCompletedColorLight = Color(0xFFE4FFF1);

  static const activeTabColor = Color(0xFF2FF77A);

  static const filterColor = Color(0xFF90A3BF);

  static const ecomotoSwitcherColor = Color(0xFF29CC7A);
  static const ecobookSwitcherColor = Color(0xFF215759);
  static const bottomNavigatorColor = Color(0xFFF5F6F7);
  static const otpInputColor = Color(0xFFE6E6E6);
  static const otpInputApprovedColor = Color(0xFFD3FBE7);
  static const approvalGreen = Color(0xFF19B375);
  static const lockUnlockGreen = Color(0xFF26C662);

  static const popularPlanColor = Color(0xFFF9F5FF);

  static const lightGrey = Color(0xFFDDDBE5);
  static const stormGrayBlue = Color(0xFF98A2B3);
  static const darkSlateGray = Color(0xFF656575);
  static const lightLightGray = Color(0xFFF4F4F4);
  static const mediumGray = Color(0xFF9499A1);
  static const primaryGrey = Color(0xFF3D475C);

  static const tangerine = Color(0xFFFF8719);
  static const malachite = Color(0xFF12B663);

  static const someGreen = Color(0xFFCFF1E6);

  static const dodgerBlue = Color(0xFF3091F0);
  static const inActiveRatingColor = Color(0xFF8E9297);

  static const blueGray = Color(0xFF596780);
  static const slateBlue = Color(0xFF455A64);
  static const silver = Color(0xFFEFEFEF);
  static const stroke = Color(0xFFD8DDE7);
  static const chipBg = Color(0xFFDCDCDC);

  static Color blendedColor = Color.lerp(Color(0xFF8E2DE2), Color(0xFF4A00E0), 0.5)!;


  static const defaultGradient = LinearGradient(
    colors: [
      Color(0xFF00C896),
      Color(0xFF203A43),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const whiteGrad = LinearGradient(
    colors: [
      Colors.white,
      Colors.white,
      Colors.blueGrey,
      Colors.white,
    ],
    stops: [0.0, 0.4, 1.2, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const emeraldBlaze = LinearGradient(
    colors: [Color(0xFF00C896), Color(0xFF203A43)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const arcticBlue = LinearGradient(
    colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const sunsetFire = LinearGradient(
    colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cosmicPurple = LinearGradient(
    colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const neonFusion = LinearGradient(
    colors: [Color(0xFF00F260), Color(0xFF0575E6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const peachCream = LinearGradient(
    colors: [Color(0xFFFFE0B2), Color(0xFFFFB74D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const midnightCity = LinearGradient(
    colors: [Color(0xFF232526), Color(0xFF414345)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const solarFlare = LinearGradient(
    colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const mintyFresh = LinearGradient(
    colors: [Color(0xFF43CEA2), Color(0xFF185A9D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const royalOcean = LinearGradient(
    colors: [Color(0xFF2193B0), Color(0xFF6DD5ED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const berryRush = LinearGradient(
    colors: [Color(0xFF93291E), Color(0xFFED213A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const lavaGlow = LinearGradient(
    colors: [Color(0xFFFF6A00), Color(0xFFEE0979)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

// 13. Ice and Sky
  static const iceAndSky = LinearGradient(
    colors: [Color(0xFF83A4D4), Color(0xFFB6FBFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

// 14. Forest Dream
  static const forestDream = LinearGradient(
    colors: [Color(0xFF56AB2F), Color(0xFFA8E063)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

// 15. Dark Galaxy
  static const darkGalaxy = LinearGradient(
    colors: [Color(0xFF141E30), Color(0xFF243B55)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


  static const bullishGreen = LinearGradient(
    colors: [Color(0xFF0BAB64), Color(0xFF3BB78F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const profitSurge = LinearGradient(
    colors: [Color(0xFF00B09B), Color(0xFF96C93D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const wallStreetBlue = LinearGradient(
    colors: [Color(0xFF2C3E50), Color(0xFF4CA1AF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const premiumGold = LinearGradient(
    colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const candlewickGray = LinearGradient(
    colors: [Color(0xFFBDC3C7), Color(0xFF2C3E50)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const marketPulse = LinearGradient(
    colors: [Color(0xFF36D1DC), Color(0xFF5B86E5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const chartlineTeal = LinearGradient(
    colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const volatilityFlame = LinearGradient(
    colors: [Color(0xFFF7971E), Color(0xFFFF5858)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const nightTerminal = LinearGradient(
    colors: [Color(0xFF0F2027), Color(0xFF2C5364)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


}
