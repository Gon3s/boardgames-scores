import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc_generic_app/core/error/failure.dart';
import 'package:poc_generic_app/features/config/domain/entities/config.dart';
import 'package:poc_generic_app/features/config/domain/repositories/config_repository.dart';
import 'package:poc_generic_app/features/config/domain/usecases/get_config.dart';

import 'get_config_test.mocks.dart';

@GenerateMocks(
  [ConfigRepository],
)
void main() {
  late GetConfigUseCase useCase;
  late MockConfigRepository mockRepository;

  setUp(() {
    mockRepository = MockConfigRepository();
    useCase = GetConfigUseCase(mockRepository);
  });

  const testConfig = ConfigEntity(
    appName: 'Test App',
    lightColors: ColorEntity(
      text: '#FFFFFF',
      primary: '#00629D',
      secondary: '#FC975',
      error: '#BA1A1A',
      background: '#F5F5F5',
    ),
    darkColors: ColorEntity(
      text: '#FFFFFF',
      primary: '#00629D',
      secondary: '#FC975',
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
        icon: 'settings.svg',
        route: 'settings',
      ),
    ],
  );

  test('should get config from the repository', () async {
    // Arrange
    when(mockRepository.getConfig()).thenAnswer((_) async => const Right(testConfig));

    // Act
    final result = await useCase.call();

    // Assert
    expect(result, const Right(testConfig));
  });

  test('should return failure when repository returns failure', () async {
    // Arrange
    when(mockRepository.getConfig()).thenAnswer((_) async => const Left(ServerFailure('An error has occured')));

    // Act
    final result = await useCase.call();

    // Assert
    expect(result, const Left(ServerFailure('An error has occured')));
  });
}
