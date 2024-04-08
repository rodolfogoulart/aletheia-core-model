import 'dart:convert';

import 'package:aletheia_core_model/aletheia_core_model.dart';

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
