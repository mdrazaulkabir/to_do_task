import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../constant/app_exception_message.dart';
import 'failures.dart';

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}


Failure handleException(dynamic e, StackTrace stackTrace) {
  if (kDebugMode) {
    log('Exception: $e \n Exception Line: $stackTrace', error: e, stackTrace: stackTrace);
  }

  if (e is FormatException) {
    return ServerFailure(AppExceptionMessage.format);
  } else if (e is TypeError) {
    return ServerFailure(AppExceptionMessage.type);
  } else if (e is TimeoutException) {
    return ServerFailure(AppExceptionMessage.timeout);
  } else if (e is SocketException) {
    return ServerFailure(AppExceptionMessage.socket);
  } else if (e is ServerException) {
    return ServerFailure(e.message);
  } else {
    return ServerFailure(AppExceptionMessage.unknown);
  }
}