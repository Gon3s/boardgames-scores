import 'package:equatable/equatable.dart';

class ConfigEntity extends Equatable {
  const ConfigEntity({
    required this.appName,
    required this.lightColors,
    required this.darkColors,
  });

  final String appName;
  final Map<String, dynamic> lightColors;
  final Map<String, dynamic> darkColors;

  @override
  List<Object?> get props => [
        appName,
        lightColors,
        darkColors,
      ];
}
