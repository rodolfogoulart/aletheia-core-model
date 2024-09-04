// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tags {
  dynamic id;

  ///name of the tag
  String name;

  ///true if the tag is active
  ///
  ///used to filter tags on the UI
  bool active;

  ///short description about the tag
  String? description;

  ///creation date
  DateTime? createAt;

  ///update date
  DateTime? updateAt;
  Tags({
    this.id,
    required this.name,
    required this.active,
    this.description,
    this.createAt,
    this.updateAt,
  });

  Tags copyWith({
    dynamic id,
    String? name,
    bool? active,
    String? description,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return Tags(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      description: description ?? this.description,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'active': active,
      'description': description,
      'createAt': createAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory Tags.fromMap(Map<String, dynamic> map) {
    return Tags(
      id: map['id'] as dynamic,
      name: map['name'] as String,
      active: map['active'] as bool,
      description: map['description'] != null ? map['description'] as String : null,
      createAt: map['createAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int) : null,
      updateAt: map['updateAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updateAt'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tags.fromJson(String source) => Tags.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tags(id: $id, name: $name, active: $active, description: $description, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(covariant Tags other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.active == active &&
        other.description == description &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ active.hashCode ^ description.hashCode ^ createAt.hashCode ^ updateAt.hashCode;
  }
}
