// ignore_for_file: constant_identifier_names

import 'package:random_quote/core/common/constant.dart';
import 'failure.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  not_found,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  extraDefault
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    failure = DataSource.extraDefault.getFailure();
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return const ServerFailure(
          ResponseMessage.BAD_REQUEST,
        );
      case DataSource.forbidden:
        return const ServerFailure(ResponseMessage.FORBIDDEN);
      case DataSource.unauthorised:
        return const ServerFailure(ResponseMessage.UNAUTHORISED);
      case DataSource.not_found:
        return const ServerFailure(ResponseMessage.NOT_FOUND);
      case DataSource.internalServerError:
        return const ServerFailure(ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.connectTimeout:
        return const ServerFailure(ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.cancel:
        return const ServerFailure(ResponseMessage.CANCEL);
      case DataSource.receiveTimeout:
        return const ServerFailure(ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.sendTimeout:
        return const ServerFailure(ResponseMessage.SEND_TIMEOUT);
      case DataSource.cacheError:
        return const ServerFailure(ResponseMessage.CACHE_ERROR);
      case DataSource.noInternetConnection:
        return const ServerFailure(ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.extraDefault:
        return const ServerFailure(ResponseMessage.DEFAULT);
      default:
        return const ServerFailure(ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.noContent; // success with no content
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, api rejected our request
  static const String FORBIDDEN =
      AppStrings.forbiddenError; // failure,  api rejected our request
  static const String UNAUTHORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String NOT_FOUND = AppStrings
      .notFoundError; // failure, API url is not correct and not found in api side.
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, a crash happened in API side.

  static const String DEFAULT =
      AppStrings.defaultError; // unknown error happened
  static const String CONNECT_TIMEOUT =
      AppStrings.timeoutError; // issue in connectivity
  static const String CANCEL =
      AppStrings.defaultError; // API request was cancelled
  static const String RECEIVE_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String SEND_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String CACHE_ERROR = AppStrings
      .defaultError; //  issue in getting data from local data source (cache)
  static const String NO_INTERNET_CONNECTION =
      AppStrings.noInternetError; // issue in connectivity
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
