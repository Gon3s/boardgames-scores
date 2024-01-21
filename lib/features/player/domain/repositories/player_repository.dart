import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/player.dart';

abstract class PlayerRepository {
  Future<Either<Failure, List<PlayerEntity>>> getPlayers();

  Future<Either<Failure, void>> insertPlayer(PlayerEntity player);

  Future<Either<Failure, void>> updatePlayer(PlayerEntity player);

  Future<Either<Failure, void>> deletePlayer(PlayerEntity player);
}
