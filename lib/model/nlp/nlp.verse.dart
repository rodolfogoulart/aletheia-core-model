import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aletheia_core_model/aletheia_core_model.dart';

@Deprecated('Use NlpChapter instead')
class NlpVerse {
  ///primary key
  int id;

  ///unique hash of the bible version, used to search between versions
  String hashBibleVersion;

  ///as book has a fixed list of books, can be used to filter
  int idBook;
  int numberChapter;
  int numberVerse;

  ///some versions has joined verses
  int? numberVerseEnd;

  ///store as list json of [AnalizeGrammar]
  ///
  ///use the object [AnalizeGrammar] to retrieve the data
  List<AnalizeGrammar> analizeGrammar;
  NlpVerse({
    required this.id,
    required this.hashBibleVersion,
    required this.idBook,
    required this.numberChapter,
    required this.numberVerse,
    required this.numberVerseEnd,
    required this.analizeGrammar,
  });

  NlpVerse copyWith({
    int? id,
    String? hashBibleVersion,
    int? idBook,
    int? numberChapter,
    int? numberVerse,
    int? numberVerseEnd,
    List<AnalizeGrammar>? analizeGrammar,
  }) {
    return NlpVerse(
      id: id ?? this.id,
      hashBibleVersion: hashBibleVersion ?? this.hashBibleVersion,
      idBook: idBook ?? this.idBook,
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      numberVerseEnd: numberVerseEnd ?? this.numberVerseEnd,
      analizeGrammar: analizeGrammar ?? this.analizeGrammar,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'hashBibleVersion': hashBibleVersion});
    result.addAll({'idBook': idBook});
    result.addAll({'numberChapter': numberChapter});
    result.addAll({'numberVerse': numberVerse});
    if (numberVerseEnd != null) {
      result.addAll({'numberVerseEnd': numberVerseEnd});
    }
    result.addAll({'analizeGrammar': analizeGrammar.map((x) => x.toMap()).toList()});

    return result;
  }

  factory NlpVerse.fromMap(Map<String, dynamic> map) {
    return NlpVerse(
      id: map['id']?.toInt() ?? 0,
      hashBibleVersion: map['hashBibleVersion'] ?? '',
      idBook: map['idBook']?.toInt() ?? 0,
      numberChapter: map['numberChapter']?.toInt() ?? 0,
      numberVerse: map['numberVerse']?.toInt() ?? 0,
      numberVerseEnd: map['numberVerseEnd']?.toInt(),
      analizeGrammar: List<AnalizeGrammar>.from(map['analizeGrammar']?.map((x) => AnalizeGrammar.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NlpVerse.fromJson(String source) => NlpVerse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NlpVerse(id: $id, hashBibleVersion: $hashBibleVersion, idBook: $idBook, numberChapter: $numberChapter, numberVerse: $numberVerse, numberVerseEnd: $numberVerseEnd, analizeGrammar: $analizeGrammar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NlpVerse &&
        other.id == id &&
        other.hashBibleVersion == hashBibleVersion &&
        other.idBook == idBook &&
        other.numberChapter == numberChapter &&
        other.numberVerse == numberVerse &&
        other.numberVerseEnd == numberVerseEnd &&
        listEquals(other.analizeGrammar, analizeGrammar);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        hashBibleVersion.hashCode ^
        idBook.hashCode ^
        numberChapter.hashCode ^
        numberVerse.hashCode ^
        numberVerseEnd.hashCode ^
        analizeGrammar.hashCode;
  }
}
