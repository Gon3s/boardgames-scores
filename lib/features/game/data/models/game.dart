import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/game.dart';

part 'game.freezed.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required int id,
    required String name,
  }) = _GameModel;
  GameModel._();

  GameEntity toEntity() => GameEntity(
        id: id,
        name: name,
      );

  static List<GameModel> mockData() => const [
        GameModel(
          id: 1,
          name: 'Draftosaurus',
        ),
        GameModel(
          id: 2,
          name: 'Sushi Go!',
        ),
        GameModel(
          id: 3,
          name: 'Scrabble',
        ),
      ];
}
