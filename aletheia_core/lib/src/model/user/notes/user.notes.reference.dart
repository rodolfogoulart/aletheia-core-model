import 'dart:convert';

class UserNotesReference {
  int id;
  int idNotes;
  //
  int? idBook;
  int? numberChapter;
  int? numberVerse;
  int? numberVerseEnd;
  UserNotesReference({
    required this.id,
    required this.idNotes,
    this.idBook,
    this.numberChapter,
    this.numberVerse,
    this.numberVerseEnd,
  });

  UserNotesReference copyWith({
    int? id,
    int? idNotes,
    int? idBook,
    int? numberChapter,
    int? numberVerse,
    int? numberVerseEnd,
  }) {
    return UserNotesReference(
      id: id ?? this.id,
      idNotes: idNotes ?? this.idNotes,
      idBook: idBook ?? this.idBook,
      numberChapter: numberChapter ?? this.numberChapter,
      numberVerse: numberVerse ?? this.numberVerse,
      numberVerseEnd: numberVerseEnd ?? this.numberVerseEnd,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'idNotes': idNotes});
    if (idBook != null) {
      result.addAll({'idBook': idBook});
    }
    if (numberChapter != null) {
      result.addAll({'numberChapter': numberChapter});
    }
    if (numberVerse != null) {
      result.addAll({'numberVerse': numberVerse});
    }
    if (numberVerseEnd != null) {
      result.addAll({'numberVerseEnd': numberVerseEnd});
    }

    return result;
  }

  factory UserNotesReference.fromMap(Map<String, dynamic> map) {
    try {
      return UserNotesReference(
        id: map['id']?.toInt() ?? 0,
        idNotes: map['idNotes']?.toInt() ?? 0,
        idBook: map['idBook']?.toInt(),
        numberChapter: map['numberChapter']?.toInt(),
        numberVerse: map['numberVerse']?.toInt(),
        numberVerseEnd: map['numberVerseEnd']?.toInt(),
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing UserNotesReference.fromMap: $e, map: $map, stackTrace: $stackTrace');
    }
  }

  String toJson() => json.encode(toMap());

  factory UserNotesReference.fromJson(String source) =>
      UserNotesReference.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserNotesReference(id: $id, idNotes: $idNotes, idBook: $idBook, numberChapter: $numberChapter, numberVerse: $numberVerse, numberVerseEnd: $numberVerseEnd)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserNotesReference &&
        other.id == id &&
        other.idNotes == idNotes &&
        other.idBook == idBook &&
        other.numberChapter == numberChapter &&
        other.numberVerse == numberVerse &&
        other.numberVerseEnd == numberVerseEnd;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idNotes.hashCode ^
        idBook.hashCode ^
        numberChapter.hashCode ^
        numberVerse.hashCode ^
        numberVerseEnd.hashCode;
  }
}
