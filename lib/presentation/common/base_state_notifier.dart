import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/either_failure_or.dart';
import 'package:reusability/domain/failure.dart';
import 'package:reusability/domain/notifiers/navigation_provider.dart';
import 'package:reusability/domain/notifiers/route_action.dart';
import 'package:reusability/presentation/common/base_loading_indicator.dart';
import 'package:reusability/presentation/common/base_state.dart';
import 'package:reusability/presentation/common/base_widget.dart';

typedef PreHandleData<T> = bool Function(T data);
typedef PreHandleFailure = bool Function(Failure failure);

///[globalLoadingProvider] can be used to show the loading indicator without updating [BaseStateNotifier]
///state. The entire app is wrapped in [BaseWidget] and [BaseLoadingIndicator] can be shown above entire
///app by simply calling [showGlobalLoading]. To hide [BaseLoadingIndicator] simply call [clearGlobalLoading]
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

  ///Calls [RouteActionPushNamed] execute method. Route to new route with the given name
  ///without the need to pass a context
  void navigateToNamed(String routeName) =>
      reader(navigationProvider.notifier).update((_) => RouteActionPushNamed(routeName));

  ///Calls [RouteActionPushReplacement] execute method. Replace the route
  ///without the need to pass a context
  void pushReplacementNamed(String routeName) =>
      reader(navigationProvider.notifier).update((_) => RouteActionPushReplacement(routeName));

  ///Calls [RouteActionPop] execute method. Pop route without the need to pass a context
  void pop() => reader(navigationProvider.notifier).update((_) => RouteActionPop());

  ///Show [BaseLoadingIndicator] above the entire app
  @protected
  void showGlobalLoading() => reader(globalLoadingProvider.notifier).update((state) => true);

  ///Clear [BaseLoadingIndicator]
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

  void _onData(
    DataState data,
    PreHandleData<DataState>? onDataReceived,
    bool withLoadingState,
  ) {
    final shouldUpdateState = onDataReceived?.call(data) ?? true;
    _unsetLoading(shouldUpdateState ? false : withLoadingState);
    if (shouldUpdateState) {
      state = BaseState.data(data);
    }
  }

  ///Shows global loading if [globalLoading] == true
  ///Set [withLoadingState] == true if you want to change [BaseStateNotifier] state to [BaseState.loading]
  _setLoading(bool withLoadingState, bool globalLoading) {
    if (withLoadingState) state = const BaseState.loading();
    if (globalLoading) showGlobalLoading();
  }

  ///Clears global loading
  ///Set [withLoadingState] == true if you want to reset [BaseStateNotifier] state to [BaseState.initial]
  _unsetLoading(bool withLoadingState) {
    if (withLoadingState) state = const BaseState.initial();
    clearGlobalLoading();
  }
}
