import 'package:equatable/equatable.dart';

import 'bottom_nav_bar_item.dart';
import 'color.dart';

export 'bottom_nav_bar_item.dart';
export 'color.dart';

class ConfigEntity extends Equatable {
  const ConfigEntity({
    required this.appName,
    required this.lightColors,
    required this.darkColors,
    required this.bottomItems,
  });

  final String appName;
  final ColorEntity lightColors;
  final ColorEntity darkColors;
  final List<BottomNavBarItemEntity> bottomItems;

  @override
  List<Object?> get props => [
        appName,
        lightColors,
        darkColors,
        bottomItems,
      ];
}
