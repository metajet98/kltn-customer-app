import 'dart:io';

import 'package:dio/dio.dart';

class HttpError extends DioError {
  HttpError(DioError dioError) : super(request: dioError.request, response: dioError.response, type: dioError.type, error: dioError.error);

  @override
  String get message {
    if (error is SocketException) {
      return "network_error_message";
    }

    if (response?.data is Map) {
      final StringBuffer buffer = StringBuffer();
      response?.data?.forEach((key, value) {
        if (buffer.isNotEmpty) {
          buffer.write("\n");
        }
        if (value is List) {
          buffer.write(value.join("\n"));
        } else {
          buffer.write(value);
        }
      });
      return buffer.toString();
    }

    return super.message;
  }
}
