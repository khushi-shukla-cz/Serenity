/// API Error wrapper
class ApiError implements Exception {

  const ApiError({
    required this.message,
    this.statusCode,
    this.originalError,
    this.stackTrace,
  });
  final String message;
  final int? statusCode;
  final dynamic originalError;
  final StackTrace? stackTrace;

  @override
  String toString() =>
      'ApiError(message: $message, statusCode: $statusCode, originalError: $originalError)';
}
