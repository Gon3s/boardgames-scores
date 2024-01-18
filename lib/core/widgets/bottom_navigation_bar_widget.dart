import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/config/domain/entities/bottom_nav_bar_item.dart';
import '../constants/app_icons.dart';
import '../constants/app_values.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  final int currentIndex;
  final List<BottomNavBarItemEntity> items;

  const BottomNavigationBarWidget({super.key, required this.currentIndex, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        items: items
            .map(
              (e) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.getIcon(e.icon)!,
                  width: AppValues.bottomNavBarIconSize,
                  height: AppValues.bottomNavBarIconSize,
                  colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  AppIcons.getIcon(e.icon)!,
                  width: AppValues.bottomNavBarIconSize,
                  height: AppValues.bottomNavBarIconSize,
                  colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
                ),
                label: e.label,
              ),
            )
            .toList());
  }
}
