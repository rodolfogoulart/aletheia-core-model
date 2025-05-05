import 'dart:convert';

///
///[semanticRatio] must be a number between 0.0 and 1.0 indicating the proportion between keyword and semantic search results. 0.0 causes Meilisearch to only return keyword results. 1.0 causes Meilisearch to only return meaning-based results. Defaults to 0.5.
class HybridSearchConfig {
  String embedder;
  double semanticRatio;
  HybridSearchConfig({
    required this.embedder,
    required this.semanticRatio,
  });

  HybridSearchConfig copyWith({
    String? embedder,
    double? semanticRatio,
  }) {
    return HybridSearchConfig(
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

  factory HybridSearchConfig.fromMap(Map<String, dynamic> map) {
    return HybridSearchConfig(
      embedder: map['embedder'] as String,
      semanticRatio: map['semanticRatio'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory HybridSearchConfig.fromJson(String source) =>
      HybridSearchConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HybridSearchConfig(embedder: $embedder, semanticRatio: $semanticRatio)';

  @override
  bool operator ==(covariant HybridSearchConfig other) {
    if (identical(this, other)) return true;

    return other.embedder == embedder && other.semanticRatio == semanticRatio;
  }

  @override
  int get hashCode => embedder.hashCode ^ semanticRatio.hashCode;
}
