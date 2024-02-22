// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aletheia_core_model/aletheia_core_model.dart';

///Verse with the list of AnalizeGrammar (tokens)
class AnalizeGrammarVerse {
  int numberVerse;

  ///some versions has joined verses
  int? numberVerseEnd;

  ///store as list json of [AnalizeGrammar]
  ///
  ///use the object [AnalizeGrammar] to retrieve the data
  List<AnalizeGrammar> analizeGrammar;
  AnalizeGrammarVerse({
    required this.numberVerse,
    this.numberVerseEnd,
    required this.analizeGrammar,
  });

  AnalizeGrammarVerse copyWith({
    int? numberVerse,
    int? numberVerseEnd,
    List<AnalizeGrammar>? analizeGrammar,
  }) {
    return AnalizeGrammarVerse(
      numberVerse: numberVerse ?? this.numberVerse,
      numberVerseEnd: numberVerseEnd ?? this.numberVerseEnd,
      analizeGrammar: analizeGrammar ?? this.analizeGrammar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'numberVerse': numberVerse,
      'numberVerseEnd': numberVerseEnd,
      'analizeGrammar': analizeGrammar.map((x) => x.toMap()).toList(),
    };
  }

  factory AnalizeGrammarVerse.fromMap(Map<String, dynamic> map) {
    return AnalizeGrammarVerse(
      numberVerse: map['numberVerse'] as int,
      numberVerseEnd: map['numberVerseEnd'] != null ? map['numberVerseEnd'] as int : null,
      analizeGrammar: List<AnalizeGrammar>.from(
        (map['analizeGrammar'] as List).map<AnalizeGrammar>(
          (x) => AnalizeGrammar.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalizeGrammarVerse.fromJson(String source) => AnalizeGrammarVerse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AnalizeGrammarVerse(numberVerse: $numberVerse, numberVerseEnd: $numberVerseEnd, analizeGrammar: $analizeGrammar)';

  @override
  bool operator ==(covariant AnalizeGrammarVerse other) {
    if (identical(this, other)) return true;

    return other.numberVerse == numberVerse &&
        other.numberVerseEnd == numberVerseEnd &&
        listEquals(other.analizeGrammar, analizeGrammar);
  }

  @override
  int get hashCode => numberVerse.hashCode ^ numberVerseEnd.hashCode ^ analizeGrammar.hashCode;
}

class NlpChapter {
  ///primary key
  int id;

  ///unique hash of the bible version, used to search between versions
  String hashBibleVersion;

  ///as book has a fixed list of books, can be used to filter
  int idBook;
  int numberChapter;

  ///list of Tokens breaked by verse
  List<AnalizeGrammarVerse> analizeGrammarVerse;

  /// The overall sentiment for the document.
  ///
  /// Populated if the user enables
  /// AnnotateTextRequest.Features.extract_document_sentiment.
  Sentiment? documentSentiment;

  /// Entities, along with their semantic information, in the input document.
  ///
  /// Populated if the user enables
  /// AnnotateTextRequest.Features.extract_entities.
  List<Entity>? entities;

  /// Sentences in the input document.
  ///
  /// Populated if the user enables AnnotateTextRequest.Features.extract_syntax.
  List<Sentence>? sentences;
  NlpChapter({
    required this.id,
    required this.hashBibleVersion,
    required this.idBook,
    required this.numberChapter,
    required this.analizeGrammarVerse,
    this.documentSentiment,
    this.entities,
    this.sentences,
  });

  NlpChapter copyWith({
    int? id,
    String? hashBibleVersion,
    int? idBook,
    int? numberChapter,
    List<AnalizeGrammarVerse>? analizeGrammarVerse,
    Sentiment? documentSentiment,
    List<Entity>? entities,
    List<Sentence>? sentences,
  }) {
    return NlpChapter(
      id: id ?? this.id,
      hashBibleVersion: hashBibleVersion ?? this.hashBibleVersion,
      idBook: idBook ?? this.idBook,
      numberChapter: numberChapter ?? this.numberChapter,
      analizeGrammarVerse: analizeGrammarVerse ?? this.analizeGrammarVerse,
      documentSentiment: documentSentiment ?? this.documentSentiment,
      entities: entities ?? this.entities,
      sentences: sentences ?? this.sentences,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'hashBibleVersion': hashBibleVersion,
      'idBook': idBook,
      'numberChapter': numberChapter,
      'analizeGrammarVerse': analizeGrammarVerse.map((x) => x.toMap()).toList(),
      'documentSentiment': documentSentiment?.toMap(),
      'entities': entities?.map((x) => x.toMap()).toList(),
      'sentences': sentences?.map((x) => x.toMap()).toList(),
    };
  }

  factory NlpChapter.fromMap(Map<String, dynamic> map) {
    return NlpChapter(
      id: map['id'] as int,
      hashBibleVersion: map['hashBibleVersion'] as String,
      idBook: map['idBook'] as int,
      numberChapter: map['numberChapter'] as int,
      analizeGrammarVerse: List<AnalizeGrammarVerse>.from(
        (map['analizeGrammarVerse'] as List).map<AnalizeGrammarVerse>(
          (x) => AnalizeGrammarVerse.fromMap(x as Map<String, dynamic>),
        ),
      ),
      documentSentiment:
          map['documentSentiment'] != null ? Sentiment.fromMap(map['documentSentiment'] as Map<String, dynamic>) : null,
      entities: map['entities'] != null
          ? List<Entity>.from(
              (map['entities'] as List).map<Entity?>(
                (x) => Entity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      sentences: map['sentences'] != null
          ? List<Sentence>.from(
              (map['sentences'] as List).map<Sentence?>(
                (x) => Sentence.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NlpChapter.fromJson(String source) => NlpChapter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NlpChapter(id: $id, hashBibleVersion: $hashBibleVersion, idBook: $idBook, numberChapter: $numberChapter, analizeGrammarVerse: $analizeGrammarVerse, documentSentiment: $documentSentiment, entities: $entities, sentences: $sentences)';
  }

  @override
  bool operator ==(covariant NlpChapter other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.hashBibleVersion == hashBibleVersion &&
        other.idBook == idBook &&
        other.numberChapter == numberChapter &&
        listEquals(other.analizeGrammarVerse, analizeGrammarVerse) &&
        other.documentSentiment == documentSentiment &&
        listEquals(other.entities, entities) &&
        listEquals(other.sentences, sentences);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        hashBibleVersion.hashCode ^
        idBook.hashCode ^
        numberChapter.hashCode ^
        analizeGrammarVerse.hashCode ^
        documentSentiment.hashCode ^
        entities.hashCode ^
        sentences.hashCode;
  }
}
