import 'package:dio/dio.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class CheckResponseStatus {
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.data.toString());
        // print(responseJson);
        // return responseJson;
        return response.data;

      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      case 404:
        throw FetchDataException('Page not found : ${response.statusCode}');
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
