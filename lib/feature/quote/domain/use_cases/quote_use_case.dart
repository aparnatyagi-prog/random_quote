
import 'package:dartz/dartz.dart';
import 'package:random_quote/core/error/failure.dart';
import 'package:random_quote/core/usecase/fetch_all_quotes_usecase.dart';
import 'package:random_quote/feature/quote/data/repository/quote_repo.dart';
import 'package:random_quote/feature/quote/domain/entity/quote_entity.dart';

class GetQuoteUseCase implements FetchAllQuotes<QuoteEntity, NoParams> {
   QuoteRepositoryImpl? quoteRepository;

  GetQuoteUseCase({QuoteRepositoryImpl? quoteRepository}){
    this.quoteRepository = quoteRepository ?? QuoteRepositoryImpl();
  }
  @override
  Future<Either<Failure, QuoteEntity>?> fetchScreenData(NoParams params) async {
    return await quoteRepository?.getQuote();
  }
}
