// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerEntity {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  List<int> get scores => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerEntityCopyWith<PlayerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerEntityCopyWith<$Res> {
  factory $PlayerEntityCopyWith(
          PlayerEntity value, $Res Function(PlayerEntity) then) =
      _$PlayerEntityCopyWithImpl<$Res, PlayerEntity>;
  @useResult
  $Res call({int? id, String name, bool selected, List<int> scores});
}

/// @nodoc
class _$PlayerEntityCopyWithImpl<$Res, $Val extends PlayerEntity>
    implements $PlayerEntityCopyWith<$Res> {
  _$PlayerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? selected = null,
    Object? scores = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerEntityImplCopyWith<$Res>
    implements $PlayerEntityCopyWith<$Res> {
  factory _$$PlayerEntityImplCopyWith(
          _$PlayerEntityImpl value, $Res Function(_$PlayerEntityImpl) then) =
      __$$PlayerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String name, bool selected, List<int> scores});
}

/// @nodoc
class __$$PlayerEntityImplCopyWithImpl<$Res>
    extends _$PlayerEntityCopyWithImpl<$Res, _$PlayerEntityImpl>
    implements _$$PlayerEntityImplCopyWith<$Res> {
  __$$PlayerEntityImplCopyWithImpl(
      _$PlayerEntityImpl _value, $Res Function(_$PlayerEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? selected = null,
    Object? scores = null,
  }) {
    return _then(_$PlayerEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
      scores: null == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$PlayerEntityImpl extends _PlayerEntity {
  const _$PlayerEntityImpl(
      {this.id = null,
      required this.name,
      this.selected = false,
      final List<int> scores = const []})
      : _scores = scores,
        super._();

  @override
  @JsonKey()
  final int? id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool selected;
  final List<int> _scores;
  @override
  @JsonKey()
  List<int> get scores {
    if (_scores is EqualUnmodifiableListView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scores);
  }

  @override
  String toString() {
    return 'PlayerEntity(id: $id, name: $name, selected: $selected, scores: $scores)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality().equals(other._scores, _scores));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, selected,
      const DeepCollectionEquality().hash(_scores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerEntityImplCopyWith<_$PlayerEntityImpl> get copyWith =>
      __$$PlayerEntityImplCopyWithImpl<_$PlayerEntityImpl>(this, _$identity);
}

abstract class _PlayerEntity extends PlayerEntity {
  const factory _PlayerEntity(
      {final int? id,
      required final String name,
      final bool selected,
      final List<int> scores}) = _$PlayerEntityImpl;
  const _PlayerEntity._() : super._();

  @override
  int? get id;
  @override
  String get name;
  @override
  bool get selected;
  @override
  List<int> get scores;
  @override
  @JsonKey(ignore: true)
  _$$PlayerEntityImplCopyWith<_$PlayerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
