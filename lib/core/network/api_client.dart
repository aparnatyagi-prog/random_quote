import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_quote/core/common/constant.dart';

class ApiClient {
  // creates an instance of the Singleton class
  static final ApiClient _singleton = ApiClient._internal();
  final http.Client _client = http.Client();
  factory ApiClient() {
    return _singleton;
  }
  ApiClient._internal(); // private constructor

  Future<Map<String, dynamic>> getQuoteApi() async {
    final response = await _client.get(
      Uri.parse(ApiConstants.getQuoteUrl),
    );
    if (response.statusCode == 200) {
      final quoteResponse = json.decode(response.body ?? "");
      return quoteResponse;
    } else {
      return {};
    }
  }
}