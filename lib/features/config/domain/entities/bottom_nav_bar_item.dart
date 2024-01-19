import 'package:equatable/equatable.dart';

class BottomNavBarItemEntity extends Equatable {
  final String label;
  final String icon;
  final String route;

  const BottomNavBarItemEntity({
    required this.label,
    required this.icon,
    required this.route,
  });

  @override
  List<Object?> get props => [
        label,
        icon,
        route,
      ];
}
