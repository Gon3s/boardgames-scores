import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/player_repository_impl.dart';
import '../entities/player.dart';
import '../repositories/player_repository.dart';

final createPlayersUsecaseProvider = Provider<CreatePlayersUseCase>((ref) => CreatePlayersUseCase(ref.read(playerRepositoryProvider)));

class CreatePlayersUseCase {
  final PlayerRepository _repository;

  CreatePlayersUseCase(this._repository);

  Future<Either<Failure, PlayerEntity>> call(String name) async {
    final PlayerEntity player = PlayerEntity(name: name);
    return _repository.insertPlayer(player);
  }
}
