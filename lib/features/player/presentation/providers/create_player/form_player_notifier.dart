import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/route/router.dart';
import '../../../domain/entities/player.dart';
import '../../../domain/usecases/create_player.dart';
import '../../../domain/usecases/update_player.dart';
import '../players_list/players_list_notifier.dart';

class FormPlayerNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() async {}

  Future<void> createPlayer(String name) async {
    state = const AsyncLoading();

    if (name.isEmpty) {
      state = AsyncError('Name cannot be empty', StackTrace.current);
      return;
    }

    final useCase = ref.watch(createPlayersUsecaseProvider);
    final result = await useCase.call(name);

    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (player) {
        ref.read(playersListNotifierProvider.notifier).addPlayer(player);
        ref.read(goRouterProvider).pop(true);
      },
    );
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
      (player) {
        ref.read(playersListNotifierProvider.notifier).updatePlayer(updatePlayer);
        ref.read(goRouterProvider).pop(true);
      },
    );
  }
}

final formPlayerProvider = AsyncNotifierProvider.autoDispose<FormPlayerNotifier, void>(FormPlayerNotifier.new);
