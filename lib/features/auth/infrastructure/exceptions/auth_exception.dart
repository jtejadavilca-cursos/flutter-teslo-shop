class ConnectionTimeoutException implements Exception {}

class WrongCredentialsException implements Exception {}

class InvalidTokenException implements Exception {}

class CustomException implements Exception {
  final String message;
  final int errorCode;

  CustomException({
    required this.message,
    required this.errorCode,
  });
}
