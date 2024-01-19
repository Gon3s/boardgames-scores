class AppIcons {
  AppIcons._();

  static const String iconPath = 'assets/icons';

  static const Map<String, String> icons = {
    'home': '$iconPath/home.svg',
    'datatable': '$iconPath/datatable.svg',
  };

  static String? getIcon(String icon) {
    return icons[icon];
  }
}
