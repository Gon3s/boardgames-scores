import 'package:flutter_test/flutter_test.dart';
import 'package:poc_generic_app/features/config/data/models/config_model.dart';
import 'package:poc_generic_app/features/config/domain/entities/config.dart';

void main() {
  const testConfigModel = ConfigModel(
    appName: 'Test App',
    lightColors: ColorModel(
      text: '#FFFFFF',
      primary: '#00629D',
      secondary: '#FC9759',
      error: '#BA1A1A',
      background: '#F5F5F5',
    ),
    darkColors: ColorModel(
      text: '#FFFFFF',
      primary: '#00629D',
      secondary: '#FC9759',
      error: '#BA1A1A',
      background: '#F5F5F5',
    ),
    bottomItems: const [
      BottomNavBarItemModel(
        label: 'Home',
        icon: 'home',
        route: 'home',
      ),
      BottomNavBarItemModel(
        label: 'Settings',
        icon: 'settings',
        route: 'settings',
      ),
    ],
  );

  test('should be a subclass of ConfigEntity entity', () async {
    // Assert
    expect(testConfigModel.toEntity(), isA<ConfigEntity>());
  });

  test('should return a valid model from json', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = {
      'app_name': 'Test App',
      'colors': {
        'light': {'text': '#FFFFFF', 'primary': '#00629D', 'secondary': '#FC9759', 'error': '#BA1A1A', 'background': '#F5F5F5'},
        'dark': {'text': '#FFFFFF', 'primary': '#00629D', 'secondary': '#FC9759', 'error': '#BA1A1A', 'background': '#F5F5F5'}
      },
      'bottom_items': [
        {'label': 'Home', 'icon': 'home', 'route': 'home'},
        {'label': 'Settings', 'icon': 'settings', 'route': 'settings'},
      ]
    };

    // Act
    final result = ConfigModel.fromJson(jsonMap);

    // Assert
    expect(result, testConfigModel);
  });
}
