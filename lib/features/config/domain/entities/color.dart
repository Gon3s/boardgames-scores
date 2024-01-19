import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  const ColorEntity({
    required this.text,
    required this.primary,
    required this.secondary,
    required this.error,
    required this.background,
  });

  final String text;
  final String primary;
  final String secondary;
  final String error;
  final String background;

  @override
  List<Object?> get props => [
        text,
        primary,
        secondary,
        error,
        background,
      ];
}
