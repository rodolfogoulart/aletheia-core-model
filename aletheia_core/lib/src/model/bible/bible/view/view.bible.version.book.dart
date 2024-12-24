import 'package:aletheia_core/aletheia_core_model.dart';
import 'package:collection/collection.dart';

class BibleVersionBooksView {
  List<BookView> books;
  BibleVersion bible;
  BibleVersionBooksView({
    required this.books,
    required this.bible,
  });

  BibleVersionBooksView copyWith({
    List<BookView>? books,
    BibleVersion? bible,
  }) {
    return BibleVersionBooksView(
      books: books ?? this.books,
      bible: bible ?? this.bible,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is BibleVersionBooksView && listEquals(other.books, books) && other.bible == bible;
  }

  @override
  int get hashCode => books.hashCode ^ bible.hashCode;

  @override
  String toString() => 'BibleVersionBooksView(books: $books, bible: $bible)';
}
