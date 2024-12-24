import 'dart:convert';

class LexicoVersion {
  int id;
  String name;
  String? description;
  String? htmlStyle;

  LexicoVersion({
    required this.id,
    required this.name,
    this.description,
    this.htmlStyle,
  });

  LexicoVersion copyWith({
    int? id,
    String? name,
    String? description,
    String? htmlStyle,
  }) {
    return LexicoVersion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      htmlStyle: htmlStyle ?? this.htmlStyle,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (description != null) {
      result.addAll({'description': description});
    }
    if (htmlStyle != null) {
      result.addAll({'htmlStyle': htmlStyle});
    }

    return result;
  }

  factory LexicoVersion.fromMap(Map<String, dynamic> map) {
    return LexicoVersion(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'],
      htmlStyle: map['htmlStyle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LexicoVersion.fromJson(String source) => LexicoVersion.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LexicoVersion &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.htmlStyle == htmlStyle;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ htmlStyle.hashCode;
  }

  @override
  String toString() {
    return 'LexicoVersion(id: $id, name: $name, description: $description, htmlStyle: $htmlStyle)';
  }
}
