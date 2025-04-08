import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'books': books.map((x) => x.toMap()).toList(),
      'bible': bible.toMap(),
    };
  }

  factory BibleVersionBooksView.fromMap(Map<String, dynamic> map) {
    return BibleVersionBooksView(
      books: List<BookView>.from(
        (map['books'] as List).map<BookView>(
          (x) => BookView.fromMap(x as Map<String, dynamic>),
        ),
      ),
      bible: BibleVersion.fromMap(map['bible'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory BibleVersionBooksView.fromJson(String source) =>
      BibleVersionBooksView.fromMap(json.decode(source) as Map<String, dynamic>);
}
