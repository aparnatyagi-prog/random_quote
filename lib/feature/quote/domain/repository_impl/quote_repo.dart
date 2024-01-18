import 'package:dartz/dartz.dart';
import 'package:random_quote/core/error/failure.dart';
import 'package:random_quote/feature/quote/domain/entity/quote_entity.dart';

abstract class Repository {
  Future<Either<Failure, QuoteEntity>?> getQuote();
}
