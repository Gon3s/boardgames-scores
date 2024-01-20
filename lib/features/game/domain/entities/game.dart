import 'package:equatable/equatable.dart';

class GameEntity extends Equatable {
  final int id;
  final String name;

  const GameEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
