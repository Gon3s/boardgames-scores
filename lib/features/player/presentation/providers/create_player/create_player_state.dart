import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/player.dart';

part 'create_player_state.freezed.dart';

@freezed
abstract class CreatePlayerState with _$CreatePlayerState {
  const factory CreatePlayerState.initial() = Initial;
  const factory CreatePlayerState.loading() = Loading;
  const factory CreatePlayerState.error(String message) = Error;
  const factory CreatePlayerState.success(PlayerEntity player) = Success;
}
