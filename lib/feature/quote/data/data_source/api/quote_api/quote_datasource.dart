import 'package:random_quote/feature/quote/data/models/quote_model.dart';

abstract class QuoteDataSource {
  Future<QuoteModel?>? getQuote();
}
