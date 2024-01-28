import 'package:freezed_annotation/freezed_annotation.dart';

import 'score.dart';

part 'game.freezed.dart';

@freezed
class GameEntity with _$GameEntity {

  const factory GameEntity({
    required int id,
    required String name,
    @Default([]) List<String> steps,
    Map<int, List<ScoreEntity>>? scores,
  }) = _GameEntity;
}
