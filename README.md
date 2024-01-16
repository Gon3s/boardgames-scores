# Apside Flutter App Starter Kit



## Getting Started

### Clone project

Rename `flutter_starter_kit` :
- `pubspec.yaml`: name and description
- `android\app\build.gradle`: namespace & applicationId
- `android\app\src\main\kotlin\com\example\flutter_starter_kit\MainActivity.kt`: package
- `android\app\src\main\AndroidManifest.xml`: android:labels
- `ios\Runner\Info.plist`: CFBundleName

## Dependancies

- Riverpod


## Intl

Use [VSCode extension](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)

All translate are in `l10n/` one file by locale

For add a new locale :
- Use `Flutter Intl: Add locale`
- Add it in `ios/Runner/Info.plist`
