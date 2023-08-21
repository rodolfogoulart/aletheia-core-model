///classe de tratamento de resultado
class Response<T> {
  T data;
  String? error;
  bool hasData = false;
  Response({
    required this.data,
    this.error,
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
}
