import 'package:flutter/material.dart';

class UserVerse {
  int id;
  int numberChapter;
  int numberVerse;
  bool isVersesHighlighted;
  Color? colorVersesHighlighted;
  String? notes;
  UserVerse({
    required this.id,
    required this.numberChapter,
    required this.numberVerse,
    required this.isVersesHighlighted,
    this.colorVersesHighlighted,
    this.notes,
  });

  @override
  String toString() {
    return 'UserVerse(id: $id, numberChapter: $numberChapter, numberVerse: $numberVerse, isVersesHighlighted: $isVersesHighlighted, colorVersesHighlighted: $colorVersesHighlighted, notes: $notes)';
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
        other.notes == notes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        numberChapter.hashCode ^
        numberVerse.hashCode ^
        isVersesHighlighted.hashCode ^
        colorVersesHighlighted.hashCode ^
        notes.hashCode;
  }

  UserVerse copyWith({
    int? id,
    int? numberChapter,
    int? numberVerse,
    bool? isVersesHighlighted,
    Color? colorVersesHighlighted,
    String? notes,
  }) {
    return UserVerse(
      id: id ?? this.id,
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      isVersesHighlighted: isVersesHighlighted ?? this.isVersesHighlighted,
      colorVersesHighlighted: colorVersesHighlighted ?? this.colorVersesHighlighted,
      notes: notes ?? this.notes,
    );
  }
}
