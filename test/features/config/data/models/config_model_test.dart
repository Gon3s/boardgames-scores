import 'package:flutter_test/flutter_test.dart';
import 'package:poc_generic_app/features/config/data/models/config_model.dart';
import 'package:poc_generic_app/features/config/domain/entities/config.dart';

void main() {
  const testConfigModel = ConfigModel(
    appName: 'Test App',
    lightColors: {'primary': '#00629D', 'secondary': '#FC975', 'error': '#BA1A1A'},
    darkColors: {'primary': '#98CBFF', 'secondary': '#FFC19B', 'error': '#FFB4AB'},
  );

  test('should be a subclass of ConfigEntity entity', () async {
    // Assert
    expect(testConfigModel, isA<ConfigEntity>());
  });

  test('should return a valid model from json', () async {
    // Arrange
    final Map<String, dynamic> jsonMap = {
      'app_name': 'Test App',
      'colors': {
        'light': {'primary': '#00629D', 'secondary': '#FC975', 'error': '#BA1A1A'},
        'dark': {'primary': '#98CBFF', 'secondary': '#FFC19B', 'error': '#FFB4AB'}
      }
    };

    // Act
    final result = ConfigModel.fromJson(jsonMap);

    // Assert
    expect(result, testConfigModel);
  });
}
