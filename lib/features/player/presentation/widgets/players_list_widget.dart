import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/widgets/buttons/button_filled_widget.dart';
import '../../domain/entities/player.dart';
import '../providers/players_list/players_list_notifier.dart';

class PlayersListWidget extends ConsumerWidget {
  const PlayersListWidget({
    required this.players,
  });

  final List<PlayerEntity> players;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asMinTwoPlayersSelected = ref.read(playersListNotifierProvider.notifier).asMinTwoPlayersSelected();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              return CheckboxListTile(
                title: Text(player.name),
                value: player.selected,
                onChanged: (value) => {
                  ref.read(playersListNotifierProvider.notifier).togglePlayer(player),
                },
                controlAffinity: ListTileControlAffinity.trailing,
              );
            },
          ),
        ),
        ButtonFilledWidget(
          text: asMinTwoPlayersSelected ? 'Start game' : 'Select at least 2 players',
          isDisabled: !asMinTwoPlayersSelected,
          onTap: () => {},
        ),
      ],
    );
  }
}
