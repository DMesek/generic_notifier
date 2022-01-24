import 'package:dartz/dartz.dart';
import 'package:reusability/domain/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
