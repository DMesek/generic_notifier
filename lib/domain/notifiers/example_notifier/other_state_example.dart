// ignore_for_file: always_use_package_imports

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../failure.dart';

part 'other_state_example.freezed.dart';

@freezed
class OtherStateExample with _$OtherStateExample {
  const factory OtherStateExample.empty() = _Empty;

  const factory OtherStateExample.fetching() = _Fetching;

  const factory OtherStateExample.customError(Failure failure) = _CustomError;
}
