import '../../domain/entities/bottom_nav_bar_item.dart';

class BottomNavBarItemModel {
  const BottomNavBarItemModel({
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final String icon;
  final String route;

  factory BottomNavBarItemModel.fromJson(Map<String, dynamic> json) {
    return BottomNavBarItemModel(
      label: json['label'] as String,
      icon: json['icon'] as String,
      route: json['route'] as String,
    );
  }

  BottomNavBarItemEntity toEntity() {
    return BottomNavBarItemEntity(
      label: label,
      icon: icon,
      route: route,
    );
  }
}
