import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final int id;
  final String name;

  const PlayerEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
