import 'package:equatable/equatable.dart';

import '../../domain/entities/player.dart';

class PlayerModel extends Equatable {
  final int id;
  final String name;

  const PlayerModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        id: json['id'],
        name: json['name'],
      );

  PlayerEntity toEntity() => PlayerEntity(
        id: id,
        name: name,
      );

  static List<PlayerModel> mockData() => const [
        PlayerModel(
          id: 1,
          name: 'Name 1',
        ),
        PlayerModel(
          id: 2,
          name: 'Name 2',
        ),
        PlayerModel(
          id: 3,
          name: 'Name 3',
        ),
      ];
}
