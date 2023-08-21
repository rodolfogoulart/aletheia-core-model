import 'dart:convert';

class Reference {
  int bookNumber;
  int chapterNumber;
  int? verseNumber;
  int? endChapterNumber;
  int? endVerseNumber;
  List<int>? verseNumbers;
  Reference({
    required this.bookNumber,
    required this.chapterNumber,
    this.verseNumber,
    this.endChapterNumber,
    this.endVerseNumber,
    this.verseNumbers,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bookNumber': bookNumber});
    result.addAll({'chapterNumber': chapterNumber});
    if (verseNumber != null) {
      result.addAll({'verseNumber': verseNumber});
    }
    if (endChapterNumber != null) {
      result.addAll({'endChapterNumber': endChapterNumber});
    }
    if (endVerseNumber != null) {
      result.addAll({'endVerseNumber': endVerseNumber});
    }
    if (verseNumbers != null) {
      result.addAll({'verseNumbers': verseNumbers});
    }

    return result;
  }

  factory Reference.fromMap(Map<String, dynamic> map) {
    return Reference(
      bookNumber: map['bookNumber']?.toInt() ?? 0,
      chapterNumber: map['chapterNumber']?.toInt() ?? 0,
      verseNumber: map['verseNumber']?.toInt(),
      endChapterNumber: map['endChapterNumber']?.toInt(),
      endVerseNumber: map['endVerseNumber']?.toInt(),
      verseNumbers: map['verseNumbers'] != null ? List<int>.from(map['verseNumbers']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reference.fromJson(String source) => Reference.fromMap(json.decode(source));
}
