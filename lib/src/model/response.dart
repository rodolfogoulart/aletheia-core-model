// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///classe de tratamento de resultado
class ResponseRequest<T> {
  T data;
  String? error;
  String? message;
  bool hasData;
  //request duration in microseconds
  final int requestDuration;

  ResponseRequest({
    required this.data,
    this.error,
    this.message,
    this.hasData = false,
    this.requestDuration = 0,
  }) {
    if (data != null) {
      hasData = true;
      if (data is List && ((data as List).isEmpty)) {
        hasData = false;
      }
    }
    if ((error ?? '').isNotEmpty) {
      hasData = false;
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
      'error': error,
      'message': message,
      'hasData': hasData,
      'requestDuration': requestDuration,
    };
  }

  factory ResponseRequest.fromMap(Map<String, dynamic> map) {
    return ResponseRequest<T>(
      data: map['data'],
      error: map['error'] != null ? map['error'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      hasData: map['hasData'] as bool,
      requestDuration: map['requestDuration'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseRequest.fromJson(String source) => ResponseRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
