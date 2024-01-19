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
      appName: json['app_name'],
      lightColors: ColorModel.fromJson(json['colors']['light']),
      darkColors: ColorModel.fromJson(json['colors']['dark']),
      bottomItems: json['bottom_items'].map((e) => BottomNavBarItemModel.fromJson(e)).toList().cast<BottomNavBarItemModel>(),
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
