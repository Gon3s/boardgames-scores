import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_values.dart';
import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../../domain/usecases/get_player.dart';
import 'provider/create_player_notifier.dart';
import 'provider/create_player_provider.dart';
import 'provider/create_player_state.dart';

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
                next.exception.message,
              ),
            ),
          );
        } else if (next is Success) {
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
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: AppValues.defaultPadding,
              ),
              state.maybeMap(
                loading: (_) => const Center(child: CircularProgressIndicator()),
                orElse: () => ElevatedButton(
                  onPressed: () => {
                    ref.read(createPlayerProvider.notifier).createPlayer(
                          _nameController.text,
                        )
                  },
                  child: const Text('Save'),
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
