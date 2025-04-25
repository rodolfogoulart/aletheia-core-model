import 'dart:convert';

class MeiliSearchConfig {
  String embedder;
  double semanticRatio;
  MeiliSearchConfig({
    required this.embedder,
    required this.semanticRatio,
  });

  MeiliSearchConfig copyWith({
    String? embedder,
    double? semanticRatio,
  }) {
    return MeiliSearchConfig(
      embedder: embedder ?? this.embedder,
      semanticRatio: semanticRatio ?? this.semanticRatio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'embedder': embedder,
      'semanticRatio': semanticRatio,
    };
  }

  factory MeiliSearchConfig.fromMap(Map<String, dynamic> map) {
    return MeiliSearchConfig(
      embedder: map['embedder'] as String,
      semanticRatio: map['semanticRatio'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MeiliSearchConfig.fromJson(String source) => MeiliSearchConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MeiliSearchConfig(embedder: $embedder, semanticRatio: $semanticRatio)';

  @override
  bool operator ==(covariant MeiliSearchConfig other) {
    if (identical(this, other)) return true;

    return other.embedder == embedder && other.semanticRatio == semanticRatio;
  }

  @override
  int get hashCode => embedder.hashCode ^ semanticRatio.hashCode;
}
