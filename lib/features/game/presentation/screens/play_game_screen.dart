import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_values.dart';
import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../../../player/domain/entities/player.dart';
import '../../../player/presentation/providers/players_list/players_list_notifier.dart';
import '../../domain/entities/game.dart';

class PlayGameScreen extends ConsumerWidget {
  final GameEntity game;

  const PlayGameScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playersListNotifierProvider.notifier).getSelectedPlayers();

    final List<String> rows = [
      'La forêt des similaires',
      'Le trio des bois',
      'La prairie des Amoureux',
      'Le roi de la jungle',
      'La plaine des différences',
      "L'ile du solitaire",
      'La rivière',
      'Score des T-Rex',
    ];

    return SafeArea(
      child: ScaffoldWidget(
        title: Text(
          game.name,
        ),
        displayAppBar: true,
        appBarDisplayLeading: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
          child: SingleChildScrollView(
            child: Row(
              children: [
                _FixedColumnWidget(rows: rows),
                _DataTableContent(players: players, rows: rows),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FixedColumnWidget extends StatelessWidget {
  final List<String> rows;
  const _FixedColumnWidget({required this.rows});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        horizontalMargin: 8,
        columns: const [
          DataColumn(
            label: Text('Name'),
          ),
        ],
        rows: rows.map((row) {
          return DataRow(
            cells: [
              DataCell(
                Text(row),
              ),
            ],
          );
        }).toList());
  }
}

class _DataTableContent extends ConsumerWidget {
  final List<PlayerEntity> players;
  final List<String> rows;

  const _DataTableContent({required this.players, required this.rows});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columnSpacing: AppValues.defaultPadding,
            columns: players.map((player) {
              return DataColumn(
                label: Text(player.name),
              );
            }).toList(),
            rows: rows.map((row) {
              return DataRow(
                cells: players.map((player) {
                  final FocusNode focusNode = FocusNode();
                  final TextEditingController controller = TextEditingController();
                  controller.text = player.scores[rows.indexOf(row)].toString();

                  return DataCell(
                    TextFormField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onTap: () => controller.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: controller.value.text.length,
                      ),
                      onChanged: (value) => {
                        ref.read(playersListNotifierProvider.notifier).updateScore(
                              player: player,
                              score: int.parse(value),
                              index: rows.indexOf(row),
                            ),
                      },
                    ),
                  );
                }).toList(),
              );
            }).toList()),
      ),
    );
  }
}
