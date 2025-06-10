// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

class UserVerse {
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

  String? uuid;
  int? hlc;

  UserVerse({
    required this.numberChapter,
    required this.numberVerse,
    int? colorVersesHighlighted,
    this.notes,
    this.wordsHighlighted,
    this.references,
    required this.idBook,
    this.uuid,
    this.hlc,
  }) : _colorVersesHighlighted = colorVersesHighlighted {
    isVersesHighlighted = _colorVersesHighlighted != null;
  }

  @override
  String toString() {
    return 'UserVerse(numberChapter: $numberChapter, numberVerse: $numberVerse, colorVersesHighlighted: $_colorVersesHighlighted, notes: $notes, wordsHighlighted: $wordsHighlighted, references: $references, idBook: $idBook, uuid: $uuid, hlc: $hlc)';
  }

  @override
  bool operator ==(covariant UserVerse other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.numberChapter == numberChapter &&
        other.numberVerse == numberVerse &&
        other.isVersesHighlighted == isVersesHighlighted &&
        other._colorVersesHighlighted == _colorVersesHighlighted &&
        other.notes == notes &&
        listEquals(other.wordsHighlighted, wordsHighlighted) &&
        listEquals(other.references, references) &&
        other.idBook == idBook &&
        other.uuid == uuid &&
        other.hlc == hlc;
  }

  @override
  int get hashCode {
    return numberChapter.hashCode ^
        numberVerse.hashCode ^
        isVersesHighlighted.hashCode ^
        _colorVersesHighlighted.hashCode ^
        notes.hashCode ^
        wordsHighlighted.hashCode ^
        references.hashCode ^
        idBook.hashCode ^
        uuid.hashCode ^
        hlc.hashCode;
  }

  UserVerse copyWith({
    int? numberChapter,
    int? numberVerse,
    bool? isVersesHighlighted,
    int? colorVersesHighlighted,
    String? notes,
    List<WordsHighlighted>? wordsHighlighted,
    List<Reference>? references,
    int? idBook,
    String? uuid,
    int? hlc,
  }) {
    return UserVerse(
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      colorVersesHighlighted: colorVersesHighlighted ?? _colorVersesHighlighted,
      notes: notes ?? this.notes,
      wordsHighlighted: wordsHighlighted ?? this.wordsHighlighted,
      references: references ?? this.references,
      idBook: idBook ?? this.idBook,
      uuid: uuid ?? this.uuid,
      hlc: hlc ?? this.hlc,
    );
  }

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{
      'numberChapter': numberChapter,
      'numberVerse': numberVerse,
      'colorVersesHighlighted': _colorVersesHighlighted,
      'notes': notes,
      'wordsHighlighted': wordsHighlighted?.map((x) => x.toMap()).toList(),
      'references': references?.map((x) => x.toMap()).toList(),
      'idBook': idBook,
      'uuid': uuid,
      'hlc': hlc,
    };
    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory UserVerse.fromMap(Map<String, dynamic> map) {
    try {
      return UserVerse(
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
        uuid: map['uuid'],
        hlc: map['hlc'],
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
