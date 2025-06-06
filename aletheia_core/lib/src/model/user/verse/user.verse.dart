// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

class UserVerse {
  int id;
  int numberChapter;
  int numberVerse;
  bool isVersesHighlighted = false;

  ///store the verse highlighted color
  int? _colorVersesHighlighted;

  int? get colorVersesHighlighted => _colorVersesHighlighted;

  set colorVersesHighlighted(int? value) {
    isVersesHighlighted = value != null;
    _colorVersesHighlighted = value;
  }

  ///store a json quill delta
  String? notes;

  ///store a json list of the selection highlighted
  List<WordsHighlighted>? wordsHighlighted;

  ///store personal references of the verse
  List<Reference>? references;

  ///v1.0.16
  ///
  ///id book of the verse
  int idBook;

  UserVerse({
    required this.id,
    required this.numberChapter,
    required this.numberVerse,
    int? colorVersesHighlighted,
    this.notes,
    this.wordsHighlighted,
    this.references,
    required this.idBook,
  }) : _colorVersesHighlighted = colorVersesHighlighted {
    //unnecessary field on the database
    isVersesHighlighted = _colorVersesHighlighted != null;
  }

  @override
  String toString() {
    return 'UserVerse(id: $id, numberChapter: $numberChapter, numberVerse: $numberVerse, colorVersesHighlighted: $_colorVersesHighlighted, notes: $notes, wordsHighlighted: $wordsHighlighted, references: $references, idBook: $idBook)';
  }

  @override
  bool operator ==(covariant UserVerse other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.numberChapter == numberChapter &&
        other.numberVerse == numberVerse &&
        other.isVersesHighlighted == isVersesHighlighted &&
        other._colorVersesHighlighted == _colorVersesHighlighted &&
        other.notes == notes &&
        listEquals(other.wordsHighlighted, wordsHighlighted) &&
        listEquals(other.references, references) &&
        other.idBook == idBook;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        numberChapter.hashCode ^
        numberVerse.hashCode ^
        isVersesHighlighted.hashCode ^
        _colorVersesHighlighted.hashCode ^
        notes.hashCode ^
        wordsHighlighted.hashCode ^
        references.hashCode ^
        idBook.hashCode;
  }

  UserVerse copyWith({
    int? id,
    int? numberChapter,
    int? numberVerse,
    bool? isVersesHighlighted,
    int? colorVersesHighlighted,
    String? notes,
    List<WordsHighlighted>? wordsHighlighted,
    List<Reference>? references,
    int? idBook,
  }) {
    return UserVerse(
      id: id ?? this.id,
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      colorVersesHighlighted:
          colorVersesHighlighted ?? this._colorVersesHighlighted,
      notes: notes ?? this.notes,
      wordsHighlighted: wordsHighlighted ?? this.wordsHighlighted,
      references: references ?? this.references,
      idBook: idBook ?? this.idBook,
    );
  }

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{
      'id': id,
      'numberChapter': numberChapter,
      'numberVerse': numberVerse,
      'colorVersesHighlighted': _colorVersesHighlighted,
      'notes': notes,
      'wordsHighlighted': wordsHighlighted?.map((x) => x.toMap()).toList(),
      'references': references?.map((x) => x.toMap()).toList(),
      'idBook': idBook,
    };
    // Remove null values from the map
    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory UserVerse.fromMap(Map<String, dynamic> map) {
    try {
      return UserVerse(
        id: map['id'] ?? 0,
        numberChapter: map['numberChapter'] ?? 0,
        numberVerse: map['numberVerse'] ?? 0,
        colorVersesHighlighted: map['colorVersesHighlighted'] != null
            ? int.tryParse(map['colorVersesHighlighted'].toString())
            : null,
        notes: map['notes'],
        wordsHighlighted: map['wordsHighlighted'] != null
            ? List<WordsHighlighted>.from(map['wordsHighlighted']
                ?.map((x) => WordsHighlighted.fromMap(x)))
            : null,
        references: map['references'] != null
            ? List<Reference>.from(
                map['references']?.map((x) => Reference.fromMap(x)))
            : null,
        idBook: map['idBook'] ?? 0,
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing UserVerse.fromMap: $e, \nMap: $map\nStack: $stackTrace');
    }
  }

  String toJson() => json.encode(toMap());

  factory UserVerse.fromJson(String source) =>
      UserVerse.fromMap(json.decode(source));
}
