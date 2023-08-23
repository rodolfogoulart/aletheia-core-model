import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../bible/verse/referece.dart';

enum TypeWord {
  people,
  place,
  other;

  const TypeWord();  

  toMap() {
    return name;
  }

  factory TypeWord.fromMap(dynamic value) {
    try {
      return TypeWord.values.byName(value);
    } catch (e) {
      return TypeWord.other;
    }
  }
}

class DictionaryWord {
  int id;
  int idDictionary;
  String word;
  TypeWord? wordType;
  String description;
  List<Reference>? references;
  DictionaryWord({
    required this.id,
    required this.idDictionary,
    required this.word,
    this.wordType,
    required this.description,
    this.references,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DictionaryWord &&
        other.id == id &&
        other.idDictionary == idDictionary &&
        other.word == word &&
        other.wordType == wordType &&
        other.description == description &&
        listEquals(other.references, references);
  }

  @override
  int get hashCode {
    return id.hashCode ^ idDictionary.hashCode ^ word.hashCode ^ wordType.hashCode ^ description.hashCode ^ references.hashCode;
  }

  @override
  String toString() {
    return 'DictionaryWord(id: $id, idDictionary: $idDictionary, word: $word, wordType: $wordType, description: $description, references: $references)';
  }

  DictionaryWord copyWith({
    int? id,
    int? idDictionary,
    String? word,
    TypeWord? wordType,
    String? description,
    List<Reference>? references,
  }) {
    return DictionaryWord(
      id: id ?? this.id,
      idDictionary: idDictionary ?? this.idDictionary,
      word: word ?? this.word,
      wordType: wordType ?? this.wordType,
      description: description ?? this.description,
      references: references ?? this.references,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'idDictionary': idDictionary});
    result.addAll({'word': word});
    if (wordType != null) {
      result.addAll({'wordType': wordType!.toMap()});
    }
    result.addAll({'description': description});
    if (references != null) {
      result.addAll({'references': references!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory DictionaryWord.fromMap(Map<String, dynamic> map) {
    return DictionaryWord(
      id: map['id']?.toInt() ?? 0,
      idDictionary: map['idDictionary']?.toInt() ?? 0,
      word: map['word'] ?? '',
      wordType: map['wordType'] != null ? TypeWord.fromMap(map['wordType']) : null,
      description: map['description'] ?? '',
      references: map['references'] != null ? List<Reference>.from(map['references']?.map((x) => Reference.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DictionaryWord.fromJson(String source) => DictionaryWord.fromMap(json.decode(source));
}
