import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/create_player.dart';
import 'create_player_notifier.dart';
import 'create_player_state.dart';

final createPlayerProvider = StateNotifierProvider<CreatePlayerNotifier, CreatePlayerState>((ref) {
  return CreatePlayerNotifier(
    ref.read(createPlayersUsecaseProvider),
  );
});
