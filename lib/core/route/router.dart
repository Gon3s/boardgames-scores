import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/game/domain/entities/game.dart';
import '../../features/game/route.dart';
import '../../features/player/domain/entities/player.dart';
import '../../features/player/route.dart';

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
  routes: <RouteBase>[
    gamesRoute,
    playerRoute,
  ],
  debugLogDiagnostics: true,
      extraCodec: const _MyExtraCodec(),
    )
);

/// A codec that can serialize both [ComplexData1] and [ComplexData2].
class _MyExtraCodec extends Codec<Object?, Object?> {
  /// Create a codec.
  const _MyExtraCodec();
  @override
  Converter<Object?, Object?> get decoder => const _MyExtraDecoder();

  @override
  Converter<Object?, Object?> get encoder => const _MyExtraEncoder();
}

class _MyExtraDecoder extends Converter<Object?, Object?> {
  const _MyExtraDecoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    final List<Object?> inputAsList = input as List<Object?>;
    if (inputAsList[0] == 'GameEntity') {
      return GameEntity(id: inputAsList[1]! as int, name: inputAsList[2]! as String);
    }
    if (inputAsList[0] == 'PlayerEntity') {
      return PlayerEntity(id: inputAsList[1]! as int, name: inputAsList[2]! as String);
    }
    throw FormatException('Unable to parse input: $input');
  }
}

class _MyExtraEncoder extends Converter<Object?, Object?> {
  const _MyExtraEncoder();
  @override
  Object? convert(Object? input) {
    if (input == null) {
      return null;
    }
    switch (input) {
      case GameEntity _:
        return <Object?>['GameEntity', input.id, input.name];
      case PlayerEntity _:
        return <Object?>['PlayerEntity', input.id, input.name];
      default:
        throw FormatException('Cannot encode type ${input.runtimeType}');
    }
  }
}
