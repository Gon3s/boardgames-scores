import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_values.dart';
import '../../../../core/presentation/widgets/buttons/button_filled_widget.dart';
import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../../domain/entities/player.dart';
import '../providers/create_player/form_player_notifier.dart';
import '../providers/players_list/players_list_notifier.dart';

enum FormPlayerType { create, edit }

class FormPlayerScreen extends ConsumerStatefulWidget {
  const FormPlayerScreen({super.key, this.player});

  final PlayerEntity? player;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormPlayerScreenState();
}

class _FormPlayerScreenState extends ConsumerState<FormPlayerScreen> {
  final TextEditingController _nameController = TextEditingController();
  FormPlayerType type = FormPlayerType.create;

  @override
  void initState() {
    super.initState();
    if (widget.player != null) {
      type = FormPlayerType.edit;
      _nameController.text = widget.player!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(formPlayerProvider);

    return SafeArea(
      child: ScaffoldWidget(
        title: Text(
          type == FormPlayerType.edit ? 'Edit player' : 'Add new player',
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
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _nameController,
                builder: (context, value, child) => ButtonFilledWidget(
                    text: type == FormPlayerType.edit ? 'Update' : 'Add',
                    onTap: () {
                      if (type == FormPlayerType.edit) {
                        ref
                            .read(formPlayerProvider.notifier)
                            .updatePlayer(widget.player!, _nameController.text)
                            .then((value) => ref.read(playersListNotifierProvider.notifier).updatePlayer(state.asData!.value!));
                      } else {
                        ref
                            .read(formPlayerProvider.notifier)
                            .createPlayer(_nameController.text)
                            .then((value) => ref.read(playersListNotifierProvider.notifier).addPlayer(state.asData!.value!));
                      }
                      context.pop(true);
                    },
                    isLoading: state.isLoading,
                    isDisabled: value.text.isEmpty),
              ),
            ],
          ),
        ),
        displayBottomNavigationBar: false,
      ),
    );
  }
}
