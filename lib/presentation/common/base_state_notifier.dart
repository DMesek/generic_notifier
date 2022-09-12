import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/either_failure_or.dart';
import 'package:reusability/domain/failure.dart';
import 'package:reusability/domain/notifiers/navigation_provider.dart';
import 'package:reusability/domain/notifiers/navigation_state.dart';
import 'package:reusability/presentation/common/base_state.dart';

typedef PreHandleData<T> = bool Function(T data);
typedef PreHandleFailure = bool Function(Failure failure);

final globalLoadingProvider = StateProvider<bool>((_) => false);
final globalFailureProvider = StateProvider<Failure?>((_) => null);

abstract class BaseStateNotifier<DataState, OtherStates> extends StateNotifier<BaseState<DataState, OtherStates>> {
  final Reader reader;

  BaseStateNotifier(this.reader) : super(const BaseState.initial());

  @protected
  Future execute(
    EitherFailureOr<DataState> function, {
    PreHandleData<DataState>? onDataReceived,
    PreHandleFailure? onFailureOccurred,
    bool withLoadingState = true,
    bool globalLoading = false,
    bool globalFailure = true,
  }) async {
    _setLoading(withLoadingState, globalLoading);
    final result = await function;
    result.fold(
      (failure) => _onFailure(
        failure.copyWith(uniqueKey: UniqueKey()),
        onFailureOccurred,
        withLoadingState,
        globalFailure,
      ),
      (data) => _onData(data, onDataReceived, withLoadingState),
    );
  }

  void navigateToNamed(String route) =>
      reader(navigationProvider.notifier).update((_) => NavigationState.routing(routeName: route));

  void pop() => reader(navigationProvider.notifier)
      .update((_) => const NavigationState.routing(routeFunction: RouteFunction.pop));

  void showGlobalLoading() => reader(globalLoadingProvider.notifier).update((state) => true);

  @protected
  void clearGlobalLoading() => reader(globalLoadingProvider.notifier).update((state) => false);

  @protected
  void setGlobalFailure(Failure? failure) => reader(globalFailureProvider.notifier).update((state) => failure);

  void _onFailure(
    Failure failure,
    PreHandleFailure? onFailureOccurred,
    bool withLoadingState,
    bool globalFailure,
  ) {
    final shouldProceedWithFailure = onFailureOccurred?.call(failure) ?? true;
    if (!shouldProceedWithFailure || globalFailure) {
      _unsetLoading(withLoadingState);
    }
    if (shouldProceedWithFailure) {
      globalFailure ? setGlobalFailure(failure) : state = BaseState.error(failure);
    }
  }

  void _onData(DataState data, PreHandleData<DataState>? onDataReceived, bool withLoadingState) {
    final shouldUpdateState = onDataReceived?.call(data) ?? true;
    if (shouldUpdateState) {
      state = BaseState.data(data);
    } else {
      _unsetLoading(withLoadingState);
    }
  }

  _setLoading(bool withLoadingState, bool globalLoading) {
    if (withLoadingState) state = const BaseState.loading();
    if (globalLoading) showGlobalLoading();
  }

  _unsetLoading(bool withLoadingState) {
    if (withLoadingState) state = const BaseState.initial();
    clearGlobalLoading();
  }
}
