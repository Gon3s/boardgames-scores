import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/player.dart';
import '../../../domain/usecases/delete_player.dart';
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

  void updatePlayer(PlayerEntity player) {
    final players = state.valueOrNull ?? [];
    final updatedPlayers = players.map((element) {
      if (element.id == player.id) {
        return player;
      }
      return element;
    }).toList();
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

  void removePlayer(PlayerEntity player) async {
    final res = await ref.watch(deletePlayerUsecaseProvider).call(player);
    res.fold(
      (l) => state = AsyncError(l.message, StackTrace.current),
      (r) {
        final players = state.valueOrNull ?? [];
        final updatedPlayers = players.where((element) => element.id != player.id).toList();
        state = AsyncData(updatedPlayers);
      },
    );
  }

  bool asMinTwoPlayersSelected() {
    final players = state.valueOrNull ?? [];
    return players.where((element) => element.selected).length >= 2;
  }

  List<PlayerEntity> getSelectedPlayers() {
    final players = state.valueOrNull ?? [];
    return players.where((element) => element.selected).toList();
  }

  void initScore(int length) {
    final players = state.valueOrNull ?? [];
    final updatedPlayers = players.map((element) {
      final scores = List<int>.filled(length, 1);
      return element.copyWith(scores: scores);
    }).toList();
    state = AsyncData(updatedPlayers);
  }

  void updateScore({required PlayerEntity player, required int score, required int index}) {
    final players = state.valueOrNull ?? [];
    final updatedPlayers = players.map((element) {
      if (element.id == player.id) {
        final scores = player.scores;
        scores[index] = score;
        return element.copyWith(scores: scores);
      }
      return element;
    }).toList();
    state = AsyncData(updatedPlayers);
  }
}

final playersListNotifierProvider = AsyncNotifierProvider.autoDispose<PlayersListNotifier, List<PlayerEntity>>(PlayersListNotifier.new);
