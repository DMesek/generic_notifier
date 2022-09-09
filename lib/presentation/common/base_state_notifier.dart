import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/either_failure_or.dart';
import '../../domain/failure.dart';
import 'base_state.dart';

typedef PreHandleData<T> = bool Function(T data);
typedef PreHandleFailure = bool Function(Failure failure);

final loadingProvider = StateProvider<bool>((_) => false);

abstract class BaseStateNotifier<DataState, OtherStates>
    extends StateNotifier<BaseState<DataState, OtherStates>> {
  final Ref ref;

  BaseStateNotifier(this.ref) : super(const BaseState.initial());

  @protected
  Future execute(
    EitherFailureOr<DataState> function, {
    PreHandleData<DataState>? onDataReceived,
    PreHandleFailure? onFailureOccurred,
    bool withLoading = true,
    bool globalLoading = false,
  }) async {
    _setLoading(withLoading, globalLoading);
    final result = await function;
    result.fold(
      (failure) => _onFailure(failure, onFailureOccurred),
      (data) => _onData(data, onDataReceived),
    );
  }

  @protected
  void showLoading() =>
      ref.read(loadingProvider.notifier).update((state) => true);

  @protected
  void clearLoading() =>
      ref.read(loadingProvider.notifier).update((state) => false);

  void _onFailure(Failure failure, PreHandleFailure? onFailureOccurred) {
    clearLoading();
    if (onFailureOccurred != null) {
      final shouldUpdateState = onFailureOccurred(failure);
      if (shouldUpdateState) state = BaseState.error(failure);
    } else {
      state = BaseState.error(failure);
    }
  }

  void _onData(DataState data, PreHandleData<DataState>? onDataReceived) {
    print(data);
    print(onDataReceived);
    clearLoading();
    if (onDataReceived != null) {
      final shouldUpdateState = onDataReceived(data);
      print(shouldUpdateState);
      if (shouldUpdateState) state = BaseState.data(data);
    } else {
      state = BaseState.data(data);
    }
  }

  _setLoading(bool withLoading, bool globalLoading) {
    if (withLoading) state = const BaseState.loading();
    //Global loading
    if (globalLoading) showLoading();
  }
}
