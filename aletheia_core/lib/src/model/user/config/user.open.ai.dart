import 'dart:convert';

const String gpt35turbo = 'gpt-3.5-turbo';
const int defaultMaxTokens = 256;
const double defaultTopP = 1;
const double defaultPresencePenalty = 0;
const double defaultFrequencyPenalty = 0;
const double defaultTemperature = .2;

class OpenAIConfig {
  String token;
  double frequencyPenalty;
  int maxTokens;
  double topP;
  double presencePenalty;
  double temperature;
  String model;
  OpenAIConfig({
    required this.token,
    this.maxTokens = defaultMaxTokens,
    this.topP = defaultTopP,
    this.frequencyPenalty = defaultFrequencyPenalty,
    this.presencePenalty = defaultPresencePenalty,
    this.temperature = defaultTemperature,
    this.model = gpt35turbo,
  });

  OpenAIConfig copyWith({
    String? token,
    double? frequencyPenalty,
    int? maxTokens,
    double? topP,
    double? presencePenalty,
    double? temperature,
    String? model,
  }) {
    return OpenAIConfig(
      token: token ?? this.token,
      frequencyPenalty: frequencyPenalty ?? this.frequencyPenalty,
      maxTokens: maxTokens ?? this.maxTokens,
      topP: topP ?? this.topP,
      presencePenalty: presencePenalty ?? this.presencePenalty,
      temperature: temperature ?? this.temperature,
      model: model ?? this.model,
    );
  }

  @override
  String toString() {
    return 'OpenAIConfig(token: $token, frequencyPenalty: $frequencyPenalty, maxTokens: $maxTokens, topP: $topP, presencePenalty: $presencePenalty, temperature: $temperature, model: $model)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'token': token});
    result.addAll({'frequencyPenalty': frequencyPenalty});
    result.addAll({'maxTokens': maxTokens});
    result.addAll({'topP': topP});
    result.addAll({'presencePenalty': presencePenalty});
    result.addAll({'temperature': temperature});
    result.addAll({'model': model});

    return result;
  }

  factory OpenAIConfig.fromMap(Map<String, dynamic> map) {
    try {
      return OpenAIConfig(
        token: map['token'] ?? '',
        frequencyPenalty: map['frequencyPenalty']?.toDouble() ?? 0.0,
        maxTokens: map['maxTokens']?.toInt() ?? 0,
        topP: map['topP']?.toDouble() ?? 0.0,
        presencePenalty: map['presencePenalty']?.toDouble() ?? 0.0,
        temperature: map['temperature']?.toDouble() ?? 0.0,
        model: map['model'] ?? '',
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing OpenAIConfig.fromMap: $e, \nstackTrace: $stackTrace, \nmap: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory OpenAIConfig.fromJson(String source) =>
      OpenAIConfig.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OpenAIConfig &&
        other.token == token &&
        other.frequencyPenalty == frequencyPenalty &&
        other.maxTokens == maxTokens &&
        other.topP == topP &&
        other.presencePenalty == presencePenalty &&
        other.temperature == temperature &&
        other.model == model;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        frequencyPenalty.hashCode ^
        maxTokens.hashCode ^
        topP.hashCode ^
        presencePenalty.hashCode ^
        temperature.hashCode ^
        model.hashCode;
  }
}
