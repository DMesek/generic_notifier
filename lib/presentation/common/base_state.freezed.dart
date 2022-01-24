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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BaseStateTearOff {
  const _$BaseStateTearOff();

  _Data<State, OtherStates> data<State, OtherStates>(State data) {
    return _Data<State, OtherStates>(
      data,
    );
  }

  _Loading<State, OtherStates> loading<State, OtherStates>() {
    return _Loading<State, OtherStates>();
  }

  _Other<State, OtherStates> other<State, OtherStates>(
      OtherStates otherStates) {
    return _Other<State, OtherStates>(
      otherStates,
    );
  }

  _ErrorOccured<State, OtherStates> errorOccured<State, OtherStates>(
      Failure failure) {
    return _ErrorOccured<State, OtherStates>(
      failure,
    );
  }
}

/// @nodoc
const $BaseState = _$BaseStateTearOff();

/// @nodoc
mixin _$BaseState<State, OtherStates> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(State data) data,
    required TResult Function() loading,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) errorOccured,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_ErrorOccured<State, OtherStates> value)
        errorOccured,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
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
abstract class _$DataCopyWith<State, OtherStates, $Res> {
  factory _$DataCopyWith(_Data<State, OtherStates> value,
          $Res Function(_Data<State, OtherStates>) then) =
      __$DataCopyWithImpl<State, OtherStates, $Res>;
  $Res call({State data});
}

/// @nodoc
class __$DataCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$DataCopyWith<State, OtherStates, $Res> {
  __$DataCopyWithImpl(_Data<State, OtherStates> _value,
      $Res Function(_Data<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _Data<State, OtherStates>));

  @override
  _Data<State, OtherStates> get _value =>
      super._value as _Data<State, OtherStates>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Data<State, OtherStates>(
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
            other is _Data<State, OtherStates> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<State, OtherStates, _Data<State, OtherStates>> get copyWith =>
      __$DataCopyWithImpl<State, OtherStates, _Data<State, OtherStates>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(State data) data,
    required TResult Function() loading,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) errorOccured,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
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
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_ErrorOccured<State, OtherStates> value)
        errorOccured,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
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
  const factory _Data(State data) = _$_Data<State, OtherStates>;

  State get data;
  @JsonKey(ignore: true)
  _$DataCopyWith<State, OtherStates, _Data<State, OtherStates>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<State, OtherStates, $Res> {
  factory _$LoadingCopyWith(_Loading<State, OtherStates> value,
          $Res Function(_Loading<State, OtherStates>) then) =
      __$LoadingCopyWithImpl<State, OtherStates, $Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$LoadingCopyWith<State, OtherStates, $Res> {
  __$LoadingCopyWithImpl(_Loading<State, OtherStates> _value,
      $Res Function(_Loading<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _Loading<State, OtherStates>));

  @override
  _Loading<State, OtherStates> get _value =>
      super._value as _Loading<State, OtherStates>;
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
            other is _Loading<State, OtherStates>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(State data) data,
    required TResult Function() loading,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) errorOccured,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
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
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_ErrorOccured<State, OtherStates> value)
        errorOccured,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
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
abstract class _$OtherCopyWith<State, OtherStates, $Res> {
  factory _$OtherCopyWith(_Other<State, OtherStates> value,
          $Res Function(_Other<State, OtherStates>) then) =
      __$OtherCopyWithImpl<State, OtherStates, $Res>;
  $Res call({OtherStates otherStates});
}

/// @nodoc
class __$OtherCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$OtherCopyWith<State, OtherStates, $Res> {
  __$OtherCopyWithImpl(_Other<State, OtherStates> _value,
      $Res Function(_Other<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _Other<State, OtherStates>));

  @override
  _Other<State, OtherStates> get _value =>
      super._value as _Other<State, OtherStates>;

