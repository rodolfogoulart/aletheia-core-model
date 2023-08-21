// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:biblia_estudo/model/scrapper/scrapper.chapter.dart';

// class BookScrapper {
//   String name;
//   String abbrev;
//   String version;
//   String? language;
//   List<ChapterScrapper> chapters;
//   List<String>? commentary;
//   List<String>? reference;
//   int numberOfChapters;
//   BookScrapper({
//     required this.name,
//     required this.abbrev,
//     required this.version,
//     this.language = 'pt',
//     required this.chapters,
//     this.commentary,
//     this.reference,
//     required this.numberOfChapters,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'name': name});
//     result.addAll({'abbrev': abbrev});
//     result.addAll({'version': version});
//     if (language != null) {
//       result.addAll({'language': language});
//     }
//     result.addAll({'chapters': chapters.map((x) => x.toMap()).toList()});
//     if (commentary != null) {
//       result.addAll({'commentary': commentary});
//     }
//     if (reference != null) {
//       result.addAll({'reference': reference});
//     }
//     result.addAll({'numberOfChapters': numberOfChapters});

//     return result;
//   }

//   factory BookScrapper.fromMap(Map<String, dynamic> map) {
//     return BookScrapper(
//       name: map['name'] ?? '',
//       abbrev: map['abbrev'] ?? '',
//       version: map['version'] ?? '',
//       language: map['language'],
//       chapters: List<ChapterScrapper>.from(map['chapters']?.map((x) => ChapterScrapper.fromMap(x))),
//       commentary: List<String>.from(map['commentary']),
//       reference: List<String>.from(map['reference']),
//       numberOfChapters: map['numberOfChapters']?.toInt() ?? 0,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BookScrapper.fromJson(String source) => BookScrapper.fromMap(json.decode(source));

//   BookScrapper copyWith({
//     String? name,
//     String? abbrev,
//     String? version,
//     String? language,
//     List<ChapterScrapper>? chapters,
//     List<String>? commentary,
//     List<String>? reference,
//     int? numberOfChapters,
//   }) {
//     return BookScrapper(
//       name: name ?? this.name,
//       abbrev: abbrev ?? this.abbrev,
//       version: version ?? this.version,
//       language: language ?? this.language,
//       chapters: chapters ?? this.chapters,
//       commentary: commentary ?? this.commentary,
//       reference: reference ?? this.reference,
//       numberOfChapters: numberOfChapters ?? this.numberOfChapters,
//     );
//   }

//   @override
//   String toString() {
//     return 'BookScrapper(name: $name, abbrev: $abbrev, version: $version, language: $language, chapters: $chapters, commentary: $commentary, reference: $reference, numberOfChapters: $numberOfChapters)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is BookScrapper &&
//         other.name == name &&
//         other.abbrev == abbrev &&
//         other.version == version &&
//         other.language == language &&
//         listEquals(other.chapters, chapters) &&
//         listEquals(other.commentary, commentary) &&
//         listEquals(other.reference, reference) &&
//         other.numberOfChapters == numberOfChapters;
//   }

//   @override
//   int get hashCode {
//     return name.hashCode ^
//         abbrev.hashCode ^
//         version.hashCode ^
//         language.hashCode ^
//         chapters.hashCode ^
//         commentary.hashCode ^
//         reference.hashCode ^
//         numberOfChapters.hashCode;
//   }
// }
