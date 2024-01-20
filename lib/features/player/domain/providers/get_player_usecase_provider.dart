import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecases/get_player.dart';
import 'player_repository_provider.dart';

final getPlayerUsecaseProvider = Provider<GetPlayerUseCase>((ref) => GetPlayerUseCase(ref.read(PlayerRepositoryProvider)));
