import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_quote/feature/quote/data/data_source/api/quote_api/quote_datasource.dart';
import 'package:random_quote/feature/quote/data/models/quote_model.dart';

class QuoteDataSourceTest extends Mock implements QuoteDataSource {}

@GenerateMocks([QuoteDataSourceTest])

Future<void> main() async {
  late QuoteDataSourceTest quoteDataSourceTest;
  setUpAll(() {
    quoteDataSourceTest = QuoteDataSourceTest();
  });

  final QuoteModel quoteModel = QuoteModel(
      id: 'hvopOdCj4J6J',
      content: 'We must learn our limits. We are all something, but none of us are everything.',
      author: 'Blaise Pascal',
      tags: [''],
      authorSlug: 'blaise-pascal',
      length: 77,
      dateAdded: '2019-02-13',
      dateModified: '2023-04-14',
  );

    test('test getRandomQuote', () async {
    when(quoteDataSourceTest.getQuote()).thenAnswer((_) async {
      return quoteModel;
    });
    final res = await quoteDataSourceTest.getQuote();
    expect(res, equals(quoteModel));
  });


  test('test getRandomQuote throws Exception', () {
    when(quoteDataSourceTest.getQuote()).thenAnswer((_) async {
      throw Exception();
    });
    final res = quoteDataSourceTest.getQuote();
    expect(res, throwsException);
  });
}




