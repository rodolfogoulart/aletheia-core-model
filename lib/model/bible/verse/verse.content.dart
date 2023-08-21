import 'dart:convert';

import 'referece.dart';

enum TypeAttributes {
  bold,
  italic,
  underline,
  upperCase,
  // aligmentCenter,
  // aligmentLeft,
  // aligmentRight,
  color,
  backgroundColor,
  jesuswords,
  fontSize, //+[number] to default font size
  other,
  ;

  const TypeAttributes();

  toMap() {
    return name;
  }

  factory TypeAttributes.fromMap(dynamic value) {
    try {
      return TypeAttributes.values.byName(value);
    } catch (e) {
      return TypeAttributes.other;
    }
  }
}

enum TypeContent {
  title,
  verse,
  ;

  const TypeContent();

  toMap() {
    return name;
  }

  factory TypeContent.fromMap(dynamic value) {
    return TypeContent.values.byName(value);
  }
}

// class VerseContent_oldVersion {
//   int id;
//   int sequence;
//   List<TypeAttributes> typeFormat;
//   TypeContent typeContent;
//   String content;
//   String? idRefStrong;
//   Strong? strong;
//   VerseContent_oldVersion({
//     this.id = 0,
//     required this.sequence,
//     required this.typeFormat,
//     required this.typeContent,
//     required this.content,
//     this.idRefStrong,
//     this.strong,
//   });

//   Content toContent(VerseContent_oldVersion c) {
//     return Content(seq: c.sequence, text: c.content, type: c.typeContent);
//   }

//   factory VerseContent_oldVersion.fromContent(Content content) {
//     return VerseContent_oldVersion(
//       sequence: content.seq,
//       typeFormat: [],
//       typeContent: content.type,
//       content: content.text,
//       id: 0,
//     );
//   }

//   VerseContent_oldVersion copyWith({
//     int? id,
//     int? sequence,
//     List<TypeAttributes>? typeFormat,
//     TypeContent? typeContent,
//     String? content,
//     String? idRefStrong,
//     Strong? strong,
//   }) {
//     return VerseContent_oldVersion(
//       id: id ?? this.id,
//       sequence: sequence ?? this.sequence,
//       typeFormat: typeFormat ?? this.typeFormat,
//       typeContent: typeContent ?? this.typeContent,
//       content: content ?? this.content,
//       idRefStrong: idRefStrong ?? this.idRefStrong,
//       strong: strong ?? this.strong,
//     );
//   }

//   @override
//   String toString() {
//     return 'VerseContent(id: $id, sequence: $sequence, typeFormat: $typeFormat, typeContent: $typeContent, content: $content, idRefStrong: $idRefStrong, strong: $strong)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is VerseContent_oldVersion &&
//         other.id == id &&
//         other.sequence == sequence &&
//         listEquals(other.typeFormat, typeFormat) &&
//         other.typeContent == typeContent &&
//         other.content == content &&
//         other.idRefStrong == idRefStrong &&
//         other.strong == strong;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         sequence.hashCode ^
//         typeFormat.hashCode ^
//         typeContent.hashCode ^
//         content.hashCode ^
//         idRefStrong.hashCode ^
//         strong.hashCode;
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'id': id});
//     result.addAll({'sequence': sequence});
//     result.addAll({'typeFormat': typeFormat.map((x) => x.name).toList()});
//     result.addAll({'typeContent': typeContent.name});
//     result.addAll({'content': content});
//     if (idRefStrong != null) {
//       result.addAll({'idRefStrong': idRefStrong});
//     }
//     return result;
//   }

//   factory VerseContent_oldVersion.fromMap(Map<String, dynamic> map) {
//     return VerseContent_oldVersion(
//       id: map['id']?.toInt() ?? 0,
//       sequence: map['sequence']?.toInt() ?? 0,
//       typeFormat: List<TypeAttributes>.from(map['typeFormat']?.map((x) => TypeAttributes.values.byName(x))),
//       typeContent: TypeContent.values.byName(map['typeContent']),
//       content: map['content'] ?? '',
//       idRefStrong: map['idRefStrong'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory VerseContent_oldVersion.fromJson(String source) => VerseContent_oldVersion.fromMap(json.decode(source));
// }

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

  factory SubText.fromJson(String source) => SubText.fromMap(json.decode(source));

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

//when Generated JSON Serialization, change the tag name to refer the param
class Content {
  int seq; //sq

  ///to the text have breakline need to have \n with the text
  String text; //T

  ///aways use
  ///
  ///toMap => result.addAll({'typeContent': typeContent.name});
  ///
  ///fromMap=> typeContent: TypeContent.values.byName(map['typeContent']),
  TypeContent typeContent; //tC
  Map<String, dynamic>? attributes; //at
  List<String>? refLexicos; //rS

  ///case the text has more attributes but refer the same **strong, anottation, comment, reference, etc...**
  ///
  ///each `[subText]` inherits the attributes from the `[text]` abouve, so if the [text] has the attribute `bold = true`, and the [subText] dont has bold, [subText] need to have the attribute `bold = false` to reverse
  List<SubText>? subText; //sT
  String? anottation; //an
  String? comment; // cm
  //can be a list of references
  List<Reference>? reference; //rf
  String? footnote; //fn

  ///tag that represents the beginning of a paragraph
  ///
  ///the first letter will be bold
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

  ///change the name of the param
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sq': seq});
    result.addAll({'T': text});
    result.addAll({'tC': typeContent.name});
    if (attributes != null) {
      if (attributes?.isNotEmpty == true) {
        result.addAll({'at': attributes});
      }
    }
    if (refLexicos != null) {
      //todo: alterar para rL
      result.addAll({'rS': refLexicos});
    }
    if (subText != null) {
      result.addAll({'sT': subText!.map((x) => x.toMap()).toList()});
    }
    if (anottation != null) {
      result.addAll({'an': anottation});
    }
    if (comment != null) {
      result.addAll({'cm': comment});
    }
    if (reference != null) {
      result.addAll({'rf': reference!.map((x) => x.toMap()).toList()});
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
      typeContent: TypeContent.values.byName(map['tC']),
      attributes: map['at'] != null ? Map<String, dynamic>.from(map['at']) : null,
      refLexicos: map['rS'] != null ? List<String>.from(map['rS']) : null,
      subText: map['sT'] != null ? List<SubText>.from(map['sT']?.map((x) => SubText.fromMap(x))) : null,
      anottation: map['an'],
      comment: map['cm'],
      reference: map['rf'] != null ? List<Reference>.from(map['rf']?.map((x) => Reference.fromMap(x))) : null,
      footnote: map['fn'],
      paragraph: map['pr'] == false ? null : map['pr'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) => Content.fromMap(json.decode(source));

  @override
  String toString() => 'Content(text:$text, attributes:$attributes, refLexicos:$refLexicos)';
}
