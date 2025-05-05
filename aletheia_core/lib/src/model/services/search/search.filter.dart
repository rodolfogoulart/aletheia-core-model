// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//fields to filter search results
class SearchFilter {
  int? divisionIndex;
  int? bookId;
  int? bibleVersionId;
  SearchFilter({
    this.divisionIndex,
    this.bookId,
    this.bibleVersionId,
  });

  SearchFilter copyWith({
    int? divisionIndex,
    int? bookId,
    int? bibleVersionId,
  }) {
    return SearchFilter(
      divisionIndex: divisionIndex ?? this.divisionIndex,
      bookId: bookId ?? this.bookId,
      bibleVersionId: bibleVersionId ?? this.bibleVersionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'divisionIndex': divisionIndex,
      'bookId': bookId,
      'bibleVersionId': bibleVersionId,
    };
  }

  factory SearchFilter.fromMap(Map<String, dynamic> map) {
    return SearchFilter(
      divisionIndex:
          map['divisionIndex'] != null ? map['divisionIndex'] as int : null,
      bookId: map['bookId'] != null ? map['bookId'] as int : null,
      bibleVersionId:
          map['bibleVersionId'] != null ? map['bibleVersionId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchFilter.fromJson(String source) =>
      SearchFilter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SearchFilter(divisionIndex: $divisionIndex, bookId: $bookId, bibleVersionId: $bibleVersionId)';

  @override
  bool operator ==(covariant SearchFilter other) {
    if (identical(this, other)) return true;

    return other.divisionIndex == divisionIndex &&
        other.bookId == bookId &&
        other.bibleVersionId == bibleVersionId;
  }

  @override
  int get hashCode =>
      divisionIndex.hashCode ^ bookId.hashCode ^ bibleVersionId.hashCode;
}
