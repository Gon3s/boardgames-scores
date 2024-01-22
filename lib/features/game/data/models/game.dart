import 'package:equatable/equatable.dart';

import '../../domain/entities/game.dart';

class GameModel extends Equatable {
  final int id;
  final String name;

  const GameModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );

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
