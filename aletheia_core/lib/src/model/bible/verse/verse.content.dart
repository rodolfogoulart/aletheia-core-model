// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'referece.dart';

///[TypeAttributes] enum to style the text
enum TypeAttributes {
  bold,
  italic,
  underline,
  //add on version 1.0.12
  underlineColor,
  underlineThickness,
  underlineStyle,

  ///for the color of the text
  color,

  ///background color
  backgroundColor,

  ///Jesus words get special color
  jesuswords,

  ///+[number] to default font size
  fontSize,

  ///for the words that are highlighted by the user
  highlight,

  ///used for the map, more in case of error
  other,
  ;

  const TypeAttributes();

  ///used on Dart Class Generation
  toMap() {
    return name;
  }

  ///used on Dart Class Generation
  factory TypeAttributes.fromMap(dynamic value) {
    try {
      return TypeAttributes.values.byName(value);
    } catch (e) {
      return TypeAttributes.other;
    }
  }
}

extension TypeAttributesExtension on TypeAttributes {
  bool get isBold => this == TypeAttributes.bold;
  bool get isItalic => this == TypeAttributes.italic;
  bool get isUnderline => this == TypeAttributes.underline;
  bool get isUnderlineColor => this == TypeAttributes.underlineColor;
  bool get isUnderlineThickness => this == TypeAttributes.underlineThickness;
  bool get isUnderlineStyle => this == TypeAttributes.underlineStyle;
  bool get isColor => this == TypeAttributes.color;
  bool get isBackgroundColor => this == TypeAttributes.backgroundColor;
  bool get isJesusWords => this == TypeAttributes.jesuswords;
  bool get isFontSize => this == TypeAttributes.fontSize;
  bool get isHighlight => this == TypeAttributes.highlight;
  bool get isOther => this == TypeAttributes.other;
}

enum TypeContent {
  title,
  verse,
  ;

  const TypeContent();

  ///used on Dart Class Generation
  toMap({bool reduced = false}) {
    if (reduced) {
      return name.substring(0, 1);
    }
    return name;
  }

  ///used on Dart Class Generation
  factory TypeContent.fromMap(dynamic value) {
    //check for reduced version 06/05/2024
    if (value is String) {
      switch (value) {
        case 't':
          return TypeContent.title;
        case 'v':
          return TypeContent.verse;
        default:
          return TypeContent.values.byName(value);
      }
    } else {
      return TypeContent.values.byName(value);
    }
  }
}

extension TypeContentExtension on TypeContent {
  bool get isTitle => this == TypeContent.title;
  bool get isVerse => this == TypeContent.verse;
}

@Deprecated('will be removed')
class SubText {
  String text;
  Map<String, dynamic>? attributes;
  SubText({
    required this.text,
    this.attributes,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'text': text});
    if (attributes != null) {
      result.addAll({'attributes': attributes});
    }

