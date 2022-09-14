import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/presentation/common/base_loading_indicator.dart';
import 'package:reusability/presentation/common/base_widget.dart';

///[globalLoadingProvider] can be used to show the loading indicator without updating [BaseStateNotifier]
///state. The entire app is wrapped in [BaseWidget] and [BaseLoadingIndicator] can be shown above entire
///app by simply calling [showGlobalLoading]. To hide [BaseLoadingIndicator] simply call [clearGlobalLoading]
final globalLoadingProvider = StateProvider<bool>((_) => false);