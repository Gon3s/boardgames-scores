import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc_generic_app/core/error/exception.dart';
import 'package:poc_generic_app/core/error/failure.dart';
import 'package:poc_generic_app/features/config/data/data_sources/local_data_source.dart';
import 'package:poc_generic_app/features/config/data/models/config_model.dart';
import 'package:poc_generic_app/features/config/data/repositories/config_repository_impl.dart';
import 'package:poc_generic_app/features/config/domain/entities/config.dart';

import 'config_repository_impl_test.mocks.dart';

@GenerateMocks([
  LocalDataSource,
])
void main() {
  late MockLocalDataSource mockLocalDataSource;
  late ConfigRepositoryImpl configRepositoryImpl;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    configRepositoryImpl = ConfigRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  const testConfigModel = ConfigModel(
    appName: 'Test App',
    lightColors: {'primary': '#00629D', 'secondary': '#FC975', 'error': '#BA1A1A'},
    darkColors: {'primary': '#00629D', 'secondary': '#FC975', 'error': '#BA1A1A'},
  );

  const testConfigEntity = ConfigEntity(
    appName: 'Test App',
    lightColors: {'primary': '#00629D', 'secondary': '#FC975', 'error': '#BA1A1A'},
    darkColors: {'primary': '#00629D', 'secondary': '#FC975', 'error': '#BA1A1A'},
  );

  test('should get config from the local data source', () async {
    // Arrange
    when(mockLocalDataSource.getConfig()).thenAnswer((_) async => testConfigModel);

    // Act
    final result = await configRepositoryImpl.getConfig();

    // Assert
    expect(result, equals(const Right(testConfigEntity)));
  });

  test('should return serveur failure when local data source throws an server exception', () async {
    // Arrange
    when(mockLocalDataSource.getConfig()).thenThrow(ServerExeption());

    // Act
    final result = await configRepositoryImpl.getConfig();

    // Assert
    expect(result, equals(const Left(ServerFailure('An error has occured'))));
  });
}
