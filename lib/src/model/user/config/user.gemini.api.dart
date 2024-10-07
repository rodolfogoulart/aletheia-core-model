import 'dart:convert';

///Config for GeminiApi
class GeminiApi {
  String apiKey;
  double temperature;
  double topK;
  double topP;
  int maxOutputTokens;
  GeminiApi({
    required this.apiKey,
    required this.temperature,
    required this.topK,
    required this.topP,
    required this.maxOutputTokens,
  });

  GeminiApi copyWith({
    String? apiKey,
    double? temperature,
    double? topK,
    double? topP,
    int? maxOutputTokens,
  }) {
    return GeminiApi(
      apiKey: apiKey ?? this.apiKey,
      temperature: temperature ?? this.temperature,
      topK: topK ?? this.topK,
      topP: topP ?? this.topP,
      maxOutputTokens: maxOutputTokens ?? this.maxOutputTokens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'apiKey': apiKey,
      'temperature': temperature,
      'topK': topK,
      'topP': topP,
      'maxOutputTokens': maxOutputTokens,
    };
  }

  factory GeminiApi.fromMap(Map<String, dynamic> map) {
    return GeminiApi(
      apiKey: map['apiKey'] as String,
      temperature: map['temperature'] as double,
      topK: map['topK'] as double,
      topP: map['topP'] as double,
      maxOutputTokens: map['maxOutputTokens'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeminiApi.fromJson(String source) => GeminiApi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GeminiApi(apiKey: $apiKey, temperature: $temperature, topK: $topK, topP: $topP, maxOutputTokens: $maxOutputTokens)';
  }

  @override
  bool operator ==(covariant GeminiApi other) {
    if (identical(this, other)) return true;

    return other.apiKey == apiKey &&
        other.temperature == temperature &&
        other.topK == topK &&
        other.topP == topP &&
        other.maxOutputTokens == maxOutputTokens;
  }

  @override
  int get hashCode {
    return apiKey.hashCode ^ temperature.hashCode ^ topK.hashCode ^ topP.hashCode ^ maxOutputTokens.hashCode;
  }
}
