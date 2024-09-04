import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core_model/aletheia_core_model.dart';

///v1.0.16
///
class UserChapter {
  dynamic id;
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
  UserChapter({
    this.id,
    required this.chapter,
    required this.idBook,
    this.pericopes,
    this.notes,
    this.references,
  });

  UserChapter copyWith({
    dynamic id,
    int? chapter,
    int? idBook,
    List<Pericope>? pericopes,
    String? notes,
    List<Reference>? references,
  }) {
    return UserChapter(
      id: id ?? this.id,
      chapter: chapter ?? this.chapter,
      idBook: idBook ?? this.idBook,
      pericopes: pericopes ?? this.pericopes,
      notes: notes ?? this.notes,
      references: references ?? this.references,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'chapter': chapter,
      'idBook': idBook,
      'pericopes': pericopes?.map((x) => x.toMap()).toList(),
      'notes': notes,
      'references': references?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserChapter.fromMap(Map<String, dynamic> map) {
    return UserChapter(
      id: map['id'] as dynamic,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory UserChapter.fromJson(String source) => UserChapter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserChapter(id: $id, chapter: $chapter, idBook: $idBook, pericopes: $pericopes, notes: $notes, references: $references)';
  }

  @override
  bool operator ==(covariant UserChapter other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.chapter == chapter &&
        other.idBook == idBook &&
        listEquals(other.pericopes, pericopes) &&
        other.notes == notes &&
        listEquals(other.references, references);
  }

  @override
  int get hashCode {
    return id.hashCode ^ chapter.hashCode ^ idBook.hashCode ^ pericopes.hashCode ^ notes.hashCode ^ references.hashCode;
  }
}
