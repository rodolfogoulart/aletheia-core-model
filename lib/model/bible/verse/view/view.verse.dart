import 'package:aletheia_core_model/aletheia_core_model.dart';
import 'package:flutter/foundation.dart';

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
