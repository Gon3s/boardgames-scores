import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data/database/database.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/utils/colored_debug_printer.dart';
import '../../domain/entities/player.dart';
import '../../domain/repositories/player_repository.dart';

final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return PlayerRepositoryImpl();
});

class PlayerRepositoryImpl extends PlayerRepository {
  @override
  Future<Either<Failure, List<PlayerEntity>>> getPlayers() async {
    try {
      final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

      final players = await database.personDao.findAllPlayers();
      final playerEntities = players.map((e) => e.toEntity()).toList();

      return Right(playerEntities);
    } catch (e) {
      Print.red('DLOG', e.toString());
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PlayerEntity>> insertPlayer(PlayerEntity player) async {
    try {
      final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      final id = await database.personDao.insertPlayer(player.toModel());
      return Right(
        player.copyWith(
          id: id,
        ),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePlayer(PlayerEntity player) async {
    try {
      final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

      return Right(
        database.personDao.updatePlayer(player.toModel()),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePlayer(PlayerEntity player) async {
    try {
      final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

      return Right(
        database.personDao.deletePlayer(player.toModel()),
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
