class AppIcons {
  AppIcons._();

  static const String iconPath = 'assets/icons';

  static const Map<String, String> icons = {
    'home': '$iconPath/home.svg',
  };

  static String? getIcon(String icon) {
    return icons[icon];
  }
}
