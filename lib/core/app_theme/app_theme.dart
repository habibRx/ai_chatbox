import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/enums.dart';

import 'app_colors.dart';
import 'app_constants.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.lightScaffold,
        colorScheme: lightColorScheme.copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.lightGrey,
        ),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        tabBarTheme: tabBarTheme,
        dividerTheme: dividerThemeData,
        textTheme:   GoogleFonts.poppinsTextTheme(),
        timePickerTheme: TimePickerThemeData(
          backgroundColor: darkColorScheme.surface,
          helpTextStyle: TextStyle(color: darkColorScheme.onSurface),
          hourMinuteTextStyle: GoogleFonts.roboto(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        elevatedButtonTheme: elevatedButtonThemeData,
        bannerTheme: materialBannerTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData);
  }

  static ThemeData get darkTheme {
    return ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.darkScaffold,
        colorScheme: darkColorScheme.copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        tabBarTheme: tabBarTheme,
        dividerTheme: dividerThemeData,
        textTheme:   GoogleFonts.poppinsTextTheme(),
        timePickerTheme: TimePickerThemeData(
          backgroundColor: darkColorScheme.surface,
          helpTextStyle: TextStyle(color: darkColorScheme.onSurface),
          hourMinuteTextStyle: GoogleFonts.roboto(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        elevatedButtonTheme: elevatedButtonThemeData,
        bannerTheme: materialBannerTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData);
  }

  static AppBarTheme get appBarTheme {
    return AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      backgroundColor: AppColors.lightScaffold,
      foregroundColor: colorScheme.primary,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  static ColorScheme get colorScheme {
    return const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: Colors.white,
        secondary: Colors.black,
        tertiary: Color(0xFF8EB7FF),
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.lightScaffold,
        onSurface: Colors.white);
  }

  static ColorScheme get darkColorScheme => const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.black,
    tertiary: Color(0xFF8EB7FF),
    error: Colors.red,
    onError: Colors.black,
    surface: Color(0xFF121212),
    onSurface: Colors.white,
  );

  static ColorScheme get lightColorScheme => const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    tertiary: Color(0xFF8EB7FF),
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static DividerThemeData get dividerThemeData {
    return DividerThemeData(color: colorScheme.primary);
  }

  static MaterialBannerThemeData get materialBannerTheme {
    return MaterialBannerThemeData(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        elevation: 4,
        dividerColor: colorScheme.primary);
  }

  static BottomNavigationBarThemeData get bottomNavigationBarThemeData {
    return const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.inActiveBottomNavigationColor,
        backgroundColor: AppColors.secondaryColor,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        enableFeedback: true,
        elevation: 10,
        selectedLabelStyle: AppTextStyles.selectedLabelStyle,
        unselectedLabelStyle: AppTextStyles.unselectedLabelStyle);
  }

  static ElevatedButtonThemeData get elevatedButtonThemeData {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
        ));
  }

  static TabBarThemeData get tabBarTheme {
    return TabBarThemeData(
      unselectedLabelColor: colorScheme.surface,
      labelColor: colorScheme.primary,
      labelStyle: AppTextStyles.tabBarLabelTextStyle,
      indicator: const BoxDecoration(color: Colors.red),
      indicatorColor: Colors.yellow,
    );
  }
}

class ThemeCubit extends Cubit<AppThemeMode> {
  static const String _themeKey = 'theme_mode';

  ThemeCubit() : super(AppThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themeKey) ?? 'light';

    switch (savedTheme) {
      case 'dark':
        emit(AppThemeMode.dark);
        break;
      default:
        emit(AppThemeMode.light);
    }
  }

  Future<void> setTheme(AppThemeMode mode) async {
    emit(mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
  }

  Future<void> toggleTheme() async {
    final nextTheme = state == AppThemeMode.light
        ? AppThemeMode.dark
        : AppThemeMode.light;

    await setTheme(nextTheme);
  }
}