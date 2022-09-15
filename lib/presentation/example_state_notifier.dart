import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/data/example_repository.dart';
import 'package:reusability/presentation/common/base_state.dart';
import 'package:reusability/presentation/common/base_state_notifier.dart';

final exampleNotifierProvider = StateNotifierProvider<ExampleStateNotifier,
    BaseState<String, OtherStateExample>>(
  (ref) => ExampleStateNotifier(SentenceRepository(), ref.read),
);

class ExampleStateNotifier
    extends BaseStateNotifier<String, OtherStateExample> {
  final ExampleRepository _exampleRepository;

  ExampleStateNotifier(this._exampleRepository, Reader reader) : super(reader);

  ///Example of the API request with loading indicator and not changed state
  Future getSomeString() => execute(
        _exampleRepository.getSomeString(),
        globalLoading: true,
        withLoadingState: false,
      );

  ///Example on how to use additional states
  Future<void> getSomeStringWithOtherState() async {
    state = const BaseState.other(OtherStateExample.fetching());
    execute(
      _exampleRepository.getSomeOtherString(),
      globalLoading: true,
      onFailureOccurred: (error) {
        ///Set custom state
        state = BaseState.other(OtherStateExample.customError(error));

        ///Return false because we don't want to update BaseState to BaseState.error
        return false;
      },
      onDataReceived: (_) {
        ///Set custom state
        state = const BaseState.other(OtherStateExample.empty());

        ///Return false because we don't want to update BaseState to BaseState.data(_)
        return false;
      },
    );
  }
}
