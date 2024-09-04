// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core_model/aletheia_core_model.dart';
import 'package:aletheia_core_model/src/model/user/tag/user.tag.dart';

///v1.0.16
///
///
///
///Verse Pericope/breakpoint for the chapter
///
///An extract from a text passage
class Pericope {
  dynamic id;

  ///start of the Pericope
  int start;

  ///end of the Pericope
  int end;

  ///color to the Pericope
  int color;

  ///title of the Pericope
  String? title;

  ///description of the Pericope
  String? description;

  ///references of other passages that are related to the Pericope
  List<Reference>? references;

  ///think about this, add tags, add table of tags, relate the Pericope to tags, relate the verse to tags, and user notes to tags
  List<Tags>? tags;

  ///icon of the Pericope
  int? icon;

  ///creation date
  DateTime? createAt;

  ///update date
  DateTime? updateAt;

  Pericope({
    required this.id,
    required this.start,
    required this.end,
    required this.color,
    this.title,
    this.description,
    this.references,
    this.tags,
    this.icon,
    this.createAt,
    this.updateAt,
  });

  Pericope copyWith({
    dynamic id,
    int? start,
    int? end,
    int? color,
    String? title,
    String? description,
    List<Reference>? references,
    List<Tags>? tags,
    int? icon,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return Pericope(
      id: id ?? this.id,
      start: start ?? this.start,
      end: end ?? this.end,
      color: color ?? this.color,
      title: title ?? this.title,
      description: description ?? this.description,
      references: references ?? this.references,
      tags: tags ?? this.tags,
      icon: icon ?? this.icon,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'start': start,
      'end': end,
      'color': color,
      'title': title,
      'description': description,
      'references': references?.map((x) => x.toMap()).toList(),
      'tags': tags?.map((x) => x.toMap()).toList(),
      'icon': icon,
      'createAt': createAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory Pericope.fromMap(Map<String, dynamic> map) {
    return Pericope(
      id: map['id'] as dynamic,
      start: map['start'] as int,
      end: map['end'] as int,
      color: map['color'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      references: map['references'] != null
          ? List<Reference>.from(
              (map['references'] as List).map<Reference?>(
                (x) => Reference.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      tags: map['tags'] != null
          ? List<Tags>.from(
              (map['tags'] as List).map<Tags?>(
                (x) => Tags.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      icon: map['icon'] != null ? map['icon'] as int : null,
      createAt: map['createAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createAt']) : null,
      updateAt: map['updateAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updateAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pericope.fromJson(String source) => Pericope.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pericope(id: $id, start: $start, end: $end, color: $color, title: $title, description: $description, references: $references, tags: $tags, icon: $icon, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(covariant Pericope other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.start == start &&
        other.end == end &&
        other.color == color &&
        other.title == title &&
        other.description == description &&
        listEquals(other.references, references) &&
        listEquals(other.tags, tags) &&
        other.icon == icon &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        start.hashCode ^
        end.hashCode ^
        color.hashCode ^
        title.hashCode ^
        description.hashCode ^
        references.hashCode ^
        tags.hashCode ^
        icon.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode;
  }
}
