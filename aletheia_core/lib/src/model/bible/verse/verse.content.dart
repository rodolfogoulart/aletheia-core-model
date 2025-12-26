// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aletheia_core/src/model/bible/verse/footnote.dart';
import 'package:aletheia_core/src/model/bible/verse/texts.dart';

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

  ///for the words that are highlighted by the user with text color
  textColor,

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

///*when Generated JSON Serialization, change the key to refer the variable
class Content {
  ///use KEY [sq]
  int seq; //sq

  ///to the text have breakline need to have \n with the text
  ///
  ///use KEY [T]
  @Deprecated("use [texts] instead, this will be removed in future versions")
  String text; //T

  /// Helper to get the full text
  ///
  /// get full text including sub texts
  String get fullText => texts != null && texts!.isNotEmpty
      ? texts!.map((e) => e.text).join()
      : text;

  ///aways use
  ///
  ///toMap => result.addAll({'typeContent': typeContent.name});
  ///
  ///fromMap=> typeContent: TypeContent.values.byName(map['typeContent']),
  ///
  ///use KEY [tC]
  TypeContent typeContent; //tC

  /// attributes of the text (style, color, etc..)
  /// this will set a default style for the [texts] if they dont have their own style
  /// but if the [texts] have their own style, will override the parent [attributes]
  ///
  /// map of [TypeAttributes] with dynamic value
  ///
  /// use KEY [at]
  Map<String, dynamic>? attributes; //at

  ///Helper to check if has attributes
  bool get hasAttributes => attributes != null && attributes!.isNotEmpty;

  ///references to lexicos (strongs, etc..)
  ///
  ///use KEY [rS] KEY CHANGED TO>>>>> [rL]
  List<String>? refLexicos; //rS

  ///texts with formatting
  ///
  ///each `[texts]` inherits the attributes from the `[attributes]` abouve, so if the [attributes] has `bold = true`, and the [texts] dont has bold, [texts] need to have the attribute `bold = false` to reverse
  /// use KEY [Ts]
  List<AText>? texts; //Ts

  ///use KEY [an]
  String? anottation; //an

  ///use KEY [cm]
  String? comment; // cm

  /// list of references
  ///
  ///use KEY [rf]
  List<Reference>? reference; //rf

  ///use KEY [fn]
  ///
  ///v.1.0.19 change footnote to a list of footnotes
  List<Footnote>? footnote; //fn

  ///tag that represents the beginning of a paragraph
  ///
  ///the first letter will be bold
  ///
  ///use KEY [pr]
  bool? paragraph; //pr

  /// indentation level for the content
  ///
  ///use KEY [in]
  int? indentation;

  ///additional metadata for the content
  ///
  ///use KEY [md]
  Map<String, dynamic>? metadata;

