import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../lexico/lexico.dictionary.dart';
import '../../user/verse/user.verse.dart';
import '../bible/bible.version.dart';
import '../book/book.dart';
import 'verse.content.dart';
import 'verse.cross.reference.dart';

abstract class VerseCore {
  int id;
  int idBibleVersion;
  int idBook;

  int numberChapter;
  int numberVerse;

  ///for some type of bible version that has verses joined
  int? numberVerseEnd;
  List<Content> content;

  String contentWithOutFormat;
  VerseCore({
    required this.id,
    required this.idBibleVersion,
    required this.idBook,
    required this.numberChapter,
    required this.numberVerse,
    this.numberVerseEnd,
    required this.content,
    required this.contentWithOutFormat,
  });
}

class Verse extends VerseCore {
  Verse({
    required super.id,
    required super.idBibleVersion,
    required super.idBook,
    required super.numberChapter,
    required super.numberVerse,
    super.numberVerseEnd,
    required super.content,
    required super.contentWithOutFormat,
  });
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'idBibleVersion': idBibleVersion});
    result.addAll({'idBook': idBook});
    result.addAll({'numberChapter': numberChapter});
    result.addAll({'numberVerse': numberVerse});
    if (numberVerseEnd != null) {
      result.addAll({'numberVerseEnd': numberVerseEnd});
    }
    result.addAll({'content': content.map((x) => x.toMap()).toList()});

    result.addAll({'contentWithOutFormat': contentWithOutFormat});

    return result;
  }

  factory Verse.fromMap(Map<String, dynamic> map) {
    return Verse(
      id: map['id']?.toInt() ?? 0,
      idBibleVersion: map['idBibleVersion']?.toInt() ?? 0,
      idBook: map['idBook']?.toInt() ?? 0,
      numberChapter: map['numberChapter']?.toInt() ?? 0,
      numberVerse: map['numberVerse']?.toInt() ?? 0,
      numberVerseEnd: map['numberVerseEnd']?.toInt(),
      content: List<Content>.from(map['content']?.map((x) => Content.fromMap(x))),
      contentWithOutFormat: map['contentWithOutFormat'] ?? '',
    );
  }

  factory Verse.fromVerseView(VerseView verseView) {
    return Verse(
      id: verseView.id,
      idBibleVersion: verseView.idBibleVersion,
      idBook: verseView.idBook,
      numberChapter: verseView.numberChapter,
      numberVerse: verseView.numberVerse,
      numberVerseEnd: verseView.numberVerseEnd,
      content: verseView.content,
      contentWithOutFormat: verseView.contentWithOutFormat,
    );
  }

  String toJson() => json.encode(toMap());

  factory Verse.fromJson(String source) => Verse.fromMap(json.decode(source));
}

class VerseView extends VerseCore {
  ///from user data
  UserVerse? userVerseData;

  ///from table cross reference
  List<VerseCrossReference>? crossReferences;

  ///from table strong
  List<Lexico>? strongReferences;
  Book? book;
  BibleVersion? bibleVersion;

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
    this.book,
    this.bibleVersion,
  });

  factory VerseView.fromVerseCore(VerseCore verseView) {
    return VerseView(
      id: verseView.id,
      idBibleVersion: verseView.idBibleVersion,
      idBook: verseView.idBook,
      numberChapter: verseView.numberChapter,
      numberVerse: verseView.numberVerse,
      numberVerseEnd: verseView.numberVerseEnd,
      content: verseView.content,
      contentWithOutFormat: verseView.contentWithOutFormat,
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
      book: book ?? this.book,
      bibleVersion: bibleVersion ?? this.bibleVersion,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerseView &&
        other.userVerseData == userVerseData &&
        listEquals(other.crossReferences, crossReferences) &&
        listEquals(other.strongReferences, strongReferences) &&
        other.book == book &&
        other.bibleVersion == bibleVersion;
  }

  @override
  int get hashCode {
    return userVerseData.hashCode ^ crossReferences.hashCode ^ strongReferences.hashCode ^ book.hashCode ^ bibleVersion.hashCode;
  }

  @override
  String toString() {
    return 'VerseView(userVerseData: $userVerseData, crossReferences: $crossReferences, strongReferences: $strongReferences, book: $book, bibleVersion: $bibleVersion)';
  }
}
