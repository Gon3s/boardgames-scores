import 'package:equatable/equatable.dart';

class ScoreEntity extends Equatable {
  final String name;
  final int score;

  const ScoreEntity({
    required this.name,
    required this.score,
  });

  @override
  List<Object?> get props => [
        name,
        score,
      ];

  ScoreEntity copyWith({
    String? name,
    int? score,
  }) {
    return ScoreEntity(
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }
}