    return result;
  }

  factory SubText.fromMap(Map<String, dynamic> map) {
    return SubText(
      text: map['text'] ?? '',
      attributes: Map<String, dynamic>.from(map['attributes'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubText.fromJson(String source) =>
      SubText.fromMap(json.decode(source));

  SubText copyWith({
    String? text,
    Map<String, dynamic>? attributes,
  }) {
    return SubText(
      text: text ?? this.text,
      attributes: attributes ?? this.attributes,
    );
  }

  @override
  String toString() => 'SubText(text: $text, attributes: $attributes)';
}

///*when Generated JSON Serialization, change the key to refer the variable
class Content {
  ///use KEY [sq]
  int seq; //sq

  ///to the text have breakline need to have \n with the text
  ///
  ///use KEY [T]
  String text; //T

  ///aways use
  ///
  ///toMap => result.addAll({'typeContent': typeContent.name});
  ///
  ///fromMap=> typeContent: TypeContent.values.byName(map['typeContent']),
  ///
  ///use KEY [tC]
  TypeContent typeContent; //tC
  ///use KEY [at]
  Map<String, dynamic>? attributes; //at
  ///use KEY [rS] KEY CHANGED TO>>>>> [rL]
  List<String>? refLexicos; //rS

  ///case the text has more attributes but refer the same **strong, anottation, comment, reference, etc...**
  ///
  ///each `[subText]` inherits the attributes from the `[text]` abouve, so if the [text] has the attribute `bold = true`, and the [subText] dont has bold, [subText] need to have the attribute `bold = false` to reverse
  @Deprecated('will be removed')
  List<SubText>? subText; //sT
  ///use KEY [an]
  String? anottation; //an
  ///use KEY [cm]
  String? comment; // cm
  //can be a list of references
  ///use KEY [rf]
  List<Reference>? reference; //rf
  ///use KEY [fn]
  String? footnote; //fn

  ///tag that represents the beginning of a paragraph
  ///
  ///the first letter will be bold
  ///
  ///use KEY [pr]
  bool? paragraph; //pr
  Content({
    required this.seq,
    required this.text,
    required this.typeContent,
    this.attributes,
    this.refLexicos,
    this.subText,
    this.anottation,
    this.comment,
    this.reference,
    this.footnote,
    this.paragraph,
  });

  ///*DON'T FORGET TO CHANGE THE NAME OF THE KEY
  ///
  ///use KEY [sq] to seq
  ///
  ///use KEY [T] to text
  ///
  ///use KEY [tC] to typeContent
  ///```dart
  /// result.addAll({'tC': typeContent.toMap(reduced: true)});
  ///```
  ///
  ///use KEY [at] to attributes
  ///
  ///use KEY [rS] to refLexicos
  ///
  ///
  ///use KEY [sT] to subText
  ///
  ///use KEY [an] to anottation
  ///
  ///use KEY [cm] to comment
  ///
  ///use KEY [rf] to reference
  ///
  ///use KEY [fn] to footnote
  ///
  ///use KEY [pr] to paragraph
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sq': seq});
    result.addAll({'T': text});
    result.addAll({'tC': typeContent.toMap(reduced: false)});
    if (attributes != null) {
      if (attributes?.isNotEmpty == true) {
        result.addAll({'at': attributes});
      }
    }
    if (refLexicos != null) {
      //todo: alterar para 'rL' em próxima versão
      result.addAll({'rS': refLexicos});
      // result.addAll({'rL': refLexicos});
    }
    if (subText != null) {
      if (subText?.isNotEmpty == true) {
        result.addAll({'sT': subText!.map((x) => x.toMap()).toList()});
      }
    }
    if (anottation != null) {
      result.addAll({'an': anottation});
    }
    if (comment != null) {
      result.addAll({'cm': comment});
    }
    if (reference != null) {
      if (reference!.isNotEmpty) {
        result.addAll({'rf': reference!.map((x) => x.toMap()).toList()});
      }
    }
    if (footnote != null) {
      result.addAll({'fn': footnote});
    }
    if (paragraph != null) {
      if (paragraph != false) {
        result.addAll({'pr': paragraph});
      }
    }

    return result;
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      seq: map['sq']?.toInt() ?? 0,
      text: map['T'] ?? '',
      typeContent: TypeContent.fromMap(map['tC']),
      attributes:
          map['at'] != null ? Map<String, dynamic>.from(map['at']) : null,
      //change the Key name to match the new name 06/05/2024
      //assume the refLexicos is rS (to older versions) or rL (to newer versions)
      // refLexicos: (map['rS'] != null) ? List<String>.from(map['rS']) : null,
      refLexicos: (map['rS'] != null || map['rL'] != null)
          ? List<String>.from(map['rS'] ?? map['rL'])
          : null,
      subText: map['sT'] != null
          ? List<SubText>.from(map['sT']?.map((x) => SubText.fromMap(x)))
          : null,
      anottation: map['an'],
      comment: map['cm'],
      reference: map['rf'] != null
          ? List<Reference>.from(map['rf']?.map((x) => Reference.fromMap(x)))
          : null,
      footnote: map['fn'],
      paragraph:
          map['pr'] != null ? (map['pr'] == false ? null : map['pr']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) =>
      Content.fromMap(json.decode(source));

  @override
  String toString() =>
      'Content(text:$text, attributes:$attributes, refLexicos:$refLexicos)';

  Content copyWith({
    int? seq,
    String? text,
    TypeContent? typeContent,
    Map<String, dynamic>? attributes,
    List<String>? refLexicos,
    // List<SubText>? subText,
    String? anottation,
    String? comment,
    List<Reference>? reference,
    String? footnote,
    bool? paragraph,
  }) {
    return Content(
      seq: seq ?? this.seq,
      text: text ?? this.text,
      typeContent: typeContent ?? this.typeContent,
      attributes: attributes ?? this.attributes,
      refLexicos: refLexicos ?? this.refLexicos,
      // subText: subText ?? this.subText,
      anottation: anottation ?? this.anottation,
      comment: comment ?? this.comment,
      reference: reference ?? this.reference,
      footnote: footnote ?? this.footnote,
      paragraph: paragraph ?? this.paragraph,
    );
  }
}
