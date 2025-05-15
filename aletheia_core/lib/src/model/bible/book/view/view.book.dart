import 'dart:convert';

import 'package:aletheia_core/aletheia_core_model.dart';

class BookView extends Book {
  int? numberChapters;
  int? sequence;
  BookView({
    this.numberChapters = 1,
    this.sequence = 0,
    super.id,
    required super.name,
    required super.abrev,
    required super.division,
    required super.literaryGenre,
    super.cannon,
  });

  /// when used the factory, **don't forget to add** the fields ```numberChapters``` and ```sequence```
  ///
  /// after the factory
  factory BookView.fromBook(Book book, {int? numberChapters, int? sequence}) =>
      BookView(
        abrev: book.abrev,
        division: book.division,
        literaryGenre: book.literaryGenre,
        name: book.name,
        id: book.id,
        cannon: book.cannon,
        numberChapters: numberChapters,
        sequence: sequence,
      );

  @override
  bool operator ==(covariant BookView other) {
    if (identical(this, other)) return true;

    return other.sequence == sequence &&
        other.numberChapters == numberChapters &&
        other.abrev == abrev &&
        other.cannon == cannon &&
        other.division == division &&
        other.id == id &&
        other.literaryGenre == literaryGenre &&
        other.name == name;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      sequence.hashCode ^
      numberChapters.hashCode ^
      abrev.hashCode ^
      cannon.hashCode ^
      division.hashCode ^
      literaryGenre.hashCode ^
      name.hashCode;
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'abrev': abrev,
      'cannon': cannon,
      'division': division.toMap(),
      'literaryGenre': literaryGenre,
      'name': name,
      'numberChapters': numberChapters,
      'sequence': sequence,
    };
  }

  factory BookView.fromMap(Map<String, dynamic> map) {
    try {
      return BookView(
        id: map['id'],
        name: map['name'],
        abrev: map['abrev'],
        division: map['division'] != null
            ? Division.fromMap(map['division'])
            : Division.none,
        literaryGenre: map['literaryGenre'] as String,
        cannon: map['cannon'],
        numberChapters:
            map['numberChapters'] != null ? map['numberChapters'] as int : null,
        sequence: map['sequence'] != null ? map['sequence'] as int : null,
      );
    } catch (e) {
      throw Exception('Error parsing BookView.fromMap: $e\nMap: $map');
    }
  }
  @override
  String toJson() => json.encode(toMap());

  factory BookView.fromJson(String source) =>
      BookView.fromMap(json.decode(source) as Map<String, dynamic>);
}
