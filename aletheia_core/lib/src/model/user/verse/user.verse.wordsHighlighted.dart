import 'dart:convert';

enum TypeHighlight {
  /// Highlight with background color
  background,

  /// Highlight with underline
  underline,

  /// Highlight with text color
  textColor;

  const TypeHighlight();

  /// Get the short name representation of the highlight type
  /// used on Dart Class Generation
  toMap() {
    switch (this) {
      case TypeHighlight.background:
        return 'b';
      case TypeHighlight.underline:
        return 'u';
      case TypeHighlight.textColor:
        return 't';
    }
  }

  ///used on Dart Class Generation
  factory TypeHighlight.fromMap(dynamic value) {
    switch (value) {
      case 'b' || 'background':
        return TypeHighlight.background;
      case 'u' || 'underline':
        return TypeHighlight.underline;
      case 't' || 'textColor':
        return TypeHighlight.textColor;
      default:
        return TypeHighlight.background;
    }
  }
}

extension TypeHighlightExtension on TypeHighlight {
  bool get isBackground => this == TypeHighlight.background;
  bool get isUnderline => this == TypeHighlight.underline;
  bool get isTextColor => this == TypeHighlight.textColor;
}

class WordsHighlighted {
  /// Bible Version ID
  ///
  /// use param 'v' on map representation
  int version;

  /// Start index of the highlighted word
  ///
  /// use param 's' on map representation
  int start;

  /// End index of the highlighted word
  ///
  /// use param 'e' on map representation
  int end;

  /// Color represented as integer value
  ///
  /// use param 'c' on map representation
  int? color;

  /// Type of highlight
  ///
  /// default to TypeHighlight.background
  ///
  /// use param 'tH' on map representation
  TypeHighlight typeHighlight;
  WordsHighlighted({
    required this.version,
    required this.start,
    required this.end,
    this.color,

    /// Default to background highlight
    this.typeHighlight = TypeHighlight.background,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'v': version});
    result.addAll({'s': start});
    result.addAll({'e': end});
    if (color != null) {
      result.addAll({'c': color});
    }
    result.addAll({'tH': typeHighlight.toMap()});

    return result;
  }

  factory WordsHighlighted.fromMap(Map<String, dynamic> map) {
    try {
      return WordsHighlighted(
        version: map['version']?.toInt() ?? map['v']?.toInt() ?? 0,
        start: map['start']?.toInt() ?? map['s']?.toInt() ?? 0,
        end: map['end']?.toInt() ?? map['e']?.toInt() ?? 0,
        color: map['color']?.toInt() ?? map['c']?.toInt(),
        typeHighlight: map['typeHighlight'] != null || map['tH'] != null
            ? TypeHighlight.fromMap(map['typeHighlight'] ?? map['tH'])
            : TypeHighlight.background,
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing WordsHighlighted.fromMap: $e, \nstackTrace: $stackTrace, \nmap: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory WordsHighlighted.fromJson(String source) =>
      WordsHighlighted.fromMap(json.decode(source));

  WordsHighlighted copyWith({
    int? version,
    int? start,
    int? end,
    int? color,
    TypeHighlight? typeHighlight,
  }) {
    return WordsHighlighted(
      version: version ?? this.version,
      start: start ?? this.start,
      end: end ?? this.end,
      color: color ?? this.color,
      typeHighlight: typeHighlight ?? this.typeHighlight,
    );
  }

  @override
  String toString() {
    return 'WordHightLight(version: $version, start: $start, end: $end, color: $color, typeHighlight: $typeHighlight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordsHighlighted &&
        other.version == version &&
        other.start == start &&
        other.end == end &&
        other.color == color &&
        other.typeHighlight == typeHighlight;
  }

  @override
  int get hashCode {
    return version.hashCode ^
        start.hashCode ^
        end.hashCode ^
        color.hashCode ^
        typeHighlight.hashCode;
  }
}