  @override
  $Res call({
    Object? otherStates = freezed,
  }) {
    return _then(_Other<State, OtherStates>(
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
            other is _Other<State, OtherStates> &&
            const DeepCollectionEquality()
                .equals(other.otherStates, otherStates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(otherStates));

  @JsonKey(ignore: true)
  @override
  _$OtherCopyWith<State, OtherStates, _Other<State, OtherStates>>
      get copyWith =>
          __$OtherCopyWithImpl<State, OtherStates, _Other<State, OtherStates>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(State data) data,
    required TResult Function() loading,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) errorOccured,
  }) {
    return other(otherStates);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
  }) {
    return other?.call(otherStates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
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
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_ErrorOccured<State, OtherStates> value)
        errorOccured,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
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
  const factory _Other(OtherStates otherStates) = _$_Other<State, OtherStates>;

  OtherStates get otherStates;
  @JsonKey(ignore: true)
  _$OtherCopyWith<State, OtherStates, _Other<State, OtherStates>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorOccuredCopyWith<State, OtherStates, $Res> {
  factory _$ErrorOccuredCopyWith(_ErrorOccured<State, OtherStates> value,
          $Res Function(_ErrorOccured<State, OtherStates>) then) =
      __$ErrorOccuredCopyWithImpl<State, OtherStates, $Res>;
  $Res call({Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$ErrorOccuredCopyWithImpl<State, OtherStates, $Res>
    extends _$BaseStateCopyWithImpl<State, OtherStates, $Res>
    implements _$ErrorOccuredCopyWith<State, OtherStates, $Res> {
  __$ErrorOccuredCopyWithImpl(_ErrorOccured<State, OtherStates> _value,
      $Res Function(_ErrorOccured<State, OtherStates>) _then)
      : super(_value, (v) => _then(v as _ErrorOccured<State, OtherStates>));

  @override
  _ErrorOccured<State, OtherStates> get _value =>
      super._value as _ErrorOccured<State, OtherStates>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_ErrorOccured<State, OtherStates>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }

  @override
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_ErrorOccured<State, OtherStates>
    implements _ErrorOccured<State, OtherStates> {
  const _$_ErrorOccured(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'BaseState<$State, $OtherStates>.errorOccured(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorOccured<State, OtherStates> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$ErrorOccuredCopyWith<State, OtherStates, _ErrorOccured<State, OtherStates>>
      get copyWith => __$ErrorOccuredCopyWithImpl<State, OtherStates,
          _ErrorOccured<State, OtherStates>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(State data) data,
    required TResult Function() loading,
    required TResult Function(OtherStates otherStates) other,
    required TResult Function(Failure failure) errorOccured,
  }) {
    return errorOccured(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
  }) {
    return errorOccured?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(State data)? data,
    TResult Function()? loading,
    TResult Function(OtherStates otherStates)? other,
    TResult Function(Failure failure)? errorOccured,
    required TResult orElse(),
  }) {
    if (errorOccured != null) {
      return errorOccured(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<State, OtherStates> value) data,
    required TResult Function(_Loading<State, OtherStates> value) loading,
    required TResult Function(_Other<State, OtherStates> value) other,
    required TResult Function(_ErrorOccured<State, OtherStates> value)
        errorOccured,
  }) {
    return errorOccured(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
  }) {
    return errorOccured?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<State, OtherStates> value)? data,
    TResult Function(_Loading<State, OtherStates> value)? loading,
    TResult Function(_Other<State, OtherStates> value)? other,
    TResult Function(_ErrorOccured<State, OtherStates> value)? errorOccured,
    required TResult orElse(),
  }) {
    if (errorOccured != null) {
      return errorOccured(this);
    }
    return orElse();
  }
}

abstract class _ErrorOccured<State, OtherStates>
    implements BaseState<State, OtherStates> {
  const factory _ErrorOccured(Failure failure) =
      _$_ErrorOccured<State, OtherStates>;

  Failure get failure;
  @JsonKey(ignore: true)
  _$ErrorOccuredCopyWith<State, OtherStates, _ErrorOccured<State, OtherStates>>
      get copyWith => throw _privateConstructorUsedError;
}
