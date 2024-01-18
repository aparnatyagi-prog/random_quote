import 'package:random_quote/core/network/api_client.dart';
import 'package:random_quote/feature/quote/data/data_source/api/quote_api/quote_datasource.dart';
import 'package:random_quote/feature/quote/data/models/quote_model.dart';

class QuoteDataSourceImpl implements QuoteDataSource {
  ApiClient? apiClient;

  QuoteDataSourceImpl({this.apiClient}) {
    apiClient = apiClient ?? ApiClient();
  }

  @override
  Future<QuoteModel?> getQuote() async {
    if (apiClient != null) {
      Map<String, dynamic> response = await apiClient!.getQuoteApi();
      return QuoteModel.fromJson(response);
    }
  }
}