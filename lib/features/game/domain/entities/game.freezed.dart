// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get steps => throw _privateConstructorUsedError;
  Map<int, List<ScoreEntity>>? get scores => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameEntityCopyWith<GameEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEntityCopyWith<$Res> {
  factory $GameEntityCopyWith(
          GameEntity value, $Res Function(GameEntity) then) =
      _$GameEntityCopyWithImpl<$Res, GameEntity>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<String> steps,
      Map<int, List<ScoreEntity>>? scores});
}

/// @nodoc
class _$GameEntityCopyWithImpl<$Res, $Val extends GameEntity>
    implements $GameEntityCopyWith<$Res> {
  _$GameEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? steps = null,
    Object? scores = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scores: freezed == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<int, List<ScoreEntity>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameEntityImplCopyWith<$Res>
    implements $GameEntityCopyWith<$Res> {
  factory _$$GameEntityImplCopyWith(
          _$GameEntityImpl value, $Res Function(_$GameEntityImpl) then) =
      __$$GameEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<String> steps,
      Map<int, List<ScoreEntity>>? scores});
}

/// @nodoc
class __$$GameEntityImplCopyWithImpl<$Res>
    extends _$GameEntityCopyWithImpl<$Res, _$GameEntityImpl>
    implements _$$GameEntityImplCopyWith<$Res> {
  __$$GameEntityImplCopyWithImpl(
      _$GameEntityImpl _value, $Res Function(_$GameEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? steps = null,
    Object? scores = freezed,
  }) {
    return _then(_$GameEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scores: freezed == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<int, List<ScoreEntity>>?,
    ));
  }
}

/// @nodoc

class _$GameEntityImpl implements _GameEntity {
  const _$GameEntityImpl(
      {required this.id,
      required this.name,
      final List<String> steps = const [],
      final Map<int, List<ScoreEntity>>? scores})
      : _steps = steps,
        _scores = scores;

  @override
  final int id;
  @override
  final String name;
  final List<String> _steps;
  @override
  @JsonKey()
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  final Map<int, List<ScoreEntity>>? _scores;
  @override
  Map<int, List<ScoreEntity>>? get scores {
    final value = _scores;
    if (value == null) return null;
    if (_scores is EqualUnmodifiableMapView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GameEntity(id: $id, name: $name, steps: $steps, scores: $scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality().equals(other._scores, _scores));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(_scores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameEntityImplCopyWith<_$GameEntityImpl> get copyWith =>
      __$$GameEntityImplCopyWithImpl<_$GameEntityImpl>(this, _$identity);
}

abstract class _GameEntity implements GameEntity {
  const factory _GameEntity(
      {required final int id,
      required final String name,
      final List<String> steps,
      final Map<int, List<ScoreEntity>>? scores}) = _$GameEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  List<String> get steps;
  @override
  Map<int, List<ScoreEntity>>? get scores;
  @override
  @JsonKey(ignore: true)
  _$$GameEntityImplCopyWith<_$GameEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
