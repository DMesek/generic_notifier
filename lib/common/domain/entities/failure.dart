// ignore_for_file: always_use_package_imports

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../notifiers/base_state_notifier.dart';

/// Failure class that represents some kind of error that occurs in the app and being passed to UI
class Failure extends Equatable {
  /// title of the Failure which can be shown to user
  final String title;

  /// bool that says if this Failure is a critical one or not and according to it can be displayed to user in a different manner
  final bool isCritical;

  /// error that can be caught by some try catch bloc, useful for debugging
  final dynamic error;

  /// stackTrace of the [error] that can be caught by some try catch bloc, also useful for debugging
  final StackTrace? stackTrace;

  /// uniqueKey set by [BaseStateNotifier.execute] method to trigger [globalFailureProvider] each time
  final UniqueKey? uniqueKey;

  const Failure._({
    required this.title,
    this.isCritical = false,
    this.error,
    this.stackTrace,
    this.uniqueKey,
  });

  /// Generic Failure constructor with default title if not provided
  factory Failure.generic({
    String? title,
    bool isCritical = false,
    dynamic error,
    StackTrace? stackTrace,
    UniqueKey? uniqueKey,
  }) =>
      Failure._(
        title: title ?? 'Unknown error occurred',
        isCritical: isCritical,
        error: error,
        stackTrace: stackTrace,
        uniqueKey: uniqueKey,
      );

  factory Failure.permissionDenied({
    String? title,
    bool isCritical = false,
    dynamic error,
    StackTrace? stackTrace,
    UniqueKey? uniqueKey,
  }) =>
      Failure._(
        title: title ?? 'Permission has been denied, please enable it in device settings',
        isCritical: isCritical,
        error: error,
        stackTrace: stackTrace,
        uniqueKey: uniqueKey,
      );

  Failure copyWith({
    String? title,
    bool? isCritical,
    dynamic error,
    StackTrace? stackTrace,
    UniqueKey? uniqueKey,
  }) =>
      Failure._(
        title: title ?? this.title,
        isCritical: isCritical ?? this.isCritical,
        error: error ?? this.error,
        stackTrace: stackTrace ?? this.stackTrace,
        uniqueKey: uniqueKey ?? this.uniqueKey,
      );

  @override
  List<Object?> get props => [
        title,
        isCritical,
        error,
        stackTrace,
        uniqueKey,
      ];

  @override
  bool? get stringify => true;
}
