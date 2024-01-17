import 'package:poc_generic_app/features/config/domain/entities/config.dart';

class ConfigModel extends ConfigEntity {
  const ConfigModel({required super.appName});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(appName: json['app_name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'appName': appName,
    };
  }

  ConfigEntity toEntity() {
    return ConfigEntity(appName: appName);
  }
}
