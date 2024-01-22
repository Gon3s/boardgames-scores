import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_values.dart';
import '../../../../core/presentation/widgets/buttons/button_filled_widget.dart';
import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../providers/create_player/create_player_provider.dart';
import '../providers/create_player/create_player_state.dart';
import '../providers/players_list/players_list_notifier.dart';

class CreatePlayerScreen extends ConsumerWidget {
  CreatePlayerScreen({super.key});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createPlayerProvider);

    ref.listen(
      createPlayerProvider.select((value) => value),
      (previous, next) {
        //show Snackbar on failure
        if (next is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                next.message,
              ),
            ),
          );
        } else if (next is Success) {
          ref.read(playersListNotifierProvider.notifier).addPlayer(next.player);
          context.pop(true);
        }
      },
    );

    return SafeArea(
      child: ScaffoldWidget(
        title: const Text(
          'Add new player',
        ),
        displayAppBar: true,
        appBarDisplayLeading: true,
        body: Padding(
          padding: const EdgeInsets.all(AppValues.defaultPadding),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: 'Name',                  
                ),
              ),
              const SizedBox(
                height: AppValues.defaultPadding,
              ),
              state.maybeMap(
                loading: (_) => const Center(child: CircularProgressIndicator()),
                orElse: () => ButtonFilledWidget(
                  text: 'Save',
                  onTap: () {
                    ref.read(createPlayerProvider.notifier).createPlayer(_nameController.text);
                  },
                  isDisabled: _nameController.text.isEmpty,
                ),
              ),
            ],
          ),
        ),
        displayBottomNavigationBar: false,
      ),
    );
  }
}
