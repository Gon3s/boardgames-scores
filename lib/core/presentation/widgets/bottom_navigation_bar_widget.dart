import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../features/config/domain/entities/bottom_nav_bar_item.dart';
import '../../constants/app_icons.dart';
import '../../constants/app_values.dart';

class BottomNavigationBarWidget extends ConsumerWidget {
  final int currentIndex;
  final List<BottomNavBarItemEntity> items;

  const BottomNavigationBarWidget({super.key, required this.currentIndex, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (final int index) {
          if (index != currentIndex && items[index].route.isNotEmpty) {
            GoRouter.of(context).goNamed(items[index].route);
          }
        },
        items: items
            .map(
              (e) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppIcons.getIcon(e.icon)!,
                  width: AppValues.bottomNavBarIconSize,
                  height: AppValues.bottomNavBarIconSize,
                  colorFilter: ColorFilter.mode(Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!, BlendMode.srcIn),
                ),
                activeIcon: SvgPicture.asset(
                  AppIcons.getIcon(e.icon)!,
                  width: AppValues.bottomNavBarIconSize,
                  height: AppValues.bottomNavBarIconSize,
                  colorFilter: ColorFilter.mode(Theme.of(context).bottomNavigationBarTheme.selectedItemColor!, BlendMode.srcIn),
                ),
                label: e.label,
              ),
            )
            .toList());
  }
}
