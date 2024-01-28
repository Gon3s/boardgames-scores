import 'package:equatable/equatable.dart';

class BottomNavBarItemEntity extends Equatable {
  final String icon;
  final String label;
  final String route;

  const BottomNavBarItemEntity({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  List<Object?> get props => [
        icon,
        label,
        route,
      ];

  BottomNavBarItemEntity copyWith({
    String? icon,
    String? label,
    String? route,
  }) {
    return BottomNavBarItemEntity(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      route: route ?? this.route,
    );
  }
}
