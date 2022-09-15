import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reusability/domain/failure.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<State, OtherStates> with _$BaseState<State, OtherStates> {
  const factory BaseState.initial() = _Initial;

  const factory BaseState.loading() = _Loading;

  const factory BaseState.data(State data) = _Data;

  const factory BaseState.other(OtherStates otherStates) = _Other;

  const factory BaseState.error(Failure failure) = _Error;
}

@freezed
class OtherStateExample with _$OtherStateExample {
  const factory OtherStateExample.empty() = _Empty;

  const factory OtherStateExample.fetching() = _Fetching;

  const factory OtherStateExample.customError(Failure failure) = _CustomError;
}
