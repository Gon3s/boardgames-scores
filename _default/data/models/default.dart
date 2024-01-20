import 'package:equatable/equatable.dart';

import '../../domain/entities/default.dart';

class DefaultModel extends Equatable {
  final int id;
  final String name;

  const DefaultModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory DefaultModel.fromJson(Map<String, dynamic> json) => DefaultModel(
        id: json['id'],
        name: json['name'],
      );

  DefaultEntity toEntity() => DefaultEntity(
        id: id,
        name: name,
      );

  static List<DefaultModel> mockData() => const [
        DefaultModel(
          id: 1,
          name: 'Draftosaurus',
        ),
        DefaultModel(
          id: 2,
          name: 'Sushi Go!',
        ),
        DefaultModel(
          id: 3,
          name: 'Scrabble',
        ),
      ];
}
