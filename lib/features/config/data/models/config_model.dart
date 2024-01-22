import 'package:equatable/equatable.dart';

import '../../domain/entities/config.dart';

import 'bottom_nav_bar_item_model.dart';
import 'color_model.dart';

export 'bottom_nav_bar_item_model.dart';
export 'color_model.dart';

class ConfigModel extends Equatable {
  const ConfigModel({
    required this.appName,
    required this.lightColors,
    required this.darkColors,
    required this.bottomItems,
  });

  final String appName;
  final ColorModel lightColors;
  final ColorModel darkColors;
  final List<BottomNavBarItemModel> bottomItems;

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(
      appName: json['app_name'] as String,
      lightColors: ColorModel.fromJson(json['colors']['light'] as Map<String, dynamic>),
      darkColors: ColorModel.fromJson(json['colors']['dark'] as Map<String, dynamic>),
      bottomItems: (json['bottom_items'] as List<dynamic>)
          .map((e) => BottomNavBarItemModel.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<BottomNavBarItemModel>(),
    );
  }

  ConfigEntity toEntity() {
    return ConfigEntity(
      appName: appName,
      lightColors: lightColors.toEntity(),
      darkColors: darkColors.toEntity(),
      bottomItems: bottomItems.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        appName,
        lightColors,
        darkColors,
        bottomItems,
      ];
}
