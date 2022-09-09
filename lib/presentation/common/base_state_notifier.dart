import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/either_failure_or.dart';
import '../../domain/failure.dart';
import 'base_state.dart';

typedef PreHandleData<T> = bool Function(T data);
typedef PreHandleFailure = bool Function(Failure failure);

final loadingProvider = StateProvider<bool>((_) => false);
final globalFailureProvider = StateProvider<Failure?>((_) => null);

abstract class BaseStateNotifier<DataState, OtherStates>
    extends StateNotifier<BaseState<DataState, OtherStates>> {
  final Reader reader;

  BaseStateNotifier(this.reader) : super(const BaseState.initial());

  @protected
  Future execute(
    EitherFailureOr<DataState> function, {
    PreHandleData<DataState>? onDataReceived,
    PreHandleFailure? onFailureOccurred,
    bool withLoading = true,
    bool globalLoading = false,
    bool globalFailure = true
  }) async {
    _setLoading(withLoading, globalLoading);
    final result = await function;
    result.fold(
      (failure) => _onFailure(failure, onFailureOccurred, globalFailure),
      (data) => _onData(data, onDataReceived),
    );
  }

  @protected
  void showLoading() =>
      reader(loadingProvider.notifier).update((state) => true);

  @protected
  void clearLoading() =>
      reader(loadingProvider.notifier).update((state) => false);

  void _setGlobalFailure(Failure? failure) => reader(globalFailureProvider.notifier).update((state) => failure);

  void _onFailure(Failure failure, PreHandleFailure? onFailureOccurred, bool globalFailure) {
    clearLoading();
    _setGlobalFailure(null);
    final shouldProceedWithFailure = onFailureOccurred?.call(failure);
    if (shouldProceedWithFailure ?? true) {
      globalFailure ? _setGlobalFailure(failure) : state = BaseState.error(failure);
    }
  }

  void _onData(DataState data, PreHandleData<DataState>? onDataReceived) {
    clearLoading();
    final shouldUpdateState = onDataReceived?.call(data);
    if (shouldUpdateState ?? true) state = BaseState.data(data);
  }

  _setLoading(bool withLoading, bool globalLoading) {
    if (withLoading) state = const BaseState.loading();
    //Global loading
    if (globalLoading) showLoading();
  }
}
