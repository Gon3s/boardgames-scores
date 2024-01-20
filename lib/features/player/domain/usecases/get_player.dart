import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/player_repository_impl.dart';
import '../entities/player.dart';
import '../repositories/player_repository.dart';

final getPlayersUsecaseProvider = Provider<GetPlayersUseCase>((ref) => GetPlayersUseCase(ref.read(playerRepositoryProvider)));

final getPlayersFutureProvider = FutureProvider<List<PlayerEntity>>(
  (ref) => ref.read(getPlayersUsecaseProvider).call().then(
        (value) => value.fold(
          (failure) => throw failure,
          (player) => player,
        ),
      ),
);

class GetPlayersUseCase {
  final PlayerRepository _repository;

  GetPlayersUseCase(this._repository);

  Future<Either<Failure, List<PlayerEntity>>> call() async {
    return _repository.getPlayers();
  }
}
