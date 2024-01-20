import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/game.dart';
import '../../domain/repositories/game_repository.dart';
import '../models/game.dart';

class GameRepositoryImpl extends GameRepository {
  @override
  Future<Either<Failure, List<GameEntity>>> getGames() async {
    await Future.delayed(const Duration(seconds: 2));

    return Right(
      GameModel.mockData().map((e) => e.toEntity()).toList(),
    );
  }
}
