// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Reference {
  int bookNumber;
  int chapterNumber;
  int? verseNumber;
  int? endChapterNumber;
  int? endVerseNumber;
  List<int>? verseNumbers;

  ///to store a simple description of the reference
  ///
  ///used on UserVerse
  String? description;
  Reference({
    required this.bookNumber,
    required this.chapterNumber,
    this.verseNumber,
    this.endChapterNumber,
    this.endVerseNumber,
    this.verseNumbers,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookNumber': bookNumber,
      'chapterNumber': chapterNumber,
      'verseNumber': verseNumber,
      'endChapterNumber': endChapterNumber,
      'endVerseNumber': endVerseNumber,
      'verseNumbers': verseNumbers,
      'description': description,
    };
  }

  factory Reference.fromMap(Map<String, dynamic> map) {
    return Reference(
      bookNumber: map['bookNumber'] ?? 0,
      chapterNumber: map['chapterNumber'] ?? 0,
      verseNumber: map['verseNumber'],
      endChapterNumber: map['endChapterNumber'],
      endVerseNumber: map['endVerseNumber'],
      verseNumbers: map['verseNumbers'] != null ? List<int>.from(map['verseNumbers']) : null,
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Reference.fromJson(String source) => Reference.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Reference other) {
    if (identical(this, other)) return true;
    //only compare the values of references
    return other.bookNumber == bookNumber &&
        other.chapterNumber == chapterNumber &&
        other.verseNumber == verseNumber &&
        other.endChapterNumber == endChapterNumber &&
        other.endVerseNumber == endVerseNumber &&
        listEquals(other.verseNumbers, verseNumbers);
    //  &&
    // other.description == description;
  }

  @override
  int get hashCode {
    return bookNumber.hashCode ^
        chapterNumber.hashCode ^
        verseNumber.hashCode ^
        endChapterNumber.hashCode ^
        endVerseNumber.hashCode ^
        verseNumbers.hashCode;
    // ^
    // description.hashCode;
  }
}
