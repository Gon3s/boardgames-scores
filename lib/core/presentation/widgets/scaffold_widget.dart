import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_env.dart';
import 'appbar_widget.dart';
import 'bottom_navigation_bar_widget.dart';

class ScaffoldWidget extends ConsumerStatefulWidget {
  final Widget title;

  final bool displayAppBar;
  final bool appBarDisplayLeading;
  final String? appBarLeadingIcon;
  final void Function()? appBarOnLeadingPressed;
  final List<Widget> appBarActions;

  final bool displayBottomNavigationBar;
  final int currentIndex;

  final Widget body;

  const ScaffoldWidget({
    super.key,
    required this.title,
    required this.displayAppBar,
    required this.appBarDisplayLeading,
    this.appBarLeadingIcon,
    this.appBarOnLeadingPressed,
    required this.body,
    this.appBarActions = const [],
    required this.displayBottomNavigationBar,
    this.currentIndex = 0,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CustomScaffoldState();
  }
}

class _CustomScaffoldState extends ConsumerState<ScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.displayAppBar
          ? AppBarWidget(
              title: widget.title,
              actions: widget.appBarActions,
              displayLeading: widget.appBarDisplayLeading,
            )
          : null,
      body: widget.body,
      bottomNavigationBar: widget.displayAppBar && EnvInfo.config!.bottomItems.isNotEmpty
          ? BottomNavigationBarWidget(
              currentIndex: widget.currentIndex,
              items: EnvInfo.config!.bottomItems,
            )
          : null,
    );
  }
}
