import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  ApiProvider() {
    _setupInterceptors();
  }

  void _setupInterceptors() {
    // Add logging interceptor
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
    ));
  }

  // Error handling messages
  String _handleError(Error error) {
    String errorMessage = "Unexpected error occured.";
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.CANCEL:
          errorMessage = "Request to server was cancelled.";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorMessage = "Connection timeout with server.";
          break;
        case DioErrorType.DEFAULT:
          errorMessage =
              "Unable to connect to server. Please try again later.";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorMessage = "Receive timeout with server.";
          break;
        case DioErrorType.RESPONSE:
          errorMessage = error.response.data["error"]["message"];
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorMessage = "Send timeout with server.";
          break;
      }
    }
    return errorMessage;
  }

  // Print error stack for status codes 5XX
  bool _printStack(Error error) {
    if (error is DioError &&
        error.type == DioErrorType.RESPONSE &&
        error.response.statusCode < 500) {
      return false;
    }
    return true;
  }

  Future get(String url) async {
    try {
      final Response response = await _dio.get(url);

      return response.data;
    } catch (err, stack) {
      if (_printStack(err)) {
        print('Exception occured: $err stackTrace: $stack');
      }
      throw Exception(_handleError(err));
    }
  }
}
