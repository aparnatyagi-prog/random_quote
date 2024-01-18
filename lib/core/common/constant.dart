class ApiConstants {
  static String getQuoteUrl = 'https://api.quotable.io/random';
}

class AppStrings {
   /// UI Type Constants
  static const String code = "Code";
  static const String success = "success";
  static const String nextQuote = "Next";

  /// Error Constants
  static const String badRequestError = "This email has been used before";
  static const String noContent = "no_content";
  static const String forbiddenError = "forbidden_error";
  static const String unauthorizedError = "UNAUTHORIZED: Invalid Input Data";
  static const String notFoundError = "ERROR: Not Found";
  static const String conflictError = "conflict_error";
  static const String internalServerError = "internal_server_error";
  static const String unknownError = "unknown_error";
  static const String timeoutError = "timeout_error";
  static const String defaultError = "Error In Fetching Data";
  static const String cacheError = "cache_error";
  static const String noInternetError = "Please Check Your Internet Connection";
  static const String refreshNetwork = "Refresh";
  static const String errorText = "Something Went Wrong";

  /// Vertical/Horizontal Constants
  static const double vertical1 = 50;
}

enum Share {
  twitter,
}

