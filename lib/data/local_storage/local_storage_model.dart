
import 'package:hive/hive.dart';

part 'local_storage_model.g.dart';

@HiveType(typeId: 1)
class LocalStorageModel {
  static const String boxName = "local_storage_model";

  @HiveField(0)
  String? userId;

  @HiveField(1)
  String? email;

  @HiveField(2)
  bool? emailVerification;
}
