import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/create_player.dart';
import 'create_player_state.dart';

class CreatePlayerNotifier extends StateNotifier<CreatePlayerState> {
  final CreatePlayersUseCase _useCase;

  CreatePlayerNotifier(this._useCase) : super(const CreatePlayerState.initial());

  Future<void> createPlayer(String name) async {
    state = const CreatePlayerState.loading();

    final result = await _useCase.call(name);

    result.fold(
      (failure) => state = CreatePlayerState.error(failure),
      (_) => state = const CreatePlayerState.success(),
    );
  }
}
