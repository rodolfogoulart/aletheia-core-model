import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

///v1.0.16
///
///define where the search is made
enum TypeSearchVerse {
  database,
  ai,
  searchEngine;

  const TypeSearchVerse();

  toMap() {
    return name;
  }

  factory TypeSearchVerse.fromMap(name) {
    return TypeSearchVerse.values.byName(name);
  }
}

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'relevance': relevance,
      'tokensEqual': tokensEqual,
      'tokensPartial': tokensPartial,
      'positions': positions.map((x) => x.toMap()).toList(),
      'typeSearch': typeSearch.toMap(),
      'verse': verse.toMap(),
    };
  }

  factory SearchVerse.fromMap(Map<String, dynamic> map) {
    try {
      return SearchVerse(
        relevance: map['relevance'],
        tokensEqual: map['tokensEqual'],
        tokensPartial: map['tokensPartial'],
        positions: List<Position>.from(
          (map['positions'] as List).map<Position>(
            (x) => Position.fromMap(x as Map<String, dynamic>),
          ),
        ),
        typeSearch: TypeSearchVerse.fromMap(map['typeSearch']),
        verse: VerseView.fromMap(map['verse']),
      );
    } catch (e) {
      throw Exception('Error in SearchVerse.fromMap: $e\n map: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory SearchVerse.fromJson(String source) =>
      SearchVerse.fromMap(json.decode(source) as Map<String, dynamic>);
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': start,
      'end': end,
    };
  }

  factory Position.fromMap(Map<String, dynamic> map) {
    try {
      return Position(
        start: map['start'] as int,
        end: map['end'] as int,
      );
    } catch (e) {
      throw Exception('Error in Position.fromMap: $e\nMap: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory Position.fromJson(String source) =>
      Position.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// ResultSearch store the result of the search
class ResultSearch {
  List<SearchVerse> searchVerse;

  /// total of results
  int total;

  Map<String, dynamic> metaData;

  ResultSearch({
    required this.searchVerse,
    required this.total,
    this.metaData = const {},
  });

  @override
  String toString() {
    return 'ResultSearch(searchVerse: $searchVerse, total: $total, metaData: $metaData)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchVerse': searchVerse.map((x) => x.toMap()).toList(),
      'total': total,
      'metaData': metaData,
    };
  }

  factory ResultSearch.fromMap(Map<String, dynamic> map) {
    try {
      return ResultSearch(
        searchVerse: List<SearchVerse>.from(
          (map['searchVerse'] as List).map<SearchVerse>(
            (x) => SearchVerse.fromMap(x as Map<String, dynamic>),
          ),
        ),
        total: map['total'],
        metaData: Map<String, dynamic>.from(
            (map['metaData'] as Map<String, dynamic>)),
      );
    } catch (e) {
      throw Exception('Error in ResultSearch.fromMap: $e');
    }
  }

  String toJson() => json.encode(toMap());

  factory ResultSearch.fromJson(String source) =>
      ResultSearch.fromMap(json.decode(source) as Map<String, dynamic>);
}
