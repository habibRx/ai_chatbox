import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'local_storage_model.dart';

class LocalStorage {
  LocalStorage._();

  static late final FlutterSecureStorage _secureStorage;

  static Future<void> init() async {
    try {
      _secureStorage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ));
      Hive.registerAdapter(LocalStorageModelAdapter() as TypeAdapter);
      await Hive.openBox<LocalStorageModel>(LocalStorageModel.boxName);
      log("Initialized", name: "Local Storage");
    } catch (e) {
      log(e.toString(), name: "Local Storage");
    }
  }

  static LocalStorageModel get _localStorageData {
    final box = Hive.box<LocalStorageModel>(LocalStorageModel.boxName);
    try {
      return box.get(0, defaultValue: LocalStorageModel()) ??
          LocalStorageModel();
    } catch (e) {
      return LocalStorageModel();
    }
  }


  static Future<void> saveEmail(String email) async {
    final data = _localStorageData;
    data.email = email;
    await _save(data);
  }

  static String? get email => _localStorageData.email;

  static Future<void> deleteUserId() async {
    final data = _localStorageData;
    data.userId = null;
    await _save(data);
  }

  static Future<void> _save(LocalStorageModel localStorage) async {
    final box = Hive.box<LocalStorageModel>(LocalStorageModel.boxName);
    try {
      await box.putAt(0, localStorage);
    } catch (e) {
      box.put(0, localStorage);
    }
  }

  // static Future<void> saveAccessToken(String token) async {
  //   final data = LocalStorage._localStorageData;
  //   data.accessToken = token;
  //   await LocalStorage._save(data);
  //   return;
  // }

  static Future<void> saveEmailVerification(bool isVerified) async {
    final data = LocalStorage._localStorageData;
    data.emailVerification = isVerified;
    await LocalStorage._save(data);
    return;
  }

  // static Future<void> deleteAccessToken() async {
  //   final data = LocalStorage._localStorageData;
  //   data.accessToken = null;
  //   await LocalStorage._save(data);
  //   return;
  // }

  static Future<void> deleteEmailVerification() async {
    final data = LocalStorage._localStorageData;
    data.emailVerification = null;
    await LocalStorage._save(data);
    return;
  }


  static bool? get emailVerification {
    return _localStorageData.emailVerification;
  }

  static Future<void> saveUserId(String id) async {
    final data = LocalStorage._localStorageData;
    data.userId = id;
    await LocalStorage._save(data);
  }

  static String? get userId {
    return _localStorageData.userId;
  }

}
