import 'dart:convert';

class NlpVerse {
  ///primary key
  int id;

  ///unique hash of the bible version, used to search between versions
  int hashBibleVersion;

  ///as book has a fixed list of books, can be used to filter
  int idBook;
  int numberChapter;
  int numberVerse;

  ///some versions has joined verses
  int? numberVerseEnd;

  ///store as list json
  ///
  ///use the object [AnalizeGrammar] to retrieve the data
  String analizeGrammar;
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
    int? hashBibleVersion,
    int? idBook,
    int? numberChapter,
    int? numberVerse,
    int? numberVerseEnd,
    String? analizeGrammar,
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
    result.addAll({'analizeGrammar': analizeGrammar});

    return result;
  }

  factory NlpVerse.fromMap(Map<String, dynamic> map) {
    return NlpVerse(
      id: map['id']?.toInt() ?? 0,
      hashBibleVersion: map['hashBibleVersion']?.toInt() ?? 0,
      idBook: map['idBook']?.toInt() ?? 0,
      numberChapter: map['numberChapter']?.toInt() ?? 0,
      numberVerse: map['numberVerse']?.toInt() ?? 0,
      numberVerseEnd: map['numberVerseEnd']?.toInt(),
      analizeGrammar: map['analizeGrammar'] ?? '',
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
        other.analizeGrammar == analizeGrammar;
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
