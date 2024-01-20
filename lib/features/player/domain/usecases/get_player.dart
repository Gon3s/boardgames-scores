import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/player.dart';
import '../repositories/player_repository.dart';

class GetPlayerUseCase {
  final PlayerRepository _repository;

  GetPlayerUseCase(this._repository);

  Future<Either<Failure, List<PlayerEntity>>> call() async {
    return _repository.getPlayer();
  }
}
