import 'dart:convert';

class CommentaryContent {
  int id;
  int idCommentary;
  int idBook;
  int? chapter;
  int? verse;
  int? verseEnd;
  String content;
  CommentaryContent({
    required this.id,
    required this.idCommentary,
    required this.idBook,
    this.chapter,
    this.verse,
    this.verseEnd,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'idCommentary': idCommentary});
    result.addAll({'idBook': idBook});
    if (chapter != null) {
      result.addAll({'chapter': chapter});
    }
    if (verse != null) {
      result.addAll({'verse': verse});
    }
    if (verseEnd != null) {
      result.addAll({'verseEnd': verseEnd});
    }
    result.addAll({'content': content});

    return result;
  }

  factory CommentaryContent.fromMap(Map<String, dynamic> map) {
    return CommentaryContent(
      id: map['id']?.toInt() ?? 0,
      idCommentary: map['idCommentary']?.toInt() ?? 0,
      idBook: map['idBook']?.toInt() ?? 0,
      chapter: map['chapter']?.toInt(),
      verse: map['verse']?.toInt(),
      verseEnd: map['verseEnd']?.toInt(),
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentaryContent.fromJson(String source) =>
      CommentaryContent.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentaryContent &&
        other.id == id &&
        other.idCommentary == idCommentary &&
        other.idBook == idBook &&
        other.chapter == chapter &&
        other.verse == verse &&
        other.verseEnd == verseEnd &&
        other.content == content;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idCommentary.hashCode ^
        idBook.hashCode ^
        chapter.hashCode ^
        verse.hashCode ^
        verseEnd.hashCode ^
        content.hashCode;
  }
}
