import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Failure extends Equatable {
  final String title;
  final bool isCritical;
  final dynamic error;
  final StackTrace? stackTrace;
  final UniqueKey? uniqueKey;

  const Failure._({
    required this.title,
    this.isCritical = false,
    this.error,
    this.stackTrace,
    this.uniqueKey,
  });

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
