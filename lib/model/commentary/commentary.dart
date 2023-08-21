import 'dart:convert';

class Commentary {
  int id;
  String name;
  String? description;
  String? author;
  String? copyright;
  String? htmlStyle;
  Commentary({
    required this.id,
    required this.name,
    this.description,
    this.author,
    this.copyright,
    this.htmlStyle,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    if (description != null) {
      result.addAll({'description': description});
    }
    if (author != null) {
      result.addAll({'author': author});
    }
    if (copyright != null) {
      result.addAll({'copyright': copyright});
    }
    if (htmlStyle != null) {
      result.addAll({'htmlStyle': htmlStyle});
    }

    return result;
  }

  factory Commentary.fromMap(Map<String, dynamic> map) {
    return Commentary(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'],
      author: map['author'],
      copyright: map['copyright'],
      htmlStyle: map['htmlStyle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Commentary.fromJson(String source) => Commentary.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Commentary &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.author == author &&
        other.copyright == copyright &&
        other.htmlStyle == htmlStyle;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ author.hashCode ^ copyright.hashCode ^ htmlStyle.hashCode;
  }
}
