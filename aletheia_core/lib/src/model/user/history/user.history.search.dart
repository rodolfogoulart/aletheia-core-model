// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

abstract class HistoryTypeSearch {
  Map<String, dynamic> toMap();

  String toJson() => json.encode(toMap());
}

class HistoryTypeSearchBook extends HistoryTypeSearch {
  int idBook;
  HistoryTypeSearchBook({
    required this.idBook,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idBook': idBook,
    };
  }

  factory HistoryTypeSearchBook.fromMap(Map<String, dynamic> map) {
    return HistoryTypeSearchBook(
      idBook: map['idBook'] as int,
    );
  }

  factory HistoryTypeSearchBook.fromJson(String source) =>
      HistoryTypeSearchBook.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class HistoryTypeSearchChapter extends HistoryTypeSearchBook {
  int numberChapter;
  int idVersion;

  HistoryTypeSearchChapter({
    required this.numberChapter,
    required this.idVersion,
    required super.idBook,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numberChapter': numberChapter,
      'idVersion': idVersion,
      'idBook': idBook,
    };
  }

  factory HistoryTypeSearchChapter.fromMap(Map<String, dynamic> map) {
    return HistoryTypeSearchChapter(
      numberChapter: map['numberChapter'] as int,
      idVersion: map['idVersion'] as int,
      idBook: map['idBook'] as int,
    );
  }

  factory HistoryTypeSearchChapter.fromJson(String source) =>
      HistoryTypeSearchChapter.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class HistoryTypeSearchVerse extends HistoryTypeSearchChapter {
  int numberVerse;

  HistoryTypeSearchVerse({
    required this.numberVerse,
    required super.numberChapter,
    required super.idVersion,
    required super.idBook,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numberVerse': numberVerse,
      'numberChapter': numberChapter,
      'idVersion': idVersion,
      'idBook': idBook,
    };
  }

  factory HistoryTypeSearchVerse.fromMap(Map<String, dynamic> map) {
    return HistoryTypeSearchVerse(
      numberVerse: map['numberVerse'] as int,
      numberChapter: map['numberChapter'] as int,
      idVersion: map['idVersion'] as int,
      idBook: map['idBook'] as int,
    );
  }

  factory HistoryTypeSearchVerse.fromJson(String source) =>
      HistoryTypeSearchVerse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class UserHistorySearch {
  int id;
  int idBook;
  int numberChapter;
  String? value;
  DateTime date;
  UserHistorySearch({
    required this.id,
    required this.idBook,
    required this.numberChapter,
    this.value,
    required this.date,
  });

  UserHistorySearch copyWith({
    int? id,
    int? idBook,
    int? numberChapter,
    String? value,
    DateTime? date,
  }) {
    return UserHistorySearch(
      id: id ?? this.id,
      idBook: idBook ?? this.idBook,
      numberChapter: numberChapter ?? this.numberChapter,
      value: value ?? this.value,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idBook': idBook,
      'numberChapter': numberChapter,
      'value': value,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory UserHistorySearch.fromMap(Map<String, dynamic> map) {
    return UserHistorySearch(
      id: map['id'] as int,
      idBook: map['idBook'] as int,
      numberChapter: map['numberChapter'] as int,
      value: map['value'] != null ? map['value'] as String : null,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserHistorySearch.fromJson(String source) =>
      UserHistorySearch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserHistorySearch(id: $id, idBook: $idBook, numberChapter: $numberChapter, value: $value, date: $date)';
  }

  @override
  bool operator ==(covariant UserHistorySearch other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.idBook == idBook &&
        other.numberChapter == numberChapter &&
        other.value == value &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idBook.hashCode ^
        numberChapter.hashCode ^
        value.hashCode ^
        date.hashCode;
  }
}
