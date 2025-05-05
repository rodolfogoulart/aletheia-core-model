import 'dart:convert';

class WordsHighlighted {
  int version;
  int start;
  int end;
  int? color;
  WordsHighlighted({
    required this.version,
    required this.start,
    required this.end,
    this.color,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'version': version});
    result.addAll({'start': start});
    result.addAll({'end': end});
    if (color != null) {
      result.addAll({'color': color});
    }

    return result;
  }

  factory WordsHighlighted.fromMap(Map<String, dynamic> map) {
    return WordsHighlighted(
      version: map['version']?.toInt() ?? 0,
      start: map['start']?.toInt() ?? 0,
      end: map['end']?.toInt() ?? 0,
      color: map['color']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WordsHighlighted.fromJson(String source) =>
      WordsHighlighted.fromMap(json.decode(source));

  WordsHighlighted copyWith({
    int? version,
    int? start,
    int? end,
    int? color,
  }) {
    return WordsHighlighted(
      version: version ?? this.version,
      start: start ?? this.start,
      end: end ?? this.end,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'WordHightLight(version: $version, start: $start, end: $end, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordsHighlighted &&
        other.version == version &&
        other.start == start &&
        other.end == end &&
        other.color == color;
  }

  @override
  int get hashCode {
    return version.hashCode ^ start.hashCode ^ end.hashCode ^ color.hashCode;
  }
}
