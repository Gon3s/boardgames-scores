import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/failure.dart';
import '../../data/repositories/player_repository_impl.dart';
import '../entities/player.dart';
import '../repositories/player_repository.dart';

final updatePlayerUsecaseProvider = Provider<UpdatePlayerUseCase>((ref) => UpdatePlayerUseCase(ref.read(playerRepositoryProvider)));

class UpdatePlayerUseCase {
  final PlayerRepository _repository;

  UpdatePlayerUseCase(this._repository);

  Future<Either<Failure, void>> call(PlayerEntity player) async {
    return _repository.updatePlayer(player);
  }
}
