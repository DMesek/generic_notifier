// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String? get title => throw _privateConstructorUsedError;
  bool get isCritical => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
  UniqueKey? get uniqueKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call(
      {String? title,
      bool isCritical,
      Object? error,
      StackTrace? stackTrace,
      UniqueKey? uniqueKey});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? isCritical = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
    Object? uniqueKey = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isCritical: isCritical == freezed
          ? _value.isCritical
          : isCritical // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      uniqueKey: uniqueKey == freezed
          ? _value.uniqueKey
          : uniqueKey // ignore: cast_nullable_to_non_nullable
              as UniqueKey?,
    ));
  }
}

/// @nodoc
abstract class _$$GenericErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$GenericErrorCopyWith(
          _$GenericError value, $Res Function(_$GenericError) then) =
      __$$GenericErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? title,
      bool isCritical,
      Object? error,
      StackTrace? stackTrace,
      UniqueKey? uniqueKey});
}

/// @nodoc
class __$$GenericErrorCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$GenericErrorCopyWith<$Res> {
  __$$GenericErrorCopyWithImpl(
      _$GenericError _value, $Res Function(_$GenericError) _then)
      : super(_value, (v) => _then(v as _$GenericError));

  @override
  _$GenericError get _value => super._value as _$GenericError;

  @override
  $Res call({
    Object? title = freezed,
    Object? isCritical = freezed,
    Object? error = freezed,
    Object? stackTrace = freezed,
    Object? uniqueKey = freezed,
  }) {
    return _then(_$GenericError(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isCritical: isCritical == freezed
          ? _value.isCritical
          : isCritical // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed ? _value.error : error,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
      uniqueKey: uniqueKey == freezed
          ? _value.uniqueKey
          : uniqueKey // ignore: cast_nullable_to_non_nullable
              as UniqueKey?,
    ));
  }
}

/// @nodoc

class _$GenericError implements GenericError {
  const _$GenericError(
      {this.title = 'Unknown error occurred',
      this.isCritical = false,
      this.error,
      this.stackTrace,
      this.uniqueKey});

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final bool isCritical;
  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;
  @override
  final UniqueKey? uniqueKey;

  @override
  String toString() {
    return 'Failure(title: $title, isCritical: $isCritical, error: $error, stackTrace: $stackTrace, uniqueKey: $uniqueKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericError &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.isCritical, isCritical) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace) &&
            const DeepCollectionEquality().equals(other.uniqueKey, uniqueKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isCritical),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stackTrace),
      const DeepCollectionEquality().hash(uniqueKey));

  @JsonKey(ignore: true)
  @override
  _$$GenericErrorCopyWith<_$GenericError> get copyWith =>
      __$$GenericErrorCopyWithImpl<_$GenericError>(this, _$identity);
}

abstract class GenericError implements Failure {
  const factory GenericError(
      {final String? title,
      final bool isCritical,
      final Object? error,
      final StackTrace? stackTrace,
      final UniqueKey? uniqueKey}) = _$GenericError;

  @override
  String? get title;
  @override
  bool get isCritical;
  @override
  Object? get error;
  @override
  StackTrace? get stackTrace;
  @override
  UniqueKey? get uniqueKey;
  @override
  @JsonKey(ignore: true)
  _$$GenericErrorCopyWith<_$GenericError> get copyWith =>
      throw _privateConstructorUsedError;
}
