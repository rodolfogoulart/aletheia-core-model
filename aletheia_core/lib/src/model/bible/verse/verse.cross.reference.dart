// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aletheia_core/aletheia_core_model.dart';

class VerseCrossReference {
  int id;
  //from
  int idBook;
  int numberChapter;
  int numberVerse;
  //cross reference
  int idBookReference;
  int? numberVerseEnd;
  List<VerseView> reference;

  ///v1.0.22
  ///
  ///metadata can be used to store some information about the cross reference
  ///
  ///use as json string to store more complex data
  String? metaData;
  VerseCrossReference({
    required this.id,
    required this.idBook,
    required this.numberChapter,
    required this.numberVerse,
    required this.idBookReference,
    this.numberVerseEnd,
    required this.reference,
    this.metaData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idBook': idBook,
      'numberChapter': numberChapter,
      'numberVerse': numberVerse,
      'idBookReference': idBookReference,
      'numberVerseEnd': numberVerseEnd,
      'reference': reference.map((x) => x.toMap()).toList(),
      'metaData': metaData,
    };
  }

  factory VerseCrossReference.fromMap(Map<String, dynamic> map) {
    try {
      return VerseCrossReference(
        id: map['id'],
        idBook: map['idBook'],
        numberChapter: map['numberChapter'],
        numberVerse: map['numberVerse'],
        idBookReference: map['idBookReference'],
        numberVerseEnd: map['numberVerseEnd'],
        reference: map['reference'] != null
            ? List<VerseView>.from(
                (map['reference']).map<VerseView>(
                  (x) => VerseView.fromMap(x as Map<String, dynamic>),
                ),
              )
            : [],
        metaData: map['metaData'],
      );
    } catch (e) {
      throw Exception(
          'Error parsing VerseCrossReference.fromMap: $e, map: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory VerseCrossReference.fromJson(String source) =>
      VerseCrossReference.fromMap(json.decode(source) as Map<String, dynamic>);
}
