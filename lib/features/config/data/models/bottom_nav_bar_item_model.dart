import '../../domain/entities/bottom_nav_bar_item.dart';

class BottomNavBarItemModel {
  const BottomNavBarItemModel({
    this.label,
    required this.icon,
  });

  final String? label;
  final String icon;

  factory BottomNavBarItemModel.fromJson(Map<String, dynamic> json) {
    return BottomNavBarItemModel(
      label: json['label'] as String?,
      icon: json['icon'] as String,
    );
  }

  BottomNavBarItemEntity toEntity() {
    return BottomNavBarItemEntity(
      label: label,
      icon: icon,
    );
  }
}
