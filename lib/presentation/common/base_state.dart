import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reusability/domain/failure.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState<State, OtherStates> with _$BaseState<State, OtherStates> {
  const factory BaseState.data(State data) = _Data;
  const factory BaseState.loading() = _Loading;
  const factory BaseState.other(OtherStates otherStates) = _Other;
  const factory BaseState.errorOccurred(Failure failure) = _ErrorOccured;
}
