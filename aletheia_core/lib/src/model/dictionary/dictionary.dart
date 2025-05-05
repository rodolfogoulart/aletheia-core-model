import 'dart:convert';

class Dictionary {
  int id;
  String name;
  String? description;
  String? htmlStyle;
  // String? logUpgrade;

  Dictionary({
    this.id = 0,
    required this.name,
    this.description,
    this.htmlStyle,
  });

  Dictionary copyWith({
    int? id,
    String? name,
    String? description,
    String? htmlStyle,
  }) {
    return Dictionary(
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

  factory Dictionary.fromMap(Map<String, dynamic> map) {
    return Dictionary(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'],
      htmlStyle: map['htmlStyle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Dictionary.fromJson(String source) =>
      Dictionary.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Dictionary(id: $id, name: $name, description: $description, htmlStyle: $htmlStyle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Dictionary &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.htmlStyle == htmlStyle;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        htmlStyle.hashCode;
  }
}
