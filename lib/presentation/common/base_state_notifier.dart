import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/either_failure_or.dart';
import '../../domain/failure.dart';
import 'base_state.dart';

typedef _PreHandleData<T> = bool Function(T data);
typedef _PreHandleFailure = bool Function(Failure failure);

class BaseStateNotifier<DataState, OtherStates>
    extends StateNotifier<BaseState<DataState, OtherStates>> {
  BaseStateNotifier() : super(const BaseState.loading());

  @protected
  Future execute(
    EitherFailureOr<DataState> function, {
    _PreHandleData<DataState>? onDataReceived,
    _PreHandleFailure? onFailureOccurred,
    bool withLoading = true,
  }) async {
    if (withLoading) state = const BaseState.loading();
    final either = await function;
    either.fold(
      (failure) => _onFailure(failure, onFailureOccurred),
      (data) => _onData(data, onDataReceived),
    );
  }

  void _onFailure(Failure failure, _PreHandleFailure? onFailureOccurred) {
    if (onFailureOccurred != null) {
      final shouldUpdateState = onFailureOccurred(failure);
      if (shouldUpdateState) state = BaseState.errorOccurred(failure);
    } else {
      state = BaseState.errorOccurred(failure);
    }
  }

  void _onData(DataState data, _PreHandleData<DataState>? onDataRecieved) {
    if (onDataRecieved != null) {
      final shouldUpdateState = onDataRecieved(data);
      if (shouldUpdateState) state = BaseState.data(data);
    } else {
      state = BaseState.data(data);
    }
  }
}
