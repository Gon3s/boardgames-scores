import 'package:equatable/equatable.dart';

import '../../data/models/player.dart';

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

  Player toModel() {
    return Player(
      id: id,
      name: name,
    );
  }
}
