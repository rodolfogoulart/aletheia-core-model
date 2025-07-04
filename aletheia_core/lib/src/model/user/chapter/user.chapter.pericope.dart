// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

///v1.0.16
///
///
///
///Verse Pericope/breakpoint for the chapter
///
///An extract from a text passage
class Pericope {
  ///identifier of the UserChapter
  dynamic idChapter;

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
  String? icon;

  ///creation date
  DateTime? createAt;

  ///update date
  DateTime? updateAt;

  ///List of messages related to this Pericope
  ///store the id of the UserNotes
  List<dynamic>? idUserNotes;

  String? uuid;
  int? hlc;

  Pericope({
    this.idChapter,
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
    this.idUserNotes,
    this.uuid,
    this.hlc,
  });

  Pericope copyWith({
    dynamic idChapter,
    int? start,
    int? end,
    int? color,
    String? title,
    String? description,
    List<Reference>? references,
    List<Tags>? tags,
    String? icon,
    DateTime? createAt,
    DateTime? updateAt,
    List<dynamic>? idUserNotes,
    String? uuid,
    int? hlc,
  }) {
    return Pericope(
      idChapter: idChapter ?? this.idChapter,
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
      idUserNotes: idUserNotes ?? this.idUserNotes,
      uuid: uuid ?? this.uuid,
      hlc: hlc ?? this.hlc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idChapter': idChapter,
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
      'idUserNotes': idUserNotes,
      'uuid': uuid,
      'hlc': hlc,
    };
  }

  factory Pericope.fromMap(Map<String, dynamic> map) {
    try {
      return Pericope(
        idChapter: map['idChapter'] as dynamic,
        start: map['start'] as int,
        end: map['end'] as int,
        color: map['color'] as int,
        title: map['title'] != null ? map['title'] as String : null,
        description:
            map['description'] != null ? map['description'] as String : null,
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
        icon: map['icon'] != null ? map['icon'] as String : null,
        createAt: map['createAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['createAt'])
            : null,
        updateAt: map['updateAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['updateAt'])
            : null,
        idUserNotes: map['idUserNotes'] != null
            ? List.from((map['idUserNotes'] as List))
            : null,
        uuid: map['uuid'],
        hlc: map['hlc'],
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing Pericope.fromMap: $e, map: $map, stackTrace: $stackTrace');
    }
  }

  String toJson() => json.encode(toMap());

  factory Pericope.fromJson(String source) =>
      Pericope.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pericope(idChapter: $idChapter, start: $start, end: $end, color: $color, title: $title, description: $description, references: $references, tags: $tags, icon: $icon, createAt: $createAt, updateAt: $updateAt, idUserNotes: $idUserNotes, uuid: $uuid, hlc: $hlc)';
  }

  @override
  bool operator ==(covariant Pericope other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.idChapter == idChapter &&
        other.start == start &&
        other.end == end &&
        other.color == color &&
        other.title == title &&
        other.description == description &&
        listEquals(other.references, references) &&
        listEquals(other.tags, tags) &&
        other.icon == icon &&
        other.createAt == createAt &&
        other.updateAt == updateAt &&
        listEquals(other.idUserNotes, idUserNotes) &&
        other.uuid == uuid &&
        other.hlc == hlc;
  }

  @override
  int get hashCode {
    return idChapter.hashCode ^
        start.hashCode ^
        end.hashCode ^
        color.hashCode ^
        title.hashCode ^
        description.hashCode ^
        references.hashCode ^
        tags.hashCode ^
        icon.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode ^
        idUserNotes.hashCode ^
        uuid.hashCode ^
        hlc.hashCode;
  }
}
