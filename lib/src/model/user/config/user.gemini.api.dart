// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///Config for GeminiApi
class GeminiApiConfig {
  String apiKey;
  double temperature;
  int topK;
  double topP;
  int maxOutputTokens;
  GeminiApiConfig({
    required this.apiKey,
    required this.temperature,
    required this.topK,
    required this.topP,
    required this.maxOutputTokens,
  });

  GeminiApiConfig copyWith({
    String? apiKey,
    double? temperature,
    int? topK,
    double? topP,
    int? maxOutputTokens,
  }) {
    return GeminiApiConfig(
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

  factory GeminiApiConfig.fromMap(Map<String, dynamic> map) {
    return GeminiApiConfig(
      apiKey: map['apiKey'] as String,
      temperature: map['temperature'] as double,
      topK: map['topK'] as int,
      topP: map['topP'] as double,
      maxOutputTokens: map['maxOutputTokens'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeminiApiConfig.fromJson(String source) => GeminiApiConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GeminiApiConfig(apiKey: $apiKey, temperature: $temperature, topK: $topK, topP: $topP, maxOutputTokens: $maxOutputTokens)';
  }

  @override
  bool operator ==(covariant GeminiApiConfig other) {
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
