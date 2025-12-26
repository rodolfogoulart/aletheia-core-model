// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aletheia_core/aletheia_core_model.dart';
import 'package:collection/collection.dart';

///Footnote class used on Verse Content
class Footnote {
  ///[id] is the id of the footnote
  ///
  ///use [n1] or [n2] or [n+number] to identify the footnote
  ///
  ///use key `fnId` to [id] on convert to map and from map
  ///
  final String id;

  ///[text] is the text of the footnote
  ///
  /// It is a list of [AText] to allow for rich text formatting
  ///
  ///use key `fnT` to [text] on convert to map and from map
  final List<AText> text;

  ///List of references associated with the footnote
  ///
  /// Each reference is represented by a [Reference] object
  ///
  final List<Reference>? references;

  Footnote({
    required this.id,
    required this.text,
    this.references,
  });

  Footnote copyWith({
    String? id,
    List<AText>? text,
    List<Reference>? references,
  }) {
    return Footnote(
      id: id ?? this.id,
      text: text ?? this.text,
      references: references ?? this.references,
    );
  }

  ///*DON'T FORGET TO CHANGE THE NAME OF THE KEY
  ///
  ///use KEY [fnId] to id
  ///
  ///use KEY [fnT] to text
  ///
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = <String, dynamic>{
      'fnId': id,
      'fnT': text,
      'fnR': references?.map((x) => x.toMap()).toList(),
    };

    ///remove nulls
    result.removeWhere((key, value) => value == null);

    return result;
  }

  ///*DON'T FORGET TO CHANGE THE NAME OF THE KEY
  ///
  ///use KEY [fnId] to id
  ///
  ///use KEY [fnT] to text
  ///
  factory Footnote.fromMap(Map<String, dynamic> map) {
    try {
      var text = <AText>[];
      try {
        text = List<AText>.from(
          (map['fnT'] as List).map<AText>(
            (x) => AText.fromMap(x),
          ),
        );
      } catch (e) {
        text = [];
        print('Error parsing AText list in Footnote.fromMap: $e');
      }

      return Footnote(
        id: map['fnId'] as String,
        text: text,
        references: map['fnR'] != null
            ? List<Reference>.from(
                (map['fnR'] as List).map<Reference>(
                  (x) => Reference.fromMap(x),
                ),
              )
            : null,
      );
    } catch (e) {
      throw Exception('Error parsing Footnote.fromMap: $e, map: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory Footnote.fromJson(String source) =>
      Footnote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Footnote(id: $id, text: $text, references: $references)';

  @override
  bool operator ==(covariant Footnote other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.text == text &&
        listEquals(other.references, references);
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ references.hashCode;
}
