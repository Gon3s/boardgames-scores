import 'package:equatable/equatable.dart';

class ConfigEntity extends Equatable {
  const ConfigEntity({required this.appName});

  final String appName;

  @override
  List<Object?> get props => [appName];
}
