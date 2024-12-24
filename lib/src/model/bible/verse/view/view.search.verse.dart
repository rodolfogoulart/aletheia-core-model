import 'package:aletheia_core/aletheia_core_model.dart';
import 'package:collection/collection.dart';

///v1.0.16
///
///define where the search is made
enum TypeSearchVerse { database, ai }

///SearchVerse store the result of the search
///
///**with the following properties**
///
///[relevance] : computed relevance of the tokens to the verse
///
///[tokensEqual] : number of tokens that are equal
///
///[tokensPartial] : number of tokens that are partial
///
///[verse] : the VerseView
///
///[positions] : the position of the tokens
///
///[typeSearch] : define where the search is made (v1.0.16)

class SearchVerse {
  double relevance;
  int tokensEqual;
  int tokensPartial;
  List<Position> positions;

  ///v1.0.16
  TypeSearchVerse typeSearch;

  VerseView verse;

  SearchVerse({
    required this.relevance,
    required this.tokensEqual,
    required this.tokensPartial,
    required this.positions,
    this.typeSearch = TypeSearchVerse.database,
    required this.verse,
  });

  @override
  bool operator ==(covariant SearchVerse other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.relevance == relevance &&
        other.tokensEqual == tokensEqual &&
        other.tokensPartial == tokensPartial &&
        listEquals(other.positions, positions) &&
        other.typeSearch == typeSearch &&
        other.verse == verse;
  }

  @override
  int get hashCode {
    return relevance.hashCode ^
        tokensEqual.hashCode ^
        tokensPartial.hashCode ^
        positions.hashCode ^
        typeSearch.hashCode ^
        verse.hashCode;
  }

  @override
  String toString() {
    return 'SearchVerse(relevance: $relevance, tokensEqual: $tokensEqual, tokensPartial: $tokensPartial, positions: $positions, typeSearch: $typeSearch, verse: $verse)';
  }
}

class Position {
  int start;
  int end;
  Position({
    required this.start,
    required this.end,
  });

  @override
  String toString() => 'Position(start: $start, end: $end)';
}
