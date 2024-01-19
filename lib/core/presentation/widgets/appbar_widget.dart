import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.displayLeading = true,
    this.leadingIcon,
    this.onLeadingPressed,
    this.actions = const [],
  });

  final Widget title;
  final bool displayLeading;
  final String? leadingIcon;
  final void Function()? onLeadingPressed;
  final List<Widget> actions;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CustomAppBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends ConsumerState<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      elevation: 0,
      leading: widget.displayLeading
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: widget.onLeadingPressed ?? () => context.canPop() ? context.pop(true) : null,
            )
          : null,
      actions: widget.actions.isNotEmpty ? widget.actions : const [],
    );
  }
}
