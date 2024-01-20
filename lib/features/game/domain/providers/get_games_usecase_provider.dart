import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecases/get_games.dart';
import 'game_repository_provider.dart';

final getGamesUsecaseProvider = Provider<GetGamesUseCase>((ref) => GetGamesUseCase(ref.read(gameRepositoryProvider)));
