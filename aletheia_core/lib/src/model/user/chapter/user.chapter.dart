import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

///v1.0.16
///
class UserChapter {
  int chapter;

  ///id book of the verse
  int idBook;

  ///Pericopes of the chapter
  List<Pericope>? pericopes;

  ///store a json quill delta
  ///
  ///user can add personal introduction for the chapter
  String? notes;

  ///store personal references of the chapter
  List<Reference>? references;

  String? uuid;
  int? hlc;
  //
  DateTime createAt;
  DateTime? updateAt;

  UserChapter({
    required this.chapter,
    required this.idBook,
    this.pericopes,
    this.notes,
    this.references,
    this.uuid,
    this.hlc,
    DateTime? createAt,
    this.updateAt,
  }) : createAt = createAt ?? DateTime.now();

  UserChapter copyWith({
    int? chapter,
    int? idBook,
    List<Pericope>? pericopes,
    String? notes,
    List<Reference>? references,
    String? uuid,
    int? hlc,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return UserChapter(
      chapter: chapter ?? this.chapter,
      idBook: idBook ?? this.idBook,
      pericopes: pericopes ?? this.pericopes,
      notes: notes ?? this.notes,
      references: references ?? this.references,
      uuid: uuid ?? this.uuid,
      hlc: hlc ?? this.hlc,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chapter': chapter,
      'idBook': idBook,
      'pericopes': pericopes?.map((x) => x.toMap()).toList(),
      'notes': notes,
      'references': references?.map((x) => x.toMap()).toList(),
      'uuid': uuid,
      'hlc': hlc,
      'createAt': createAt.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
    };
  }

  factory UserChapter.fromMap(Map<String, dynamic> map) {
    try {
      return UserChapter(
        chapter: map['chapter'] as int,
        idBook: map['idBook'] as int,
        pericopes: map['pericopes'] != null
            ? List<Pericope>.from(
                (map['pericopes'] as List).map<Pericope?>(
                  (x) => Pericope.fromMap(x as Map<String, dynamic>),
                ),
              )
            : null,
        notes: map['notes'] != null ? map['notes'] as String : null,
        references: map['references'] != null
            ? List<Reference>.from(
                (map['references'] as List).map<Reference?>(
                  (x) => Reference.fromMap(x as Map<String, dynamic>),
                ),
              )
            : null,
        uuid: map['uuid'],
        hlc: map['hlc'],
        createAt: DateTime.fromMillisecondsSinceEpoch(
            map['createAt'] ?? DateTime.now().millisecondsSinceEpoch),
        updateAt: map['updateAt'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['updateAt'])
            : null,
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing UserChapter.fromMap: $e, stackTrace: $stackTrace, map: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory UserChapter.fromJson(String source) =>
      UserChapter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserChapter(chapter: $chapter, idBook: $idBook, pericopes: $pericopes, notes: $notes, references: $references, uuid: $uuid, hlc: $hlc, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(covariant UserChapter other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.chapter == chapter &&
        other.idBook == idBook &&
        listEquals(other.pericopes, pericopes) &&
        other.notes == notes &&
        listEquals(other.references, references) &&
        other.uuid == uuid &&
        other.hlc == hlc &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return chapter.hashCode ^
        idBook.hashCode ^
        pericopes.hashCode ^
        notes.hashCode ^
        references.hashCode ^
        uuid.hashCode ^
        hlc.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode;
  }
}
