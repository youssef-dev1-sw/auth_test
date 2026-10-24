import 'package:auth_test/handle/error_message.dart';
import 'package:dio/dio.dart';
// import 'package:e_commerce_3/handle/error_message.dart';

class ErrorHandle {
  static ErrorMessage handle(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return ErrorMessage(
        message: "The connection time-out has occurred. Please try again.",
      );
    } else if (error.type == DioExceptionType.connectionError) {
      return ErrorMessage(
        message: "Make sure you’re connected to the internet",
      );
    } else {
      return ErrorMessage(message: "unexpected error");
    }
  }
}
