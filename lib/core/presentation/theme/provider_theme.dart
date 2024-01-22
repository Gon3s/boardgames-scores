part of 'app_theme.dart';

final appThemeProvider = StateNotifierProvider<AppThemeModeNotifier, ThemeMode>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  return AppThemeModeNotifier(storageService);
});

class AppThemeModeNotifier extends StateNotifier<ThemeMode> {
  final StorageService storageService;

  ThemeMode currentTheme = ThemeMode.light;

  AppThemeModeNotifier(this.storageService) : super(ThemeMode.light) {
    getCurrentTheme();
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    storageService.set(AppValues.appThemeStorageKey, state.name);
  }

  void getCurrentTheme() async {
    final theme = await storageService.get(AppValues.appThemeStorageKey);
    final value = ThemeMode.values.byName('${theme ?? _defaultValue()}');
    state = value;
  }

  String _defaultValue() {
    final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final defaultValue = brightness == Brightness.dark ? 'dark' : 'light';
    return defaultValue;
  }
}
