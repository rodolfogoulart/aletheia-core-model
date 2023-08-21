import 'dart:convert';

import 'package:aletheia_core_model/bible/verse/verse.cross.reference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../bible/bible.version.dart';
import '../book/book.dart';
import '../../lexico/lexico.dictionary.dart';
import 'verse.content.dart';

abstract class VerseCore {
  int id;
  int idBibleVersion;
  int idBook;

  int numberChapter;
  int numberVerse;

  ///for some type of bible version that has verses jointed
  int? numberVerseEnd;
  List<Content> content; //v12

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
  // @Deprecated('use content')
  // List<VerseContent_oldVersion>? contentOld;

  ///from user data
  bool? isVerseHighlighted;

  ///from user data
  Color? verseHighlightedColor;

  ///from user data
  String? notes;

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
    // this.contentOld,
    required super.contentWithOutFormat,
    this.isVerseHighlighted = false,
    this.verseHighlightedColor = Colors.transparent,
    this.notes,
    this.crossReferences,
    required super.content, //v12
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
      // contentOld: [],
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
    bool? isVerseHighlighted,
    Color? verseHighlightedColor,
    String? notes,
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
      isVerseHighlighted: isVerseHighlighted ?? this.isVerseHighlighted,
      verseHighlightedColor: verseHighlightedColor ?? this.verseHighlightedColor,
      notes: notes ?? this.notes,
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
        // listEquals(other.contentOld, contentOld) &&
        other.isVerseHighlighted == isVerseHighlighted &&
        other.verseHighlightedColor == verseHighlightedColor &&
        other.notes == notes &&
        listEquals(other.crossReferences, crossReferences) &&
        listEquals(other.strongReferences, strongReferences);
  }

  @override
  int get hashCode {
    return
        // contentOld.hashCode ^
        isVerseHighlighted.hashCode ^
            verseHighlightedColor.hashCode ^
            notes.hashCode ^
            crossReferences.hashCode ^
            strongReferences.hashCode;
  }

  @override
  String toString() {
    return 'VerseView(isVerseHighlighted: $isVerseHighlighted, verseHighlightedColor: $verseHighlightedColor, notes: $notes, crossReferences: $crossReferences, strongReferences: $strongReferences)';
  }
}
