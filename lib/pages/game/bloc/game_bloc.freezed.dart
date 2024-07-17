// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newGame,
    required TResult Function() pause,
    required TResult Function(int index) onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newGame,
    TResult? Function()? pause,
    TResult? Function(int index)? onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newGame,
    TResult Function()? pause,
    TResult Function(int index)? onTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_newGame value) newGame,
    required TResult Function(_pause value) pause,
    required TResult Function(_onTap value) onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_newGame value)? newGame,
    TResult? Function(_pause value)? pause,
    TResult? Function(_onTap value)? onTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_newGame value)? newGame,
    TResult Function(_pause value)? pause,
    TResult Function(_onTap value)? onTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res, GameEvent>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res, $Val extends GameEvent>
    implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$newGameImplCopyWith<$Res> {
  factory _$$newGameImplCopyWith(
          _$newGameImpl value, $Res Function(_$newGameImpl) then) =
      __$$newGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$newGameImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$newGameImpl>
    implements _$$newGameImplCopyWith<$Res> {
  __$$newGameImplCopyWithImpl(
      _$newGameImpl _value, $Res Function(_$newGameImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$newGameImpl implements _newGame {
  const _$newGameImpl();

  @override
  String toString() {
    return 'GameEvent.newGame()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$newGameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newGame,
    required TResult Function() pause,
    required TResult Function(int index) onTap,
  }) {
    return newGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newGame,
    TResult? Function()? pause,
    TResult? Function(int index)? onTap,
  }) {
    return newGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newGame,
    TResult Function()? pause,
    TResult Function(int index)? onTap,
    required TResult orElse(),
  }) {
    if (newGame != null) {
      return newGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_newGame value) newGame,
    required TResult Function(_pause value) pause,
    required TResult Function(_onTap value) onTap,
  }) {
    return newGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_newGame value)? newGame,
    TResult? Function(_pause value)? pause,
    TResult? Function(_onTap value)? onTap,
  }) {
    return newGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_newGame value)? newGame,
    TResult Function(_pause value)? pause,
    TResult Function(_onTap value)? onTap,
    required TResult orElse(),
  }) {
    if (newGame != null) {
      return newGame(this);
    }
    return orElse();
  }
}

abstract class _newGame implements GameEvent {
  const factory _newGame() = _$newGameImpl;
}

/// @nodoc
abstract class _$$pauseImplCopyWith<$Res> {
  factory _$$pauseImplCopyWith(
          _$pauseImpl value, $Res Function(_$pauseImpl) then) =
      __$$pauseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$pauseImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$pauseImpl>
    implements _$$pauseImplCopyWith<$Res> {
  __$$pauseImplCopyWithImpl(
      _$pauseImpl _value, $Res Function(_$pauseImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$pauseImpl implements _pause {
  const _$pauseImpl();

  @override
  String toString() {
    return 'GameEvent.pause()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$pauseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newGame,
    required TResult Function() pause,
    required TResult Function(int index) onTap,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newGame,
    TResult? Function()? pause,
    TResult? Function(int index)? onTap,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newGame,
    TResult Function()? pause,
    TResult Function(int index)? onTap,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_newGame value) newGame,
    required TResult Function(_pause value) pause,
    required TResult Function(_onTap value) onTap,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_newGame value)? newGame,
    TResult? Function(_pause value)? pause,
    TResult? Function(_onTap value)? onTap,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_newGame value)? newGame,
    TResult Function(_pause value)? pause,
    TResult Function(_onTap value)? onTap,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class _pause implements GameEvent {
  const factory _pause() = _$pauseImpl;
}

/// @nodoc
abstract class _$$onTapImplCopyWith<$Res> {
  factory _$$onTapImplCopyWith(
          _$onTapImpl value, $Res Function(_$onTapImpl) then) =
      __$$onTapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$onTapImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$onTapImpl>
    implements _$$onTapImplCopyWith<$Res> {
  __$$onTapImplCopyWithImpl(
      _$onTapImpl _value, $Res Function(_$onTapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$onTapImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$onTapImpl implements _onTap {
  const _$onTapImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'GameEvent.onTap(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onTapImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$onTapImplCopyWith<_$onTapImpl> get copyWith =>
      __$$onTapImplCopyWithImpl<_$onTapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newGame,
    required TResult Function() pause,
    required TResult Function(int index) onTap,
  }) {
    return onTap(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? newGame,
    TResult? Function()? pause,
    TResult? Function(int index)? onTap,
  }) {
    return onTap?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newGame,
    TResult Function()? pause,
    TResult Function(int index)? onTap,
    required TResult orElse(),
  }) {
    if (onTap != null) {
      return onTap(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_newGame value) newGame,
    required TResult Function(_pause value) pause,
    required TResult Function(_onTap value) onTap,
  }) {
    return onTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_newGame value)? newGame,
    TResult? Function(_pause value)? pause,
    TResult? Function(_onTap value)? onTap,
  }) {
    return onTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_newGame value)? newGame,
    TResult Function(_pause value)? pause,
    TResult Function(_onTap value)? onTap,
    required TResult orElse(),
  }) {
    if (onTap != null) {
      return onTap(this);
    }
    return orElse();
  }
}

abstract class _onTap implements GameEvent {
  const factory _onTap(final int index) = _$onTapImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$onTapImplCopyWith<_$onTapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameState {
  List<int> get list => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  bool get finished => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<int> list, int count, bool finished) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<int> list, int count, bool finished)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<int> list, int count, bool finished)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call({List<int> list, int count, bool finished});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? count = null,
    Object? finished = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<int>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> list, int count, bool finished});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? count = null,
    Object? finished = null,
  }) {
    return _then(_$InitialImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<int>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      finished: null == finished
          ? _value.finished
          : finished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<int> list = const [], this.count = 0, this.finished = false})
      : _list = list;

  final List<int> _list;
  @override
  @JsonKey()
  List<int> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final bool finished;

  @override
  String toString() {
    return 'GameState.initial(list: $list, count: $count, finished: $finished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.finished, finished) ||
                other.finished == finished));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), count, finished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<int> list, int count, bool finished) initial,
  }) {
    return initial(list, count, finished);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<int> list, int count, bool finished)? initial,
  }) {
    return initial?.call(list, count, finished);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<int> list, int count, bool finished)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(list, count, finished);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GameState {
  const factory _Initial(
      {final List<int> list,
      final int count,
      final bool finished}) = _$InitialImpl;

  @override
  List<int> get list;
  @override
  int get count;
  @override
  bool get finished;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
