import 'package:random_quote/core/network/api_clientdart';
import 'package:random_quote/feature/quote/data/data_source/api/quote_api/quote_datasource.dart';
import 'package:random_quote/feature/quote/data/models/quote_model.dart';

class QuoteDataSourceImpl implements QuoteDataSource {
  ApiClient? networkManager;

  QuoteDataSourceImpl({this.networkManager}) {
    networkManager = networkManager ?? ApiClient();
  }

  @override
  Future<QuoteModel?> getQuote() async {
    if (networkManager != null) {
      Map<String, dynamic> response = await networkManager!.getQuoteApi();
      return QuoteModel.fromJson(response);
    }
  }
}