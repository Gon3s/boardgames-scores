import 'package:equatable/equatable.dart';

import '../../data/models/player.dart';

class PlayerEntity extends Equatable {
  final int? id;
  final String name;
  final bool selected;

  const PlayerEntity({
    this.id,
    required this.name,
    this.selected = false,
  });

  PlayerEntity copyWith({
    int? id,
    String? name,
    bool? selected,
  }) {
    return PlayerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      selected: selected ?? this.selected,
    );
  }

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
