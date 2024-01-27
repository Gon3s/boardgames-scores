import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
          child: players.isEmpty
              ? const Center(
                  child: Text('Add a new player'),
                )
              : ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (context, index) {
                    final player = players[index];
                    return Dismissible(
                      key: Key(player.name),
                      direction: DismissDirection.horizontal,
                      background: _updateBackground(),
                      secondaryBackground: _deleteBackground(),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          bool delete = true;
                          await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Delete player "${player.name}"?'),
                                content: const Text('Are you sure you want to delete this player?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => {delete = false, context.pop(false)},
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => {delete = true, context.pop(true)},
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );

                          // final snackbarController = ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(
                          //     content: Text(
                          //       'Deleted ${player.name}',
                          //       style: const TextStyle(
                          //         color: Colors.white,
                          //       ),
                          //     ),
                          //     action: SnackBarAction(
                          //       label: 'Undo',
                          //       onPressed: () => delete = false,
                          //       disabledTextColor: Colors.white.withOpacity(.3),
                          //       textColor: Colors.white,
                          //     ),
                          //     duration: const Duration(seconds: 1),
                          //     backgroundColor: Colors.red,
                          //     behavior: SnackBarBehavior.floating,
                          //   ),
                          // );
                          // await snackbarController.closed;
                          return delete;
                        } else if (direction == DismissDirection.startToEnd) {
                          context.pushNamed('editPlayer', extra: player);
                          return false;
                        }
                        return null;
                      },
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          ref.read(playersListNotifierProvider.notifier).removePlayer(player);
                        }
                      },
                      child: CheckboxListTile(
                        title: Text(player.name),
                        value: player.selected,
                        onChanged: (value) => {
                          ref.read(playersListNotifierProvider.notifier).togglePlayer(player),
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
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

  Container _deleteBackground() {
    return Container(
      color: Colors.red,
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container _updateBackground() {
    return Container(
      color: Colors.green,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
