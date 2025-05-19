// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/aletheia_core_model.dart';

class CommentaryContentView {
  List<CommentaryContent> contents;
  List<CommentaryContent>? bookIntroduction;
  Commentary comentary;

  CommentaryContentView({
    required this.contents,
    required this.comentary,
    this.bookIntroduction,
  });

  @override
  bool operator ==(covariant CommentaryContentView other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.contents, contents) &&
        listEquals(other.bookIntroduction, bookIntroduction) &&
        other.comentary == comentary;
  }

  @override
  int get hashCode =>
      contents.hashCode ^ bookIntroduction.hashCode ^ comentary.hashCode;

  Map<String, dynamic> toMap() {
    var result = <String, dynamic>{
      'contents': contents.map((x) => x.toMap()).toList(),
      'bookIntroduction': bookIntroduction?.map((x) => x.toMap()).toList(),
      'comentary': comentary.toMap(),
    };
    // Remove null values from the map
    result.removeWhere((key, value) => value == null);
    return result;
  }

  factory CommentaryContentView.fromMap(Map<String, dynamic> map) {
    try {
      return CommentaryContentView(
        contents: List<CommentaryContent>.from(
          (map['contents'] as List).map<CommentaryContent>(
            (x) => CommentaryContent.fromMap(x as Map<String, dynamic>),
          ),
        ),
        bookIntroduction: map['bookIntroduction'] != null
            ? List<CommentaryContent>.from(
                (map['bookIntroduction'] as List).map<CommentaryContent?>(
                  (x) => CommentaryContent.fromMap(x as Map<String, dynamic>),
                ),
              )
            : null,
        comentary: Commentary.fromMap(map['comentary'] as Map<String, dynamic>),
      );
    } catch (e, stackTrace) {
      throw Exception(
          'Error parsing CommentaryContentView from map: $e\n$stackTrace');
    }
  }

  String toJson() => json.encode(toMap());

  factory CommentaryContentView.fromJson(String source) =>
      CommentaryContentView.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
