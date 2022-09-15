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

  Future<void> getSomeStringWithOtherState() async {
    state = const BaseState.other(OtherStateExample.fetching());
    execute(
      _exampleRepository.getSomeOtherString(),
      globalLoading: true,
      withLoadingState: false,
      onFailureOccurred: (_) {
        state = const BaseState.other(OtherStateExample.customError());
        return false;
      },
      onDataReceived: (_) {
        state = const BaseState.other(OtherStateExample.empty());
        return false;
      },
    );
  }

  Future getSomeString() => execute(
        _exampleRepository.getSomeString(),
        globalLoading: true,
        withLoadingState: true,
      );

  Future getSomeOtherString() => execute(
        _exampleRepository.getSomeOtherString(),
        // onDataReceived: _updateOnlyWhenUppercaseFirst,
        // onFailureOccurred: _emitOnlyServerError,
        globalLoading: true,
        withLoadingState: true,
      );

// bool _updateOnlyWhenUppercaseFirst(String sentence) =>
//     sentence.startsWith(RegExp('^[A-Z]'));
//
// bool _emitOnlyServerError(Failure failure) => failure is GenericError;
}
