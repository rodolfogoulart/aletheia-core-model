import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../book/book.dart';
import 'bible.version.dart';

class BibleVersionBooks {
  int? id;
  int idBook;
  int idBibleVersion;
  int? sequence;
  int? numberChapters;
  String? nameTranslation;
  String? abrevTranslation;

  BibleVersionBooks({
    this.id,
    required this.idBook,
    required this.idBibleVersion,
    required this.sequence,
    this.numberChapters,
    this.nameTranslation,
    this.abrevTranslation,
  });

  BibleVersionBooks copyWith({
    int? id,
    int? idBook,
    int? idBibleVersion,
    int? sequence,
    int? numberChapters,
    String? nameTranslation,
    String? abrevTranslation,
  }) {
    return BibleVersionBooks(
      id: id ?? this.id,
      idBook: idBook ?? this.idBook,
      idBibleVersion: idBibleVersion ?? this.idBibleVersion,
      sequence: sequence ?? this.sequence,
      numberChapters: numberChapters ?? this.numberChapters,
      nameTranslation: nameTranslation ?? this.nameTranslation,
      abrevTranslation: abrevTranslation ?? this.abrevTranslation,
    );
  }

  @override
  String toString() {
    return 'BibleVersionBooks(id: $id, idBook: $idBook, idBibleVersion: $idBibleVersion, sequence: $sequence, numberChapters: $numberChapters, nameTranslation: $nameTranslation, abrevTranslation: $abrevTranslation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BibleVersionBooks &&
        other.id == id &&
        other.idBook == idBook &&
        other.idBibleVersion == idBibleVersion &&
        other.sequence == sequence &&
        other.numberChapters == numberChapters &&
        other.nameTranslation == nameTranslation &&
        other.abrevTranslation == abrevTranslation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idBook.hashCode ^
        idBibleVersion.hashCode ^
        sequence.hashCode ^
        numberChapters.hashCode ^
        nameTranslation.hashCode ^
        abrevTranslation.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'idBook': idBook});
    result.addAll({'idBibleVersion': idBibleVersion});
    if (sequence != null) {
      result.addAll({'sequence': sequence});
    }
    if (numberChapters != null) {
      result.addAll({'numberChapters': numberChapters});
    }
    if (nameTranslation != null) {
      result.addAll({'nameTranslation': nameTranslation});
    }
    if (abrevTranslation != null) {
      result.addAll({'abrevTranslation': abrevTranslation});
    }

    return result;
  }

  factory BibleVersionBooks.fromMap(Map<String, dynamic> map) {
    return BibleVersionBooks(
      id: map['id']?.toInt(),
      idBook: map['idBook']?.toInt() ?? 0,
      idBibleVersion: map['idBibleVersion']?.toInt() ?? 0,
      sequence: map['sequence']?.toInt(),
      numberChapters: map['numberChapters']?.toInt(),
      nameTranslation: map['nameTranslation'],
      abrevTranslation: map['abrevTranslation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BibleVersionBooks.fromJson(String source) => BibleVersionBooks.fromMap(json.decode(source));
}

class BibleVersionBooksView {
  List<BookView> books;
  BibleVersion bible;
  BibleVersionBooksView({
    required this.books,
    required this.bible,
  });

  BibleVersionBooksView copyWith({
    List<BookView>? books,
    BibleVersion? bible,
  }) {
    return BibleVersionBooksView(
      books: books ?? this.books,
      bible: bible ?? this.bible,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BibleVersionBooksView && listEquals(other.books, books) && other.bible == bible;
  }

  @override
  int get hashCode => books.hashCode ^ bible.hashCode;

  @override
  String toString() => 'BibleVersionBooksView(books: $books, bible: $bible)';
}
