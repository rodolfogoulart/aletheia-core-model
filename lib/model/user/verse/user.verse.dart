import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:aletheia_core_model/model/user/verse/user.verse.wordsHighlighted.dart';

class UserVerse {
  int id;
  int numberChapter;
  int numberVerse;
  bool isVersesHighlighted;
  Color? colorVersesHighlighted;
  String? notes;

  ///store a json list of the selection highlighted
  List<WordsHighlighted>? wordsHighlighted;
  UserVerse({
    required this.id,
    required this.numberChapter,
    required this.numberVerse,
    required this.isVersesHighlighted,
    this.colorVersesHighlighted,
    this.notes,
    this.wordsHighlighted,
  });

  @override
  String toString() {
    return 'UserVerse(id: $id, numberChapter: $numberChapter, numberVerse: $numberVerse, isVersesHighlighted: $isVersesHighlighted, colorVersesHighlighted: $colorVersesHighlighted, notes: $notes, wordsHighlighted: $wordsHighlighted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserVerse &&
        other.id == id &&
        other.numberChapter == numberChapter &&
        other.numberVerse == numberVerse &&
        other.isVersesHighlighted == isVersesHighlighted &&
        other.colorVersesHighlighted == colorVersesHighlighted &&
        other.notes == notes &&
        listEquals(other.wordsHighlighted, wordsHighlighted);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        numberChapter.hashCode ^
        numberVerse.hashCode ^
        isVersesHighlighted.hashCode ^
        colorVersesHighlighted.hashCode ^
        notes.hashCode ^
        wordsHighlighted.hashCode;
  }

  UserVerse copyWith({
    int? id,
    int? numberChapter,
    int? numberVerse,
    bool? isVersesHighlighted,
    Color? colorVersesHighlighted,
    String? notes,
    List<WordsHighlighted>? wordsHighlighted,
  }) {
    return UserVerse(
      id: id ?? this.id,
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      isVersesHighlighted: isVersesHighlighted ?? this.isVersesHighlighted,
      colorVersesHighlighted: colorVersesHighlighted ?? this.colorVersesHighlighted,
      notes: notes ?? this.notes,
      wordsHighlighted: wordsHighlighted ?? this.wordsHighlighted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'numberChapter': numberChapter});
    result.addAll({'numberVerse': numberVerse});
    result.addAll({'isVersesHighlighted': isVersesHighlighted});
    if (colorVersesHighlighted != null) {
      result.addAll({'colorVersesHighlighted': colorVersesHighlighted!.value});
    }
    if (notes != null) {
      result.addAll({'notes': notes});
    }
    if (wordsHighlighted != null) {
      result.addAll({'wordsHighlighted': wordsHighlighted!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory UserVerse.fromMap(Map<String, dynamic> map) {
    return UserVerse(
      id: map['id']?.toInt() ?? 0,
      numberChapter: map['numberChapter']?.toInt() ?? 0,
      numberVerse: map['numberVerse']?.toInt() ?? 0,
      isVersesHighlighted: map['isVersesHighlighted'] ?? false,
      colorVersesHighlighted: map['colorVersesHighlighted'] != null ? Color(map['colorVersesHighlighted']) : null,
      notes: map['notes'],
      wordsHighlighted: map['wordsHighlighted'] != null
          ? List<WordsHighlighted>.from(map['wordsHighlighted']?.map((x) => WordsHighlighted.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVerse.fromJson(String source) => UserVerse.fromMap(json.decode(source));
}
