import 'package:aletheia_core_model/aletheia_core_model.dart';
import 'package:flutter/foundation.dart';

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

class SearchVerse {
  double relevance;
  int tokensEqual;
  int tokensPartial;
  List<Position> positions;

  VerseView verse;

  SearchVerse({
    required this.relevance,
    required this.tokensEqual,
    required this.tokensPartial,
    required this.positions,
    required this.verse,
  });

  @override
  bool operator ==(covariant SearchVerse other) {
    if (identical(this, other)) return true;

    return other.relevance == relevance &&
        other.tokensEqual == tokensEqual &&
        other.tokensPartial == tokensPartial &&
        listEquals(other.positions, positions) &&
        other.verse == verse;
  }

  @override
  int get hashCode {
    return relevance.hashCode ^ tokensEqual.hashCode ^ tokensPartial.hashCode ^ positions.hashCode ^ verse.hashCode;
  }

  @override
  String toString() {
    return 'SearchVerse(relevance: $relevance, tokensEqual: $tokensEqual, tokensPartial: $tokensPartial, positions: $positions, verse: $verse)';
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
