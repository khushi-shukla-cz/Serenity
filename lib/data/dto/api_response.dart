/// API Response wrapper
class ApiResponse<T> {

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.statusCode,
    this.metadata,
  });

  factory ApiResponse.success({
    required T data,
    String? message,
    int? statusCode,
    Map<String, dynamic>? metadata,
  }) => ApiResponse(
      success: true,
      data: data,
      message: message,
      statusCode: statusCode,
      metadata: metadata,
    );

  factory ApiResponse.error({
    required String message,
    int? statusCode,
    Map<String, dynamic>? metadata,
  }) => ApiResponse(
      success: false,
      message: message,
      statusCode: statusCode,
      metadata: metadata,
    );

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) => ApiResponse(
      success: json['success'] as bool,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  final bool success;
  final T? data;
  final String? message;
  final int? statusCode;
  final Map<String, dynamic>? metadata;

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) => {
        'success': success,
        'data': data != null ? toJsonT(data as T) : null,
        'message': message,
        'statusCode': statusCode,
        'metadata': metadata,
      };
}
