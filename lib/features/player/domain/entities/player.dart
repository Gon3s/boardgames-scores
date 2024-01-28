import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/player.dart';

part 'player.freezed.dart';

@freezed
class PlayerEntity with _$PlayerEntity {
  const factory PlayerEntity({
    @Default(null) int? id,
    required String name,
    @Default(false) bool selected,
    @Default([]) List<int> scores,
  }) = _PlayerEntity;
  const PlayerEntity._();

  Player toModel() {
    return Player(
      id: id,
      name: name,
    );
  }
}
