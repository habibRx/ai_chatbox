import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/app_config_model.dart';

class AppConfig {
  AppConfig._();

  //init Hive
  static Future<void> init() async {
    Hive.registerAdapter(AppConfigModelAdapter());
    await Hive.openBox<AppConfigModel>(AppConfigModel.boxName);
    resetUserLocation();
    log("App configuration initialized");
  }

  // get app config info
  static AppConfigModel? get _appConfigInfo {
    final box = Hive.box<AppConfigModel>(AppConfigModel.boxName);
    try {
      return box.get(0, defaultValue: AppConfigModel());
    } catch (e) {
      return AppConfigModel();
    }
  }

  void clearUserLocation() {}

  // save app config info
  static Future<void> _save(AppConfigModel appConfigInfo) async {
    final box = Hive.box<AppConfigModel>(AppConfigModel.boxName);
    try {
      await box.putAt(0, appConfigInfo);
    } catch (e) {
      box.put(0, appConfigInfo);
    }
  }

  // set finished onboarding
  static Future<void> setFinishedOnboarding(bool finishedOnboarding) async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.finishedOnboarding = finishedOnboarding;
    await AppConfig._save(appConfigInfo);
  }

  // get finished onboarding
  static bool get finishedOnboarding {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    return appConfigInfo.finishedOnboarding ?? false;
  }

  static Future<void> setFinishedHomeOnBoarding(
      bool finishedHomeOnboarding) async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.finishedHomeOnboarding = finishedHomeOnboarding;
    await AppConfig._save(appConfigInfo);
  }

  // get finished onboarding
  static bool get finishedHomeOnboarding {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    return appConfigInfo.finishedHomeOnboarding ?? false;
  }

  static Future<void> setFinishedExploreOnboarding(
      bool finishedEcobookOnboarding) async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.finishedExploreOnboarding = finishedEcobookOnboarding;
    await AppConfig._save(appConfigInfo);
  }

  static bool get finishedExploreOnboarding {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    return appConfigInfo.finishedExploreOnboarding ?? false;
  }

  static Future<void> setFinishedBagOnboarding(
      bool finishedEcobookOnboarding) async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.finishedBagOnboarding = finishedEcobookOnboarding;
    await AppConfig._save(appConfigInfo);
  }

  static bool get finishedBagOnboarding {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    return appConfigInfo.finishedBagOnboarding ?? false;
  }


  static Future<void> setFinishedProfileOnboarding(
      bool finishedEcobookOnboarding) async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.finishedProfileOnboarding = finishedEcobookOnboarding;
    await AppConfig._save(appConfigInfo);
  }

  static bool get finishedProfileOnboarding {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    return appConfigInfo.finishedBagOnboarding ?? false;
  }


  static Future<void> setUserLocation(
      {required String? long, required String? lat}) async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.userLocation =
    (long == null || lat == null) ? null : {'lat': lat, 'long': long};
    await AppConfig._save(appConfigInfo);
  }

  static Future<void> resetUserLocation() async {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    appConfigInfo.userLocation = null;
    await AppConfig._save(appConfigInfo);
  }

  // get users location
  static ({String long, String lat})? get getUserLocation {
    final appConfigInfo = AppConfig._appConfigInfo ?? AppConfigModel();
    final usersLocation = appConfigInfo.userLocation;
    return usersLocation != null
        ? (lat: usersLocation['lat'] ?? "", long: usersLocation['long'] ?? "")
        : null;
  }
}

