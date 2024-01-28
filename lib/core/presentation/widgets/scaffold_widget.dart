import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/bottom_navbar_item.dart';
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
  final List<BottomNavBarItemEntity> bottomItems;

  final bool displayFloatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final void Function()? onFloatingActionButtonPressed;
  final Widget? floatingActionButtonIcon;

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
    this.displayBottomNavigationBar = false,
    this.currentIndex = 0,
    this.displayFloatingActionButton = false,
    this.floatingActionButtonLocation,
    this.onFloatingActionButtonPressed,
    this.floatingActionButtonIcon,
    this.bottomItems = const [],
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
      bottomNavigationBar: widget.displayAppBar && widget.bottomItems.isNotEmpty
          ? BottomNavigationBarWidget(
              currentIndex: widget.currentIndex,
              items: widget.bottomItems,
            )
          : null,
      floatingActionButton: widget.displayFloatingActionButton
          ? FloatingActionButton(
              onPressed: widget.onFloatingActionButtonPressed,
              child: widget.floatingActionButtonIcon,
            )
          : null,
      floatingActionButtonLocation: widget.floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat,
    );
  }
}
