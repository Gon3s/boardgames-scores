import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/game.dart';
import '../repositories/game_repository.dart';

class GetGamesUseCase {
  final GameRepository _repository;

  GetGamesUseCase(this._repository);

  Future<Either<Failure, List<GameEntity>>> call() async {
    return _repository.getGames();
  }
}
