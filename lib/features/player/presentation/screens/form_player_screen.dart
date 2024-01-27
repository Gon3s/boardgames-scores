import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_values.dart';
import '../../../../core/extensions/async_value_extensions.dart';
import '../../../../core/presentation/widgets/buttons/button_filled_widget.dart';
import '../../../../core/presentation/widgets/scaffold_widget.dart';
import '../../domain/entities/player.dart';
import '../providers/create_player/form_player_notifier.dart';

enum FormPlayerType { create, edit }

class FormPlayerScreen extends ConsumerStatefulWidget {
  const FormPlayerScreen({super.key, this.player});

  final PlayerEntity? player;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormPlayerScreenState();
}

class _FormPlayerScreenState extends ConsumerState<FormPlayerScreen> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  FormPlayerType type = FormPlayerType.create;

  @override
  void initState() {
    super.initState();
    if (widget.player != null) {
      type = FormPlayerType.edit;
      _nameController.text = widget.player!.name;
    }
    _nameFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formPlayerProvider);

    ref.listen(
      formPlayerProvider,
      (_, state) => state.showSnackBarOnError(context),
    );

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
                focusNode: _nameFocusNode,
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
                      ref.read(formPlayerProvider.notifier).updatePlayer(widget.player!, _nameController.text.trim());
                    } else {
                      ref.read(formPlayerProvider.notifier).createPlayer(_nameController.text.trim());
                    }
                  },
                  isLoading: formState.isLoading,
                  isDisabled: value.text.isEmpty,
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
