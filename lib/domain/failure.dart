import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({
    @Default('Unknown error occurred') String? title,
    @Default(false) bool isCritical,
    Object? error,
    StackTrace? stackTrace,
    UniqueKey? uniqueKey,
  }) = GenericError;
}
