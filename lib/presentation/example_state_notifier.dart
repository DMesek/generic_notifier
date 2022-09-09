import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/failure.dart';

import '../data/example_repository.dart';
import 'common/base_state.dart';
import 'common/base_state_notifier.dart';

final exampleNotifierProvider =
    StateNotifierProvider<ExampleStateNotifier, BaseState<String, Object>>(
  (ref) => ExampleStateNotifier(SentenceRepository(), ref.read),
);

class ExampleStateNotifier extends BaseStateNotifier<String, Object> {
  final ExampleRepository _exampleRepository;

  ExampleStateNotifier(this._exampleRepository, Reader reader) : super(reader);

  Future getSomeString() => execute(_exampleRepository.getSomeString());

  Future getSomeOtherString() => execute(
        _exampleRepository.getSomeOtherString(),
        // onDataReceived: _updateOnlyWhenUppercaseFirst,
        // onFailureOccurred: _emitOnlyServerError,
        globalLoading: true,
        withLoadingState: true,
      );

  bool _updateOnlyWhenUppercaseFirst(String sentence) =>
      sentence.startsWith(RegExp('^[A-Z]'));

  bool _emitOnlyServerError(Failure failure) => failure is GenericError;
}