import 'package:dartz/dartz.dart';
import 'package:random_quote/core/common/constant.dart';
import 'package:random_quote/core/error/error_handler.dart';
import 'package:random_quote/core/error/failure.dart';
import 'package:random_quote/core/network/network_check.dart';
import 'package:random_quote/feature/quote/data/data_source/api/quote_api/quote_datasource_impl.dart';
import 'package:random_quote/feature/quote/domain/entity/quote_entity.dart';
import 'package:random_quote/feature/quote/domain/repository_impl/quote_repo.dart';

class QuoteRepositoryImpl implements Repository {
   QuoteDataSourceImpl? quoteDataSource;
   NetworkInfoImpl? networkInfo;

  QuoteRepositoryImpl({QuoteDataSourceImpl? quoteDataSource, NetworkInfoImpl? networkInfo}){
    this.quoteDataSource = quoteDataSource ?? QuoteDataSourceImpl();
    this.networkInfo = networkInfo ?? NetworkInfoImpl();
  }

  @override
  Future<Either<Failure, QuoteEntity>> getQuote() async {
    if (await networkInfo?.isConnected == true) {
      try {
        final data = await quoteDataSource?.getQuote();
        if (data != null) {
          QuoteEntity quoteEntity = QuoteEntity(id: data.id, content: data.content);
          return right(quoteEntity);
        } else {
          return left(ErrorHandler.handle(AppStrings.defaultError).failure);
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const Failure(AppStrings.noInternetError));
    }
  }
}