  Content({
    required this.seq,
    @Deprecated("use [texts] instead, this will be removed in future versions")
    this.text = '',
    required this.typeContent,
    this.attributes,
    this.refLexicos,
    this.texts,
    this.anottation,
    this.comment,
    this.reference,
    this.footnote,
    this.paragraph,
    this.indentation,
    this.metadata,
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
  ///use KEY [Ts] to texts
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
  ///
  ///use KEY [in] to indentation
  ///
  ///use KEY [md] to metadata
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = <String, dynamic>{};

    result.addAll({'sq': seq});
    result.addAll({'T': text});
    result.addAll({'tC': typeContent.toMap(reduced: true)});
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
    if (texts != null) {
      if (texts?.isNotEmpty == true) {
        result.addAll({'Ts': texts!.map((x) => x.toMap()).toList()});
        //
        result.remove('T'); //remove the old key to avoid redundancy
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
      if (footnote!.isNotEmpty) {
        result.addAll({'fn': footnote!.map((x) => x.toMap()).toList()});
      }
    }
    if (paragraph != null) {
      if (paragraph != false) {
        result.addAll({'pr': paragraph});
      }
    }

    if (indentation != null) {
      if (indentation! > 0) {
        result.addAll({'in': indentation});
      }
    }

    if (metadata != null) {
      if (metadata!.isNotEmpty) {
        result.addAll({'md': metadata});
      }
    }
    // Clean null values
    result.removeWhere((key, value) => value == null);

    return result;
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    try {
      List<Footnote>? footnote;
      try {
        footnote = map['fn'] != null
            ? List<Footnote>.from(map['fn']?.map((x) => Footnote.fromMap(x)))
            : null;
      } catch (e) {
        footnote = null;
      }
      List<String>? refLexicos;
      try {
        refLexicos = (map['rS'] != null || map['rL'] != null)
            ? List<String>.from(map['rS'] ?? map['rL'])
            : null;
      } catch (e) {
        refLexicos = null;
      }
      List<AText>? texts;
      try {
        texts = map['Ts'] != null
            ? List<AText>.from(map['Ts']?.map((x) => AText.fromMap(x)))
            : null;
      } catch (e) {
        texts = null;
      }
      String text = '';
      try {
        text = map['T'] ?? '';
      } catch (e) {
        text = '';
      }
      Map<String, dynamic>? attributes;
      try {
        attributes =
            map['at'] != null ? Map<String, dynamic>.from(map['at']) : null;
      } catch (e) {
        attributes = null;
      }
      //Just in case the database is running on older version without texts
      if (texts == null || texts.isEmpty) {
        if (text.isNotEmpty) {
          texts = [
            AText(
              text: text,
              attributes: attributes,
            )
          ];
        }
      }

      List<Reference>? reference;
      try {
        reference = map['rf'] != null
            ? List<Reference>.from(map['rf']?.map((x) => Reference.fromMap(x)))
            : null;
      } catch (e) {
        reference = null;
      }

      Map<String, dynamic>? metadata;
      try {
        metadata =
            map['md'] != null ? Map<String, dynamic>.from(map['md']) : null;
      } catch (e) {
        metadata = null;
      }
      //
      return Content(
        seq: map['sq']?.toInt() ?? 0,
        text: text,
        typeContent: TypeContent.fromMap(map['tC']),
        attributes: attributes,
        //change the Key name to match the new name 06/05/2024
        //assume the refLexicos is rS (to older versions) or rL (to newer versions)
        // refLexicos: (map['rS'] != null) ? List<String>.from(map['rS']) : null,
        refLexicos: refLexicos,
        texts: texts,
        anottation: map['an'],
        comment: map['cm'],
        reference: reference,
        footnote: footnote,
        paragraph:
            map['pr'] != null ? (map['pr'] == false ? null : map['pr']) : null,
        indentation: map['in'] != null ? map['in'] as int : null,
        metadata: metadata,
      );
    } catch (e) {
      throw Exception('Error in Content.fromMap: $e\nMap: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) =>
      Content.fromMap(json.decode(source));

  @override
  String toString() =>
      'Content(text:$fullText, attributes:$attributes, refLexicos:$refLexicos)';

  Content copyWith({
    int? seq,
    String? text,
    TypeContent? typeContent,
    Map<String, dynamic>? attributes,
    List<String>? refLexicos,
    //
    List<AText>? texts,
    //
    String? anottation,
    String? comment,
    List<Reference>? reference,
    List<Footnote>? footnote,
    bool? paragraph,
    int? indentation,
    Map<String, dynamic>? metadata,
  }) {
    return Content(
      seq: seq ?? this.seq,
      text: text ?? this.text,
      typeContent: typeContent ?? this.typeContent,
      attributes: attributes ?? this.attributes,
      refLexicos: refLexicos ?? this.refLexicos,
      //
      texts: texts ?? this.texts,
      //
      anottation: anottation ?? this.anottation,
      comment: comment ?? this.comment,
      reference: reference ?? this.reference,
      footnote: footnote ?? this.footnote,
      paragraph: paragraph ?? this.paragraph,
      indentation: indentation ?? this.indentation,
      metadata: metadata ?? this.metadata,
    );
  }
}
