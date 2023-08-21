import 'dart:convert';

import 'package:flutter/foundation.dart';

class Lexico {
  int id;
  int idLexicoVersion;
  String idRef;
  String? originalWord;
  String? translatedPronunciation;
  String? pronunciation;
  String? title;
  String? description;
  String? partOfSpeech;
  List<String>? cognate;
  Lexico({
    this.id = 0,
    this.idLexicoVersion = 0,
    required this.idRef,
    required this.originalWord,
    required this.translatedPronunciation,
    required this.pronunciation,
    required this.title,
    required this.description,
    this.partOfSpeech,
    this.cognate,
  });

  Lexico copyWith({
    int? id,
    int? idLexicoVersion,
    String? idRef,
    String? originalWord,
    String? translatedPronunciation,
    String? pronunciation,
    String? title,
    String? description,
    String? partOfSpeech,
    List<String>? cognate,
  }) {
    return Lexico(
      id: id ?? this.id,
      idLexicoVersion: idLexicoVersion ?? this.idLexicoVersion,
      idRef: idRef ?? this.idRef,
      originalWord: originalWord ?? this.originalWord,
      translatedPronunciation: translatedPronunciation ?? this.translatedPronunciation,
      pronunciation: pronunciation ?? this.pronunciation,
      title: title ?? this.title,
      description: description ?? this.description,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      cognate: cognate ?? this.cognate,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Lexico &&
        other.id == id &&
        other.idLexicoVersion == idLexicoVersion &&
        other.idRef == idRef &&
        other.originalWord == originalWord &&
        other.translatedPronunciation == translatedPronunciation &&
        other.pronunciation == pronunciation &&
        other.title == title &&
        other.description == description &&
        other.partOfSpeech == partOfSpeech &&
        listEquals(other.cognate, cognate);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idLexicoVersion.hashCode ^
        idRef.hashCode ^
        originalWord.hashCode ^
        translatedPronunciation.hashCode ^
        pronunciation.hashCode ^
        title.hashCode ^
        description.hashCode ^
        partOfSpeech.hashCode ^
        cognate.hashCode;
  }

  @override
  String toString() {
    return 'Lexico(id: $id, idLexicoVersion: $idLexicoVersion, idRef: $idRef, originalWord: $originalWord, translatedPronunciation: $translatedPronunciation, pronunciation: $pronunciation, title: $title, description: $description, partOfSpeech: $partOfSpeech, cognate: $cognate)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'idLexicoVersion': idLexicoVersion});
    result.addAll({'idRef': idRef});
    if (originalWord != null) {
      result.addAll({'originalWord': originalWord});
    }
    if (translatedPronunciation != null) {
      result.addAll({'translatedPronunciation': translatedPronunciation});
    }
    if (pronunciation != null) {
      result.addAll({'pronunciation': pronunciation});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (partOfSpeech != null) {
      result.addAll({'partOfSpeech': partOfSpeech});
    }
    if (cognate != null) {
      result.addAll({'cognate': cognate});
    }

    return result;
  }

  factory Lexico.fromMap(Map<String, dynamic> map) {
    return Lexico(
      id: map['id']?.toInt() ?? 0,
      idLexicoVersion: map['idLexicoVersion']?.toInt() ?? 0,
      idRef: map['idRef'] ?? '',
      originalWord: map['originalWord'],
      translatedPronunciation: map['translatedPronunciation'],
      pronunciation: map['pronunciation'],
      title: map['title'],
      description: map['description'],
      partOfSpeech: map['partOfSpeech'],
      cognate: List<String>.from(map['cognate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Lexico.fromJson(String source) => Lexico.fromMap(json.decode(source));
}
