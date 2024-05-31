// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

abstract class TypeSearch {
  Map<String, dynamic> toMap();

  String toJson() => json.encode(toMap());
}

class TypeSearchBook extends TypeSearch {
  int idBook;
  TypeSearchBook({
    required this.idBook,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idBook': idBook,
    };
  }

  factory TypeSearchBook.fromMap(Map<String, dynamic> map) {
    return TypeSearchBook(
      idBook: map['idBook'] as int,
    );
  }

  factory TypeSearchBook.fromJson(String source) => TypeSearchBook.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TypeSearchChapter extends TypeSearchBook {
  int numberChapter;
  int idVersion;

  TypeSearchChapter({
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

  factory TypeSearchChapter.fromMap(Map<String, dynamic> map) {
    return TypeSearchChapter(
      numberChapter: map['numberChapter'] as int,
      idVersion: map['idVersion'] as int,
      idBook: map['idBook'] as int,
    );
  }

  factory TypeSearchChapter.fromJson(String source) => TypeSearchChapter.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TypeSearchVerse extends TypeSearchChapter {
  int numberVerse;

  TypeSearchVerse({
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

  factory TypeSearchVerse.fromMap(Map<String, dynamic> map) {
    return TypeSearchVerse(
      numberVerse: map['numberVerse'] as int,
      numberChapter: map['numberChapter'] as int,
      idVersion: map['idVersion'] as int,
      idBook: map['idBook'] as int,
    );
  }

  factory TypeSearchVerse.fromJson(String source) => TypeSearchVerse.fromMap(json.decode(source) as Map<String, dynamic>);
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

  factory UserHistorySearch.fromJson(String source) => UserHistorySearch.fromMap(json.decode(source) as Map<String, dynamic>);

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
    return id.hashCode ^ idBook.hashCode ^ numberChapter.hashCode ^ value.hashCode ^ date.hashCode;
  }
}
