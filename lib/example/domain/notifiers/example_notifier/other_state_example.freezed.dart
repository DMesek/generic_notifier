// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'other_state_example.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtherStateExample {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() fetching,
    required TResult Function(Failure failure) customError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
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
    required TResult Function(Failure failure) customError,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
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
    required TResult Function(Failure failure) customError,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
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
  $Res call({Failure failure});
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

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$_CustomError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_CustomError implements _CustomError {
  const _$_CustomError(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'OtherStateExample.customError(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomError &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_CustomErrorCopyWith<_$_CustomError> get copyWith =>
      __$$_CustomErrorCopyWithImpl<_$_CustomError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() fetching,
    required TResult Function(Failure failure) customError,
  }) {
    return customError(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
  }) {
    return customError?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? fetching,
    TResult Function(Failure failure)? customError,
    required TResult orElse(),
  }) {
    if (customError != null) {
      return customError(failure);
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
  const factory _CustomError(final Failure failure) = _$_CustomError;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_CustomErrorCopyWith<_$_CustomError> get copyWith =>
      throw _privateConstructorUsedError;
}
