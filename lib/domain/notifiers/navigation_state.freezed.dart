// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? routeName, RouteType routeFunction)
        routing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? routeName, RouteType routeFunction)? routing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? routeName, RouteType routeFunction)? routing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Routing value) routing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Routing value)? routing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Routing value)? routing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$NavigationStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'NavigationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? routeName, RouteType routeFunction)
        routing,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? routeName, RouteType routeFunction)? routing,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? routeName, RouteType routeFunction)? routing,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Routing value) routing,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Routing value)? routing,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Routing value)? routing,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NavigationState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_RoutingCopyWith<$Res> {
  factory _$$_RoutingCopyWith(
          _$_Routing value, $Res Function(_$_Routing) then) =
      __$$_RoutingCopyWithImpl<$Res>;
  $Res call({String? routeName, RouteType routeFunction});
}

/// @nodoc
class __$$_RoutingCopyWithImpl<$Res> extends _$NavigationStateCopyWithImpl<$Res>
    implements _$$_RoutingCopyWith<$Res> {
  __$$_RoutingCopyWithImpl(_$_Routing _value, $Res Function(_$_Routing) _then)
      : super(_value, (v) => _then(v as _$_Routing));

  @override
  _$_Routing get _value => super._value as _$_Routing;

  @override
  $Res call({
    Object? routeName = freezed,
    Object? routeFunction = freezed,
  }) {
    return _then(_$_Routing(
      routeName: routeName == freezed
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      routeFunction: routeFunction == freezed
          ? _value.routeFunction
          : routeFunction // ignore: cast_nullable_to_non_nullable
              as RouteType,
    ));
  }
}

/// @nodoc

class _$_Routing implements _Routing {
  const _$_Routing({this.routeName, this.routeFunction = RouteType.pushNamed});

  @override
  final String? routeName;
  @override
  @JsonKey()
  final RouteType routeFunction;

  @override
  String toString() {
    return 'NavigationState.routing(routeName: $routeName, routeFunction: $routeFunction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Routing &&
            const DeepCollectionEquality().equals(other.routeName, routeName) &&
            const DeepCollectionEquality()
                .equals(other.routeFunction, routeFunction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(routeName),
      const DeepCollectionEquality().hash(routeFunction));

  @JsonKey(ignore: true)
  @override
  _$$_RoutingCopyWith<_$_Routing> get copyWith =>
      __$$_RoutingCopyWithImpl<_$_Routing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? routeName, RouteType routeFunction)
        routing,
  }) {
    return routing(routeName, routeFunction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? routeName, RouteType routeFunction)? routing,
  }) {
    return routing?.call(routeName, routeFunction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? routeName, RouteType routeFunction)? routing,
    required TResult orElse(),
  }) {
    if (routing != null) {
      return routing(routeName, routeFunction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Routing value) routing,
  }) {
    return routing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Routing value)? routing,
  }) {
    return routing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Routing value)? routing,
    required TResult orElse(),
  }) {
    if (routing != null) {
      return routing(this);
    }
    return orElse();
  }
}

abstract class _Routing implements NavigationState {
  const factory _Routing(
      {final String? routeName, final RouteType routeFunction}) = _$_Routing;

  String? get routeName;
  RouteType get routeFunction;
  @JsonKey(ignore: true)
  _$$_RoutingCopyWith<_$_Routing> get copyWith =>
      throw _privateConstructorUsedError;
}
