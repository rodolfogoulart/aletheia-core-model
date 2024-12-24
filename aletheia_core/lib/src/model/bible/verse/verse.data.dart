import 'dart:convert';

import 'package:collection/collection.dart';

enum TypeData {
  video,
  audio,
  image,
  maps,
  //maybe another table
  exegesis, //https://www.youtube.com/watch?v=IPBOHMowTOY
  verseDivision, //divisão do texto, quando começa o escopo do texto para quando termina https://youtu.be/IPBOHMowTOY?t=753
  other,
  ;

  const TypeData();

  ///used on Dart Class Generation
  toMap() {
    return name;
  }

  ///used on Dart Class Generation
  factory TypeData.fromMap(dynamic value) {
    try {
      return TypeData.values.byName(value);
    } catch (e) {
      return TypeData.other;
    }
  }
}

extension TypeDataExtension on TypeData {
  bool get isVideo => this == TypeData.video;
  bool get isAudio => this == TypeData.audio;
  bool get isImage => this == TypeData.image;
  bool get isMaps => this == TypeData.maps;
  bool get isExegesis => this == TypeData.exegesis;
  bool get isVerseDivision => this == TypeData.verseDivision;
  bool get isOther => this == TypeData.other;
}

///to add informations to the verse, can be used to add video, audio, image
///
///like video from LUMO (youtube link)
class VerseData {
  int idBook;
  int idChapter;
  String? abrevVersion;
  int numberVerse;
  int numberVerseEnd;
  Map<String, dynamic> data;
  VerseData({
    required this.idBook,
    required this.idChapter,
    required this.abrevVersion,
    required this.numberVerse,
    required this.numberVerseEnd,
    required this.data,
  });

  VerseData copyWith({
    int? idBook,
    int? idChapter,
    String? abrevVersion,
    int? numberVerse,
    int? numberVerseEnd,
    Map<String, dynamic>? data,
  }) {
    return VerseData(
      idBook: idBook ?? this.idBook,
      idChapter: idChapter ?? this.idChapter,
      abrevVersion: abrevVersion ?? this.abrevVersion,
      numberVerse: numberVerse ?? this.numberVerse,
      numberVerseEnd: numberVerseEnd ?? this.numberVerseEnd,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'idBook': idBook});
    result.addAll({'idChapter': idChapter});
    if (abrevVersion != null) {
      result.addAll({'abrevVersion': abrevVersion});
    }
    result.addAll({'numberVerse': numberVerse});
    result.addAll({'numberVerseEnd': numberVerseEnd});
    result.addAll({'data': data});

    return result;
  }

  factory VerseData.fromMap(Map<String, dynamic> map) {
    return VerseData(
      idBook: map['idBook']?.toInt() ?? 0,
      idChapter: map['idChapter']?.toInt() ?? 0,
      abrevVersion: map['abrevVersion'],
      numberVerse: map['numberVerse']?.toInt() ?? 0,
      numberVerseEnd: map['numberVerseEnd']?.toInt() ?? 0,
      data: Map<String, dynamic>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseData.fromJson(String source) => VerseData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VerseData(idBook: $idBook, idChapter: $idChapter, abrevVersion: $abrevVersion, numberVerse: $numberVerse, numberVerseEnd: $numberVerseEnd, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is VerseData &&
        other.idBook == idBook &&
        other.idChapter == idChapter &&
        other.abrevVersion == abrevVersion &&
        other.numberVerse == numberVerse &&
        other.numberVerseEnd == numberVerseEnd &&
        mapEquals(other.data, data);
  }

  @override
  int get hashCode {
    return idBook.hashCode ^
        idChapter.hashCode ^
        abrevVersion.hashCode ^
        numberVerse.hashCode ^
        numberVerseEnd.hashCode ^
        data.hashCode;
  }
}
