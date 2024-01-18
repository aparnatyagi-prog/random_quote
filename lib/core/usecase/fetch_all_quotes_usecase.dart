import 'package:dartz/dartz.dart';
import 'package:random_quote/core/error/failure.dart';

abstract class FetchAllQuotes<T, Params> {
  Future<Either<Failure, T>?> fetchScreenData(Params params);
}

class NoParams {}
