// ignore_for_file: always_use_package_imports

import 'package:dartz/dartz.dart';

import 'entitites/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
