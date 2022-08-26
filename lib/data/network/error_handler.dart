import 'package:dio/dio.dart';

import './Failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.success);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.noContent);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.forbidden);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.success);
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.unAuthorized);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.notFound);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.internalServerError);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.connectTimeOut);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.cancel);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.receiveTimeOut);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.sendTimeOut);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.cachError);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.noInternetConncention);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data ( no content )
  static const int BAD_REQUEST = 400; // failure , API rejected request
  static const int UNAUTHORIZED = 401; // faliure , user is not authorized
  static const int FORBIDDEN = 403; // failure , Api rejected request
  static const int NOT_FOUND = 404; // failure , Not found
  static const int INTERNAL_SERVER_ERROR = 500; // failure ,crash in server side

  //local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String success = "Success"; // success with data
  static const String noContent =
      "Success"; // success with no data ( no content )
  static const String badRequest =
      "Bad request , Try again later"; // failure , API rejected request
  static const String unAuthorized =
      "User is unauthorized"; // faliure , user is not authorized
  static const String forbidden =
      "Forbidden request , Try again later"; // failure , Api rejected request
  static const String notFound =
      "some thing went error , Try again later"; // failure , Api rejected request
  static const String internalServerError =
      "some thing went error , Try again later"; // failure ,crash in server side

  //local statuStringode
  static const String connectTimeOut = "Time out error , Try again later";
  static const String cancel = "Request was cancelled , Try again later";
  static const String receiveTimeOut = "Time out error , Try again later";
  static const String sendTimeOut = "Time out error , Try again later";
  static const String cachError = "Cach error , Try again later";
  static const String noInternetConncention =
      "Please check your internet connection";
  static const String DEFAULT = "some thing went error , Try again later";
}

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 400;
}
