import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reusability/domain/failure.dart';

final globalFailureProvider = StateProvider<Failure?>((_) => null);
