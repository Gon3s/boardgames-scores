import 'package:equatable/equatable.dart';

import '../../domain/entities/{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}Model extends Equatable {
  final int id;
  final String name;

  const {{name.pascalCase()}}Model({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => {{name.pascalCase()}}Model(
        id: json['id'],
        name: json['name'],
      );

  {{name.pascalCase()}}Entity toEntity() => {{name.pascalCase()}}Entity(
        id: id,
        name: name,
      );

  static List<{{name.pascalCase()}}Model> mockData() => const [
        {{name.pascalCase()}}Model(
          id: 1,
          name: 'Name 1',
        ),
        {{name.pascalCase()}}Model(
          id: 2,
          name: 'Name 2',
        ),
        {{name.pascalCase()}}Model(
          id: 3,
          name: 'Name 3',
        ),
      ];
}
