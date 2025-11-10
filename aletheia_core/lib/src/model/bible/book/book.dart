import 'dart:convert';

enum Division {
  oldTestament,
  newTestament,
  apocryphal,
  none;

  const Division();
  String getName([bool shortTerm = true]) {
    switch (this) {
      case Division.oldTestament:
        return shortTerm ? 'OT' : 'Old Testament';
      case Division.newTestament:
        return shortTerm ? 'NT' : 'New Testament';
      case Division.apocryphal:
        return shortTerm ? 'A' : 'Apocryphal';
      case Division.none:
        return shortTerm ? 'O' : 'Other';
    }
  }

  ///used on Dart Class Generation
  toMap() {
    return Division.values.indexOf(this);
  }

  ///used on Dart Class Generation
  factory Division.fromMap(dynamic value) {
    if (value == null) {
      return Division.none;
    }
    //
    if (int.tryParse(value) != null) {
      if (value == 0) {
        return Division.oldTestament;
      } else if (value == 1) {
        return Division.newTestament;
      } else if (value == 2) {
        return Division.apocryphal;
      } else if (value == 3) {
        return Division.none;
      } else {
        return Division.none;
      }
    }

    try {
      return Division.values.byName(value);
    } catch (e) {
      print('Error parsing Division.fromMap: $e, value: $value');
      return Division.none;
    }
  }
}

extension DivisionExtension on Division {
  bool get isOldTestament => this == Division.oldTestament;
  bool get isNewTestament => this == Division.newTestament;
  bool get isApocryphal => this == Division.apocryphal;
  bool get isNone => this == Division.none;
}

///for the books see the table on https://en.wikipedia.org/wiki/Biblical_canon
///
///it will be used the Protestant Sequence of the books
///
///starting on 1 = (Genesis) and go 66 = (Revelations)
///
///from 67 and going on, will be the books apart the Protestant Canon, so apocrypha or another category of books
///
///so to reveal the `books` of the bible version, need to fill the `bible version books`, that can be ordereded in same ordering schema using the field `sequence`
///
///the **translations** of the books will be: considered on `bible version books`, name and abrev
///
///the number of chapters of the book will be considered on `bible version books`, because different cannon of the bible has different number of chapters
///
///don't forget to overwrite the name and abrev of the version
///
///see: **[BibleVersionBooks]** class
class Book {
  ///id need to be unique and a constant, and not autoincrement
  int id;

  ///overwrite on [BibleVersionBooks] by [nameTranslation]
  String name;

  ///overwrite on [BibleVersionBooks] by [abrevTranslation]
  String abrev;
  Division division;

  ///the literary genre of the book
  String? literaryGenre;

  ///can be `Protestant`, `Catholic`, `Orthodox` or Others
  String? cannon;
  Book({
    this.id = 0,
    required this.name,
    required this.abrev,
    required this.division,
    this.literaryGenre,
    this.cannon = 'Protestant',
  });

  Book copyWith({
    int? id,
    String? name,
    String? abrev,
    Division? division,
    String? literaryGenre,
    String? cannon,
  }) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      abrev: abrev ?? this.abrev,
      division: division ?? this.division,
      literaryGenre: literaryGenre ?? this.literaryGenre,
      cannon: cannon ?? this.cannon,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'abrev': abrev});
    result.addAll({'division': division.toMap()});
    if (literaryGenre != null) {
      result.addAll({'literaryGenre': literaryGenre});
    }
    if (cannon != null) {
      result.addAll({'cannon': cannon});
    }

    return result;
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    try {
      return Book(
        id: map['id']?.toInt() ?? 0,
        name: map['name'] ?? '',
        abrev: map['abrev'] ?? '',
        division: Division.fromMap(map['division']),
        literaryGenre: map['literaryGenre'],
        cannon: map['cannon'],
      );
    } catch (e) {
      throw Exception('Error parsing Book.fromMap: $e, map: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(id: $id, name: $name, abrev: $abrev, division: $division, literaryGenre: $literaryGenre, cannon: $cannon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.id == id &&
        other.name == name &&
        other.abrev == abrev &&
        other.division == division &&
        other.literaryGenre == literaryGenre &&
        other.cannon == cannon;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        abrev.hashCode ^
        division.hashCode ^
        literaryGenre.hashCode ^
        cannon.hashCode;
  }
}
