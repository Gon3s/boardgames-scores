import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/player.dart';
import '../../../domain/usecases/create_player.dart';
import '../../../domain/usecases/update_player.dart';

class FormPlayerNotifier extends AutoDisposeAsyncNotifier<PlayerEntity?> {
  @override
  FutureOr<PlayerEntity?> build() {
    return null;
  }

  Future<void> createPlayer(String name) async {
    state = const AsyncLoading();

    if (name.isEmpty) {
      state = AsyncError('Name cannot be empty', StackTrace.current);
      return;
    }

    final useCase = ref.watch(createPlayersUsecaseProvider);
    final result = await useCase.call(name);

    result.fold((failure) => state = AsyncError(failure.message, StackTrace.current), (player) => state = AsyncData(player));
  }

  Future<void> updatePlayer(PlayerEntity player, String name) async {
    state = const AsyncLoading();

    if (name.isEmpty) {
      state = AsyncError('Name cannot be empty', StackTrace.current);
      return;
    }

    final useCase = ref.watch(updatePlayerUsecaseProvider);
    final updatePlayer = player.copyWith(name: name);
    final result = await useCase.call(updatePlayer);

    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (player) => state = AsyncData(updatePlayer),
    );
  }
}

final formPlayerProvider = AsyncNotifierProvider.autoDispose<FormPlayerNotifier, PlayerEntity?>(FormPlayerNotifier.new);
