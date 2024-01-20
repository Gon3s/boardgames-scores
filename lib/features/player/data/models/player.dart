import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../../domain/entities/player.dart';

@entity
class Player extends Equatable {
  @primaryKey
  final int id;
  final String name;

  const Player({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  PlayerEntity toEntity() => PlayerEntity(
        id: id,
        name: name,
      );
}
