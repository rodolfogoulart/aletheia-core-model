// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core_model/aletheia_core_model.dart';

///v1.0.16
///
class UserVerse {
  int id;
  int numberChapter;

  ///id book of the verse
  int idBook;

  ///
  List<ChapterBreakPoint>? breakPoints;
  UserVerse({
    required this.id,
    required this.numberChapter,
    required this.idBook,
    this.breakPoints,
  });

  ///store a json quill delta
  // String? notes;

  ///store personal references of the verse
  // List<Reference>? references;

  UserVerse copyWith({
    int? id,
    int? numberChapter,
    int? idBook,
    List<ChapterBreakPoint>? breakPoints,
  }) {
    return UserVerse(
      id: id ?? this.id,
      numberChapter: numberChapter ?? this.numberChapter,
      idBook: idBook ?? this.idBook,
      breakPoints: breakPoints ?? this.breakPoints,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'numberChapter': numberChapter,
      'idBook': idBook,
      'breakPoints': breakPoints?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserVerse.fromMap(Map<String, dynamic> map) {
    return UserVerse(
      id: map['id'] as int,
      numberChapter: map['numberChapter'] as int,
      idBook: map['idBook'] as int,
      breakPoints: map['breakPoints'] != null
          ? List<ChapterBreakPoint>.from(
              (map['breakPoints'] as List).map<ChapterBreakPoint?>(
                (x) => ChapterBreakPoint.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVerse.fromJson(String source) => UserVerse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserVerse(id: $id, numberChapter: $numberChapter, idBook: $idBook, breakPoints: $breakPoints)';
  }

  @override
  bool operator ==(covariant UserVerse other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.numberChapter == numberChapter &&
        other.idBook == idBook &&
        listEquals(other.breakPoints, breakPoints);
  }

  @override
  int get hashCode {
    return id.hashCode ^ numberChapter.hashCode ^ idBook.hashCode ^ breakPoints.hashCode;
  }
}
