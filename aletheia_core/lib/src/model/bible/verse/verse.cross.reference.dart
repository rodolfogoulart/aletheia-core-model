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
  int numberChapterReference;
  int numberVerseReferenceBegin;
  int? numberVerseReferenceEnd;

  /// list of verses that are the cross reference of the verse, can be more than one verse if the cross reference is for a range of verses
  ///
  /// this is the view, not used on the database
  List<VerseView> reference;

  ///v1.0.22
  ///
  ///metadata can be used to store some information about the cross reference
  ///
  ///use as json string to store more complex data
  Map<String, dynamic>? metaData;
  VerseCrossReference({
    required this.id,
    required this.idBook,
    required this.numberChapter,
    required this.numberVerse,
    required this.idBookReference,
    required this.numberChapterReference,
    required this.numberVerseReferenceBegin,
    this.numberVerseReferenceEnd,
    this.reference = const [],
    this.metaData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'b': idBook,
      'nc': numberChapter,
      'nv': numberVerse,
      'br': idBookReference,
      'ncr': numberChapterReference,
      'nvrb': numberVerseReferenceBegin,
      'nvre': numberVerseReferenceEnd,
      'r': reference.map((x) => x.toMap()).toList(),
      'md': metaData,
    };
  }

  factory VerseCrossReference.fromMap(Map<String, dynamic> map) {
    try {
      return VerseCrossReference(
        id: map['id'],
        idBook: map['idBook'] ?? map['b'],
        numberChapter: map['numberChapter'] ?? map['nc'],
        numberVerse: map['numberVerse'] ?? map['nv'],
        idBookReference: map['idBookReference'] ?? map['br'],
        numberChapterReference: map['numberChapterReference'] ?? map['ncr'],
        numberVerseReferenceBegin:
            map['numberVerseReferenceBegin'] ?? map['nvrb'],
        numberVerseReferenceEnd: map['numberVerseReferenceEnd'] ?? map['nvre'],
        reference: map['reference'] != null || map['r'] != null
            ? List<VerseView>.from(
                (map['reference'] ?? map['r']).map<VerseView>(
                  (x) => VerseView.fromMap(x as Map<String, dynamic>),
                ),
              )
            : [],
        metaData: map['metaData'] != null || map['md'] != null
            ? Map<String, dynamic>.from(map['metaData'] ?? map['md'])
            : null,
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
