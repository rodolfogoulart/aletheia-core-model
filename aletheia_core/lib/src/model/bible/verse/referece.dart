// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Reference {
  ///param[bn]
  int bookNumber;

  ///param[cn]
  int chapterNumber;

  ///param[vn]
  int? verseNumber;

  ///param[ecn]
  int? endChapterNumber;

  ///param[evn]
  int? endVerseNumber;

  ///param[vns]
  List<int>? verseNumbers;

  ///to store a simple description of the reference
  ///
  ///used on UserVerse
  ///
  ///param[d]
  String? description;

  ///v1.0.18
  ///
  ///metadata of version
  ///
  ///param[bv]
  String? bibleVersion;

  ///v1.0.18
  ///
  ///if has some metadata to share
  ///
  ///param[md]
  String? metaData;

  Reference({
    required this.bookNumber,
    required this.chapterNumber,
    this.verseNumber,
    this.endChapterNumber,
    this.endVerseNumber,
    this.verseNumbers,
    this.description,
    this.bibleVersion,
    this.metaData,
  });

  Map<String, dynamic> toMap() {
    ///v1.0.18
    ///change to abreviation
    var map = <String, dynamic>{
      'bn': bookNumber,
      'cn': chapterNumber,
      'vn': verseNumber,
      'ecn': endChapterNumber,
      'evn': endVerseNumber,
      'vns': verseNumbers,
      'd': description,
      'bv': bibleVersion,
      'md': metaData,
    };

    ///v1.0.18
    ///clean the map to not include dirt on database
    map.removeWhere(
      (key, value) => value == null || value?.toString().isEmpty == true,
    );
    return map;
  }

  factory Reference.fromMap(Map<String, dynamic> map) {
    try {
      ///v1.0.18
      ///change to abreviation, but try to get the old format before
      return Reference(
        bookNumber: map['bookNumber'] ?? map['bn'] ?? 0,
        chapterNumber: map['chapterNumber'] ?? map['cn'] ?? 0,
        verseNumber: map['verseNumber'] ?? map['vn'],
        endChapterNumber: map['endChapterNumber'] ?? map['ecn'],
        endVerseNumber: map['endVerseNumber'] ?? map['evn'],
        verseNumbers: map['verseNumbers'] != null || map['vns'] != null
            ? List<int>.from(map['verseNumbers'] ?? map['vns'])
            : null,
        description: map['description'] ?? map['d'],
        bibleVersion: map['bibleVersion'] ?? map['bv'],
        metaData: map['metaData'] ?? map['md'],
      );
    } catch (e) {
      throw Exception('Error parsing Reference.fromMap: $e\nMap: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory Reference.fromJson(String source) =>
      Reference.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Reference other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
    //only compare the values of references
    return other.bookNumber == bookNumber &&
        other.chapterNumber == chapterNumber &&
        other.verseNumber == verseNumber &&
        other.endChapterNumber == endChapterNumber &&
        other.endVerseNumber == endVerseNumber &&
        listEquals(other.verseNumbers, verseNumbers) &&
        other.bibleVersion == bibleVersion;
    //  &&
    // other.description == description;
    //dont compare metadata
  }

  @override
  int get hashCode {
    return bookNumber.hashCode ^
        chapterNumber.hashCode ^
        verseNumber.hashCode ^
        endChapterNumber.hashCode ^
        endVerseNumber.hashCode ^
        verseNumbers.hashCode ^
        bibleVersion.hashCode;
    // ^
    // description.hashCode;
    //dont compare metadata
  }
}
