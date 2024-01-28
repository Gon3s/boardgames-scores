import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_values.dart';
import '../../../../../../core/presentation/widgets/buttons/button_filled_widget.dart';
import '../../../../domain/entities/game.dart';

class DraftosaurusOptionScreen extends StatefulWidget {
  final GameEntity game;

  const DraftosaurusOptionScreen({super.key, required this.game});

  @override
  State<DraftosaurusOptionScreen> createState() => _DraftosaurusOptionScreenState();
}

class _DraftosaurusOptionScreenState extends State<DraftosaurusOptionScreen> {
  bool summer = false;
  bool winter = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.defaultHorizontalPadding,
              vertical: AppValues.defaultVerticalPadding,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Summer',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: summer,
                      onChanged: (bool value) {
                        setState(() {
                          summer = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: AppValues.defaultPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Winter',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: winter,
                      onChanged: (bool value) {
                        setState(() {
                          winter = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ButtonFilledWidget(
          text: 'Stat game',
          isDisabled: summer == false && winter == false,
          onTap: () {
            GameEntity updatedGame = widget.game;
            if (summer) {
              updatedGame = widget.game.copyWith(
                steps: widget.game.steps + ['summer'],
              );
            }

            if (winter) {
              updatedGame = widget.game.copyWith(
                steps: widget.game.steps + ['winter'],
              );
            }

            context.pushNamed('play', extra: updatedGame);
          },
        ),
      ],
    );
  }
}
