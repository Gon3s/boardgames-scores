import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/player.dart';
import '../../domain/repositories/player_repository.dart';
import '../models/player.dart';

class PlayerRepositoryImpl extends PlayerRepository {
  @override
  Future<Either<Failure, List<PlayerEntity>>> getPlayer() async {
    // Simulate a delay to show the loading indicator
    await Future.delayed(const Duration(seconds: 2));

    return Right(
      PlayerModel.mockData().map((e) => e.toEntity()).toList(),
    );
  }
}
