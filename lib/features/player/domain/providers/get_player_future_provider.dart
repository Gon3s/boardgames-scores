import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/player.dart';
import 'get_player_usecase_provider.dart';

final getPlayerFutureProvider = FutureProvider<List<PlayerEntity>>(
  (ref) => ref.read(getPlayerUsecaseProvider).call().then(
        (value) => value.fold(
          (failure) => throw failure,
          (player) => player,
        ),
      ),
);
