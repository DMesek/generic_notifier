// ignore_for_file: always_use_package_imports

import 'dart:math';

import 'package:dartz/dartz.dart';

import '../domain/either_failure_or.dart';
import '../domain/failure.dart';

abstract class ExampleRepository {
  EitherFailureOr<String> getSomeString();

  EitherFailureOr<String> getSomeOtherString();
}

class SentenceRepository implements ExampleRepository {
  @override
  EitherFailureOr<String> getSomeOtherString() async {
    await Future.delayed(const Duration(seconds: 3));
    if (Random().nextBool()) {
      return const Right('Some sentence');
    } else {
      return const Right('some sentence');
    }
  }

  @override
  EitherFailureOr<String> getSomeString() async {
    await Future.delayed(const Duration(seconds: 3));
    if (Random().nextBool()) {
      return const Right('some sentence');
    } else {
      return Left(Failure.generic());
    }
  }
}
