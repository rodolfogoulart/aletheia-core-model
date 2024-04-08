import 'package:aletheia_core_model/aletheia_core_model.dart';

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
  });

  /// when used the factory, **don't forget to add** the fields ```numberChapters``` and ```sequence```
  ///
  /// after the factory
  factory BookView.fromBook(Book book) =>
      BookView(abrev: book.abrev, division: book.division, literaryGenre: book.literaryGenre, name: book.name, id: book.id);

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
}
