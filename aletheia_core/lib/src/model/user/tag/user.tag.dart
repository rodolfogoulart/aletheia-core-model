// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tags {
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

  String? uuid;
  int? hlc;

  Tags({
    required this.name,
    required this.active,
    this.description,
    this.createAt,
    this.updateAt,
    this.uuid,
    this.hlc,
  });

  Tags copyWith({
    dynamic id,
    String? name,
    bool? active,
    String? description,
    DateTime? createAt,
    DateTime? updateAt,
    String? uuid,
    int? hlc,
  }) {
    return Tags(
      name: name ?? this.name,
      active: active ?? this.active,
      description: description ?? this.description,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
      uuid: uuid ?? this.uuid,
      hlc: hlc ?? this.hlc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'active': active,
      'description': description,
      'createAt': createAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
      'uuid': uuid,
      'hlc': hlc,
    };
  }

  factory Tags.fromMap(Map<String, dynamic> map) {
    try {
      return Tags(
        name: map['name'],
        active: map['active'],
        description: map['description'],
        createAt: map['createAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int)
            : null,
        updateAt: map['updateAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['updateAt'] as int)
            : null,
        uuid: map['uuid'],
        hlc: map['hlc'],
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing Tags.fromMap: $e, \nstackTrace: $stackTrace, \nmap: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory Tags.fromJson(String source) =>
      Tags.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Tags(name: $name, active: $active, description: $description, createAt: $createAt, updateAt: $updateAt, uuid: $uuid, hlc: $hlc)';
  }

  @override
  bool operator ==(covariant Tags other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.active == active &&
        other.description == description &&
        other.createAt == createAt &&
        other.updateAt == updateAt &&
        other.uuid == uuid &&
        other.hlc == hlc;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        active.hashCode ^
        description.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode ^
        uuid.hashCode ^
        hlc.hashCode;
  }
}
