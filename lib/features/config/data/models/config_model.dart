import '../../domain/entities/config.dart';

class ConfigModel extends ConfigEntity {
  const ConfigModel({required super.appName, required super.lightColors, required super.darkColors});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      appName: json['app_name'],
      lightColors: json['colors']['light'],
      darkColors: json['colors']['dark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appName': appName,
    };
  }

  ConfigEntity toEntity() {
    return ConfigEntity(
      appName: appName,
      lightColors: lightColors,
      darkColors: darkColors,
    );
  }

  @override
  String toString() {
    return 'ConfigModel(appName: $appName, lightColors: $lightColors, darkColors: $darkColors)';
  }
}
