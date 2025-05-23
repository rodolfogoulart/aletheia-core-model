// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///classe de tratamento de resultado
class ResponseRequest<T> {
  T data;

  ///complementary for data
  dynamic metaData;
  String? error;
  String? message;
  bool _hasData;
  //request duration in milliseconds
  int? duration;

  bool get hasData {
    _hasData = false;
    if (data != null) {
      _hasData = true;
      if (data is List && ((data as List).isEmpty)) _hasData = false;
      if (data is String && ((data as String).isEmpty)) _hasData = false;
    }
    if ((error ?? '').isNotEmpty) {
      _hasData = false;
    }
    return _hasData;
  }

  ResponseRequest({
    required this.data,
    this.error,
    this.metaData,
    this.message,
    bool hasData = false,
    this.duration,
  }) : _hasData = hasData {
    _hasData = false;
    if (data != null) {
      _hasData = true;
      if (data is List && ((data as List).isEmpty)) {
        _hasData = false;
      }
    }
    if ((error ?? '').isNotEmpty) {
      _hasData = false;
    }
  }

  Map<String, dynamic> toMap() {
    var result = <String, dynamic>{
      'data': data,
      // 'hasData': _hasData,
    };
    if (duration != null) {
      result['duration'] = duration;
    }
    if (message != null && message!.isNotEmpty) {
      result['message'] = message;
    }
    if (metaData != null) {
      result['metaData'] = metaData;
    }
    if (error != null) {
      result['error'] = error;
    }

    return result;
  }

  factory ResponseRequest.fromMap(Map<String, dynamic> map) {
    return ResponseRequest<T>(
      data: map['data'],
      metaData: map['metaData'],
      error: map['error'],
      message: map['message'],
      // hasData: map['hasData'],
      duration: map['duration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseRequest.fromJson(String source) =>
      ResponseRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
