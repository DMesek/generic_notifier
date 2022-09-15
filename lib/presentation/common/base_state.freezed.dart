// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<State, OtherStates> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State, OtherStates> value) initial,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_Error<State, OtherStates> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<State, OtherStates, $Res> {
  factory $BaseStateCopyWith(BaseState<State, OtherStates> value,
          $Res Function(BaseState<State, OtherStates>) then) =
      _$BaseStateCopyWithImpl<State, OtherStates, $Res>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements $BaseStateCopyWith<State, OtherStates, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  final BaseState<State, OtherStates> _value;
  // ignore: unused_field
  final $Res Function(BaseState<State, OtherStates>) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<State, OtherStates, $Res> {
  factory _$$_InitialCopyWith(_$_Initial<State, OtherStates> value,
          $Res Function(_$_Initial<State, OtherStates>) then) =
      __$$_InitialCopyWithImpl<State, OtherStates, $Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$$_InitialCopyWith<State, OtherStates, $Res> {
  __$$_InitialCopyWithImpl(_$_Initial<State, OtherStates> _value,
      $Res Function(_$_Initial<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _$_Initial<State, OtherStates>));

  @override
  _$_Initial<State, OtherStates> get _value =>
      super._value as _$_Initial<State, OtherStates>;
}

/// @nodoc

class _$_Initial<State, OtherStates> implements _Initial<State, OtherStates> {
  const _$_Initial();

  @override
  String toString() {
    return 'BaseState<$State, $OtherStates>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial<State, OtherStates>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State, OtherStates> value) initial,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_Error<State, OtherStates> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<State, OtherStates>
    implements BaseState<State, OtherStates> {
  const factory _Initial() = _$_Initial<State, OtherStates>;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<State, OtherStates, $Res> {
  factory _$$_LoadingCopyWith(_$_Loading<State, OtherStates> value,
          $Res Function(_$_Loading<State, OtherStates>) then) =
      __$$_LoadingCopyWithImpl<State, OtherStates, $Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$$_LoadingCopyWith<State, OtherStates, $Res> {
  __$$_LoadingCopyWithImpl(_$_Loading<State, OtherStates> _value,
      $Res Function(_$_Loading<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _$_Loading<State, OtherStates>));

  @override
  _$_Loading<State, OtherStates> get _value =>
      super._value as _$_Loading<State, OtherStates>;
}

/// @nodoc

class _$_Loading<State, OtherStates> implements _Loading<State, OtherStates> {
  const _$_Loading();

  @override
  String toString() {
    return 'BaseState<$State, $OtherStates>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading<State, OtherStates>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State, OtherStates> value) initial,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_Error<State, OtherStates> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<State, OtherStates>
    implements BaseState<State, OtherStates> {
  const factory _Loading() = _$_Loading<State, OtherStates>;
}

/// @nodoc
abstract class _$$_DataCopyWith<State, OtherStates, $Res> {
  factory _$$_DataCopyWith(_$_Data<State, OtherStates> value,
          $Res Function(_$_Data<State, OtherStates>) then) =
      __$$_DataCopyWithImpl<State, OtherStates, $Res>;
  $Res call({State data});
}

/// @nodoc
class __$$_DataCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$$_DataCopyWith<State, OtherStates, $Res> {
  __$$_DataCopyWithImpl(_$_Data<State, OtherStates> _value,
      $Res Function(_$_Data<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _$_Data<State, OtherStates>));

  @override
  _$_Data<State, OtherStates> get _value =>
      super._value as _$_Data<State, OtherStates>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_Data<State, OtherStates>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as State,
    ));
  }
}

/// @nodoc

class _$_Data<State, OtherStates> implements _Data<State, OtherStates> {
  const _$_Data(this.data);

  @override
  final State data;

  @override
  String toString() {
    return 'BaseState<$State, $OtherStates>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data<State, OtherStates> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_DataCopyWith<State, OtherStates, _$_Data<State, OtherStates>>
      get copyWith => __$$_DataCopyWithImpl<State, OtherStates,
          _$_Data<State, OtherStates>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State, OtherStates> value) initial,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_Error<State, OtherStates> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<State, OtherStates>
    implements BaseState<State, OtherStates> {
  const factory _Data(final State data) = _$_Data<State, OtherStates>;

  State get data;
  @JsonKey(ignore: true)
  _$$_DataCopyWith<State, OtherStates, _$_Data<State, OtherStates>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OtherCopyWith<State, OtherStates, $Res> {
  factory _$$_OtherCopyWith(_$_Other<State, OtherStates> value,
          $Res Function(_$_Other<State, OtherStates>) then) =
      __$$_OtherCopyWithImpl<State, OtherStates, $Res>;
  $Res call({OtherStates otherStates});
}

/// @nodoc
class __$$_OtherCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$$_OtherCopyWith<State, OtherStates, $Res> {
  __$$_OtherCopyWithImpl(_$_Other<State, OtherStates> _value,
      $Res Function(_$_Other<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _$_Other<State, OtherStates>));

  @override
  _$_Other<State, OtherStates> get _value =>
      super._value as _$_Other<State, OtherStates>;

  @override
  $Res call({
    Object? otherStates = freezed,
  }) {
    return _then(_$_Other<State, OtherStates>(
      otherStates == freezed
          ? _value.otherStates
          : otherStates // ignore: cast_nullable_to_non_nullable
              as OtherStates,
    ));
  }
}

/// @nodoc

class _$_Other<State, OtherStates> implements _Other<State, OtherStates> {
  const _$_Other(this.otherStates);

  @override
  final OtherStates otherStates;

  @override
  String toString() {
    return 'BaseState<$State, $OtherStates>.other(otherStates: $otherStates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Other<State, OtherStates> &&
            const DeepCollectionEquality()
                .equals(other.otherStates, otherStates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(otherStates));

  @JsonKey(ignore: true)
  @override
  _$$_OtherCopyWith<State, OtherStates, _$_Other<State, OtherStates>>
      get copyWith => __$$_OtherCopyWithImpl<State, OtherStates,
          _$_Other<State, OtherStates>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) error,
  }) {
    return other(otherStates);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
  }) {
    return other?.call(otherStates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(otherStates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State, OtherStates> value) initial,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_Error<State, OtherStates> value) error,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class _Other<State, OtherStates>
    implements BaseState<State, OtherStates> {
  const factory _Other(final OtherStates otherStates) =
      _$_Other<State, OtherStates>;

  OtherStates get otherStates;
  @JsonKey(ignore: true)
  _$$_OtherCopyWith<State, OtherStates, _$_Other<State, OtherStates>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<State, OtherStates, $Res> {
  factory _$$_ErrorCopyWith(_$_Error<State, OtherStates> value,
          $Res Function(_$_Error<State, OtherStates>) then) =
      __$$_ErrorCopyWithImpl<State, OtherStates, $Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$$_ErrorCopyWith<State, OtherStates, $Res> {
  __$$_ErrorCopyWithImpl(_$_Error<State, OtherStates> _value,
      $Res Function(_$_Error<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _$_Error<State, OtherStates>));

  @override
  _$_Error<State, OtherStates> get _value =>
      super._value as _$_Error<State, OtherStates>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$_Error<State, OtherStates>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_Error<State, OtherStates> implements _Error<State, OtherStates> {
  const _$_Error(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'BaseState<$State, $OtherStates>.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error<State, OtherStates> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<State, OtherStates, _$_Error<State, OtherStates>>
      get copyWith => __$$_ErrorCopyWithImpl<State, OtherStates,
          _$_Error<State, OtherStates>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State, OtherStates> value) initial,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_Error<State, OtherStates> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State, OtherStates> value)? initial,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_Error<State, OtherStates> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<State, OtherStates>
    implements BaseState<State, OtherStates> {
  const factory _Error(final Failure failure) = _$_Error<State, OtherStates>;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<State, OtherStates, _$_Error<State, OtherStates>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtherStateExample {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() fetching,
    required TResult Function() customError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_CustomError value) customError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherStateExampleCopyWith<$Res> {
  factory $OtherStateExampleCopyWith(
          OtherStateExample value, $Res Function(OtherStateExample) then) =
      _$OtherStateExampleCopyWithImpl<$Res>;
}

/// @nodoc
class _$OtherStateExampleCopyWithImpl<$Res>
    implements $OtherStateExampleCopyWith<$Res> {
  _$OtherStateExampleCopyWithImpl(this._value, this._then);

  final OtherStateExample _value;
  // ignore: unused_field
  final $Res Function(OtherStateExample) _then;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res> extends _$OtherStateExampleCopyWithImpl<$Res>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, (v) => _then(v as _$_Empty));

  @override
  _$_Empty get _value => super._value as _$_Empty;
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'OtherStateExample.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() fetching,
    required TResult Function() customError,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_CustomError value) customError,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements OtherStateExample {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$$_FetchingCopyWith<$Res> {
  factory _$$_FetchingCopyWith(
          _$_Fetching value, $Res Function(_$_Fetching) then) =
      __$$_FetchingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchingCopyWithImpl<$Res>
    extends _$OtherStateExampleCopyWithImpl<$Res>
    implements _$$_FetchingCopyWith<$Res> {
  __$$_FetchingCopyWithImpl(
      _$_Fetching _value, $Res Function(_$_Fetching) _then)
      : super(_value, (v) => _then(v as _$_Fetching));

  @override
  _$_Fetching get _value => super._value as _$_Fetching;
}

/// @nodoc

class _$_Fetching implements _Fetching {
  const _$_Fetching();

  @override
  String toString() {
    return 'OtherStateExample.fetching()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Fetching);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() fetching,
    required TResult Function() customError,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_CustomError value) customError,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class _Fetching implements OtherStateExample {
  const factory _Fetching() = _$_Fetching;
}

/// @nodoc
abstract class _$$_CustomErrorCopyWith<$Res> {
  factory _$$_CustomErrorCopyWith(
          _$_CustomError value, $Res Function(_$_CustomError) then) =
      __$$_CustomErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CustomErrorCopyWithImpl<$Res>
    extends _$OtherStateExampleCopyWithImpl<$Res>
    implements _$$_CustomErrorCopyWith<$Res> {
  __$$_CustomErrorCopyWithImpl(
      _$_CustomError _value, $Res Function(_$_CustomError) _then)
      : super(_value, (v) => _then(v as _$_CustomError));

  @override
  _$_CustomError get _value => super._value as _$_CustomError;
}

/// @nodoc

class _$_CustomError implements _CustomError {
  const _$_CustomError();

  @override
  String toString() {
    return 'OtherStateExample.customError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CustomError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() fetching,
    required TResult Function() customError,
  }) {
    return customError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
  }) {
    return customError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function()? customError,
    required TResult orElse(),
  }) {
    if (customError != null) {
      return customError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_CustomError value) customError,
  }) {
    return customError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
  }) {
    return customError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_CustomError value)? customError,
    required TResult orElse(),
  }) {
    if (customError != null) {
      return customError(this);
    }
    return orElse();
  }
}

abstract class _CustomError implements OtherStateExample {
  const factory _CustomError() = _$_CustomError;
}
