import 'package:equatable/equatable.dart';

class DefaultEntity extends Equatable {
  final int id;
  final String name;

  const DefaultEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
