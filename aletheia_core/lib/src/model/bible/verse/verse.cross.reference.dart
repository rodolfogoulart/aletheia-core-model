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
  VerseCrossReference({
    required this.id,
    required this.idBook,
    required this.numberChapter,
    required this.numberVerse,
    required this.idBookReference,
    this.numberVerseEnd,
    required this.reference,
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
    };
  }

  factory VerseCrossReference.fromMap(Map<String, dynamic> map) {
    return VerseCrossReference(
      id: map['id'],
      idBook: map['idBook'],
      numberChapter: map['numberChapter'],
      numberVerse: map['numberVerse'],
      idBookReference: map['idBookReference'],
      numberVerseEnd: map['numberVerseEnd'],
      reference: List<VerseView>.from(
        (map['reference']).map<VerseView>(
          (x) => VerseView.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseCrossReference.fromJson(String source) =>
      VerseCrossReference.fromMap(json.decode(source) as Map<String, dynamic>);
}
