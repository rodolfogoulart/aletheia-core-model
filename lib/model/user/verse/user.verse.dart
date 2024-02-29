// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:aletheia_core_model/model/bible/verse/referece.dart';
import 'package:aletheia_core_model/model/user/verse/user.verse.wordsHighlighted.dart';

class UserVerse {
  int id;
  int numberChapter;
  int numberVerse;
  bool isVersesHighlighted;

  ///store the verse highlighted color
  Color? colorVersesHighlighted;

  ///store a json quill delta
  String? notes;

  ///store a json list of the selection highlighted
  List<WordsHighlighted>? wordsHighlighted;

  ///store personal references of the verse
  List<Reference>? references;
  UserVerse({
    required this.id,
    required this.numberChapter,
    required this.numberVerse,
    required this.isVersesHighlighted,
    this.colorVersesHighlighted,
    this.notes,
    this.wordsHighlighted,
    this.references,
  });

  @override
  String toString() {
    return 'UserVerse(id: $id, numberChapter: $numberChapter, numberVerse: $numberVerse, isVersesHighlighted: $isVersesHighlighted, colorVersesHighlighted: $colorVersesHighlighted, notes: $notes, wordsHighlighted: $wordsHighlighted, references: $references)';
  }

  @override
  bool operator ==(covariant UserVerse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.numberChapter == numberChapter &&
        other.numberVerse == numberVerse &&
        other.isVersesHighlighted == isVersesHighlighted &&
        other.colorVersesHighlighted == colorVersesHighlighted &&
        other.notes == notes &&
        listEquals(other.wordsHighlighted, wordsHighlighted) &&
        listEquals(other.references, references);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        numberChapter.hashCode ^
        numberVerse.hashCode ^
        isVersesHighlighted.hashCode ^
        colorVersesHighlighted.hashCode ^
        notes.hashCode ^
        wordsHighlighted.hashCode ^
        references.hashCode;
  }

  UserVerse copyWith({
    int? id,
    int? numberChapter,
    int? numberVerse,
    bool? isVersesHighlighted,
    Color? colorVersesHighlighted,
    String? notes,
    List<WordsHighlighted>? wordsHighlighted,
    List<Reference>? references,
  }) {
    return UserVerse(
      id: id ?? this.id,
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      isVersesHighlighted: isVersesHighlighted ?? this.isVersesHighlighted,
      colorVersesHighlighted: colorVersesHighlighted ?? this.colorVersesHighlighted,
      notes: notes ?? this.notes,
      wordsHighlighted: wordsHighlighted ?? this.wordsHighlighted,
      references: references ?? this.references,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'numberChapter': numberChapter,
      'numberVerse': numberVerse,
      'isVersesHighlighted': isVersesHighlighted,
      'colorVersesHighlighted': colorVersesHighlighted?.value,
      'notes': notes,
      'wordsHighlighted': wordsHighlighted?.map((x) => x.toMap()).toList(),
      'references': references?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserVerse.fromMap(Map<String, dynamic> map) {
    return UserVerse(
      id: map['id'] ?? 0,
      numberChapter: map['numberChapter'] ?? 0,
      numberVerse: map['numberVerse'] ?? 0,
      isVersesHighlighted: map['isVersesHighlighted'] ?? false,
      colorVersesHighlighted: map['colorVersesHighlighted'] != null ? Color(map['colorVersesHighlighted']) : null,
      notes: map['notes'],
      wordsHighlighted: map['wordsHighlighted'] != null
          ? List<WordsHighlighted>.from(map['wordsHighlighted']?.map((x) => WordsHighlighted.fromMap(x)))
          : null,
      references: map['references'] != null ? List<Reference>.from(map['references']?.map((x) => Reference.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVerse.fromJson(String source) => UserVerse.fromMap(json.decode(source));
}
