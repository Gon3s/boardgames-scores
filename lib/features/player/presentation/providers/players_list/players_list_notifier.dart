import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/player.dart';
import '../../../domain/usecases/get_player.dart';

class PlayersListNotifier extends AutoDisposeAsyncNotifier<List<PlayerEntity>> {
  @override
  FutureOr<List<PlayerEntity>> build() async {
    final res = await ref.watch(getPlayersUsecaseProvider).call();
    return res.fold((l) => [], (r) => r);
  }

  void addPlayer(PlayerEntity player) {
    final players = state.valueOrNull ?? [];
    final updatedPlayers = [...players, player];
    state = AsyncData(updatedPlayers);
  }

  void togglePlayer(PlayerEntity player) {
    final players = state.valueOrNull ?? [];
    final updatedPlayers = players.map((element) {
      if (element.id == player.id) {
        return element.copyWith(selected: !player.selected);
      }
      return element;
    }).toList();
    state = AsyncData(updatedPlayers);
  }

  bool asMinTwoPlayersSelected() {
    final players = state.valueOrNull ?? [];
    return players.where((element) => element.selected).length >= 2;
  }
}

final playersListNotifierProvider = AsyncNotifierProvider.autoDispose<PlayersListNotifier, List<PlayerEntity>>(PlayersListNotifier.new);
