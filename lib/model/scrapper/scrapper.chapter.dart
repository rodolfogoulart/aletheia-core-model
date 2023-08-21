// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:biblia_estudo/model/scrapper/scrapper.verse.dart';

// class ChapterScrapper {
//   List<String>? title;
//   List<VerseScrapper> verses;
//   int chapterNumber;
//   int numberOfVerses;
//   List<String>? introduction;
//   List<String>? commentary;

//   ChapterScrapper({
//     required this.title,
//     required this.verses,
//     required this.chapterNumber,
//     required this.numberOfVerses,
//     this.introduction,
//     this.commentary,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     if (title != null) {
//       result.addAll({'title': title});
//     }
//     result.addAll({'verses': verses.map((x) => x.toMap()).toList()});
//     result.addAll({'chapterNumber': chapterNumber});
//     result.addAll({'numberOfVerses': numberOfVerses});
//     if (introduction != null) {
//       result.addAll({'introduction': introduction});
//     }
//     if (commentary != null) {
//       result.addAll({'commentary': commentary});
//     }

//     return result;
//   }

//   factory ChapterScrapper.fromMap(Map<String, dynamic> map) {
//     return ChapterScrapper(
//       title: List<String>.from(map['title']),
//       verses: List<VerseScrapper>.from(map['verses']?.map((x) => VerseScrapper.fromMap(x))),
//       chapterNumber: map['chapterNumber']?.toInt() ?? 0,
//       numberOfVerses: map['numberOfVerses']?.toInt() ?? 0,
//       introduction: List<String>.from(map['introduction']),
//       commentary: List<String>.from(map['commentary']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ChapterScrapper.fromJson(String source) => ChapterScrapper.fromMap(json.decode(source));

//   ChapterScrapper copyWith({
//     List<String>? title,
//     List<VerseScrapper>? verses,
//     int? chapterNumber,
//     int? numberOfVerses,
//     List<String>? introduction,
//     List<String>? commentary,
//   }) {
//     return ChapterScrapper(
//       title: title ?? this.title,
//       verses: verses ?? this.verses,
//       chapterNumber: chapterNumber ?? this.chapterNumber,
//       numberOfVerses: numberOfVerses ?? this.numberOfVerses,
//       introduction: introduction ?? this.introduction,
//       commentary: commentary ?? this.commentary,
//     );
//   }

//   @override
//   String toString() {
//     return 'ChapterScrapper(title: $title, verses: $verses, chapterNumber: $chapterNumber, numberOfVerses: $numberOfVerses, introduction: $introduction, commentary: $commentary)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is ChapterScrapper &&
//         listEquals(other.title, title) &&
//         listEquals(other.verses, verses) &&
//         other.chapterNumber == chapterNumber &&
//         other.numberOfVerses == numberOfVerses &&
//         listEquals(other.introduction, introduction) &&
//         listEquals(other.commentary, commentary);
//   }

//   @override
//   int get hashCode {
//     return title.hashCode ^
//         verses.hashCode ^
//         chapterNumber.hashCode ^
//         numberOfVerses.hashCode ^
//         introduction.hashCode ^
//         commentary.hashCode;
//   }
// }
