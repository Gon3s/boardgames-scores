import '../../domain/entities/bottom_nav_bar_item.dart';
import '../../domain/entities/config.dart';
import 'bottom_nav_bar_item_model.dart';

class ConfigModel {
  const ConfigModel({
    required this.appName,
    required this.lightColors,
    required this.darkColors,
    required this.bottomItems,
  });

  final String appName;
  final Map<String, dynamic> lightColors;
  final Map<String, dynamic> darkColors;
  final List<BottomNavBarItemModel> bottomItems;

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      appName: json['app_name'],
      lightColors: json['colors']['light'],
      darkColors: json['colors']['dark'],
      bottomItems: json['bottom_items'].map((e) => BottomNavBarItemModel.fromJson(e)).toList().cast<BottomNavBarItemModel>(),
    );
  }

  ConfigEntity toEntity() {
    return ConfigEntity(
      appName: appName,
      lightColors: lightColors,
      darkColors: darkColors,
      bottomItems: bottomItems.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  String toString() {
    return 'ConfigModel(appName: $appName, lightColors: $lightColors, darkColors: $darkColors, bottomItems: $bottomItems)';
  }
}
