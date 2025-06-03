// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

class VerseView extends VerseCore {
  ///from user data
  UserVerse? userVerseData;

  ///from table cross reference
  List<VerseCrossReference>? crossReferences;

  ///from table strong
  List<Lexico>? strongReferences;
  // Book? book;
  // BibleVersion? bibleVersion;

  VerseView({
    super.id = 0,
    required super.idBibleVersion,
    required super.idBook,
    required super.numberChapter,
    required super.numberVerse,
    super.numberVerseEnd, //v8
    required super.contentWithOutFormat,
    required super.content, //v12
    this.userVerseData,
    this.crossReferences,
    this.strongReferences,
    // this.book,
    // this.bibleVersion,
  });

  factory VerseView.fromVerseCore(VerseCore verseCore) {
    return VerseView(
      id: verseCore.id,
      idBibleVersion: verseCore.idBibleVersion,
      idBook: verseCore.idBook,
      numberChapter: verseCore.numberChapter,
      numberVerse: verseCore.numberVerse,
      numberVerseEnd: verseCore.numberVerseEnd,
      content: verseCore.content,
      contentWithOutFormat: verseCore.contentWithOutFormat,
    );
  }

  VerseView copyWith({
    int? id,
    int? idBibleVersion,
    int? idBook,
    int? numberChapter,
    int? numberVerse,
    int? numberVerseEnd,
    String? titleVerse,
    String? contentWithOutFormat,
    UserVerse? userVerseData,
    List<VerseCrossReference>? crossReferences,
    List<Content>? content, //v12
    List<Lexico>? strongReferences,
    Book? book,
    BibleVersion? bibleVersion,
  }) {
    return VerseView(
      id: id ?? this.id,
      idBibleVersion: idBibleVersion ?? this.idBibleVersion,
      idBook: idBook ?? this.idBook,
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      numberVerseEnd: numberVerseEnd ?? this.numberVerseEnd,
      contentWithOutFormat: contentWithOutFormat ?? this.contentWithOutFormat,
      userVerseData: userVerseData ?? this.userVerseData,
      crossReferences: crossReferences ?? this.crossReferences,
      content: content ?? this.content,
      strongReferences: strongReferences ?? this.strongReferences,
      // book: book ?? this.book,
      // bibleVersion: bibleVersion ?? this.bibleVersion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is VerseView &&
        other.userVerseData == userVerseData &&
        listEquals(other.crossReferences, crossReferences) &&
        listEquals(other.strongReferences, strongReferences);
    // &&
    // other.book == book &&
    // other.bibleVersion == bibleVersion;
  }

  @override
  int get hashCode {
    return userVerseData.hashCode ^
        crossReferences.hashCode ^
        strongReferences.hashCode;
    // ^
    // book.hashCode ^
    // bibleVersion.hashCode;
  }

  @override
  String toString() {
    return 'VerseView(userVerseData: $userVerseData, crossReferences: $crossReferences, strongReferences: $strongReferences,)'; // book: $book, bibleVersion: $bibleVersion)';
  }

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{
      'id': id,
      'idBibleVersion': idBibleVersion,
      'idBook': idBook,
      'numberChapter': numberChapter,
      'numberVerse': numberVerse,
      'numberVerseEnd': numberVerseEnd,
      'contentWithOutFormat': contentWithOutFormat,
      'content': content.map((x) => x.toMap()).toList(),
      //
      'userVerseData': userVerseData?.toMap(),
      'crossReferences': crossReferences?.map((x) => x.toMap()).toList(),
      'strongReferences': strongReferences?.map((x) => x.toMap()).toList(),
      // 'book': book?.toMap(),
      // 'bibleVersion': bibleVersion?.toMap(),
    };
    // Remove null values from the map
    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory VerseView.fromMap(Map<String, dynamic> map) {
    try {
      return VerseView(
        id: map['id'] as int,
        idBibleVersion: map['idBibleVersion'] as int,
        idBook: map['idBook'] as int,
        numberChapter: map['numberChapter'] as int,
        numberVerse: map['numberVerse'] as int,
        numberVerseEnd: map['numberVerseEnd'] as int?,
        contentWithOutFormat: map['contentWithOutFormat'] as String,
        content: map['content'] != null
            ? List<Content>.from(
                (map['content'] as List).map((x) => Content.fromMap(x)))
            : [],
        userVerseData: map['userVerseData'] != null
            ? UserVerse.fromMap(map['userVerseData'] as Map<String, dynamic>)
            : null,
        crossReferences: map['crossReferences'] != null
            ? List<VerseCrossReference>.from(
                (map['crossReferences'] as List).map<VerseCrossReference?>(
                  (x) => VerseCrossReference.fromMap(x),
                ),
              )
            : null,
        strongReferences: map['strongReferences'] != null
            ? List<Lexico>.from(
                (map['strongReferences'] as List).map<Lexico?>(
                  (x) => Lexico.fromMap(x),
                ),
              )
            : null,
        // book: map['book'] != null
        //     ? Book.fromMap(map['book'] as Map<String, dynamic>)
        //     : null,
        // bibleVersion: map['bibleVersion'] != null
        //     ? BibleVersion.fromMap(map['bibleVersion'] as Map<String, dynamic>)
        //     : null,
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing VerseView.fromMap: $e, \nStack: $stackTrace, \nMap: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory VerseView.fromJson(String source) =>
      VerseView.fromMap(json.decode(source) as Map<String, dynamic>);
}
