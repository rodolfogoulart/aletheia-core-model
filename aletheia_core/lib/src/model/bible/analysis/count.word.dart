// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CountWord {
  int idBook;  
  int total;

  /// This is for display only, the book name need to cross the version book name translation
  String? bookName;

  /// Can be used to filter the count word by version, because the same book in different version can have different total word
  int? idBibleVersion;
  CountWord({
    required this.idBook,
    required this.total,
    this.bookName,
    this.idBibleVersion,
  });

  CountWord copyWith({
    int? idBook,
    int? total,
    String? bookName,
    int? idBibleVersion,
  }) {
    return CountWord(
      idBook: idBook ?? this.idBook,
      total: total ?? this.total,
      bookName: bookName ?? this.bookName,
      idBibleVersion: idBibleVersion ?? this.idBibleVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idBook': idBook,
      'total': total,
      'bookName': bookName,
      'idBibleVersion': idBibleVersion,
    };
  }

  factory CountWord.fromMap(Map<String, dynamic> map) {
    return CountWord(
      idBook: map['idBook'] as int,
      total: map['total'] as int,
      bookName: map['bookName'] != null ? map['bookName'] as String : null,
      idBibleVersion:
          map['idBibleVersion'] != null ? map['idBibleVersion'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountWord.fromJson(String source) =>
      CountWord.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountWord(idBook: $idBook, total: $total, bookName: $bookName, idBibleVersion: $idBibleVersion)';
  }

  @override
  bool operator ==(covariant CountWord other) {
    if (identical(this, other)) return true;

    return other.idBook == idBook &&
        other.total == total &&
        other.bookName == bookName &&
        other.idBibleVersion == idBibleVersion;
  }

  @override
  int get hashCode {
    return idBook.hashCode ^
        total.hashCode ^
        bookName.hashCode ^
        idBibleVersion.hashCode;
  }
}
