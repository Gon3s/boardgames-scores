import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:poc_generic_app/core/error/index.dart';
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

  const testConfigEntity = ConfigEntity(
    appName: 'Test App',
    lightColors: ColorEntity(
      text: '#FFFFFF',
      primary: '#00629D',
      secondary: '#FC9759',
      error: '#BA1A1A',
      background: '#F5F5F5',
    ),
    darkColors: ColorEntity(
      text: '#FFFFFF',
      primary: '#00629D',
      secondary: '#FC9759',
      error: '#BA1A1A',
      background: '#F5F5F5',
    ),
    bottomItems: [
      BottomNavBarItemEntity(
        label: 'Home',
        icon: 'home',
        route: 'home',
      ),
      BottomNavBarItemEntity(
        label: 'Settings',
        icon: 'settings',
        route: 'settings',
      ),
    ],
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
