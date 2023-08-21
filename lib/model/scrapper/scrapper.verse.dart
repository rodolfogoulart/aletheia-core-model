// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// ///verse of chapter
// class VerseScrapper {
//   ///type of content {title, verse}
//   Map<String, String> content;
//   String contentWithOutFormat;
//   List<String>? commentary;
//   List<String>? reference;
//   VerseScrapper({
//     required this.content,
//     required this.contentWithOutFormat,
//     this.commentary,
//     this.reference,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'content': content});
//     result.addAll({'contentWithOutFormat': contentWithOutFormat});
//     if (commentary != null) {
//       result.addAll({'commentary': commentary});
//     }
//     if (reference != null) {
//       result.addAll({'reference': reference});
//     }

//     return result;
//   }

//   factory VerseScrapper.fromMap(Map<String, dynamic> map) {
//     return VerseScrapper(
//       content: Map<String, String>.from(map['content']),
//       contentWithOutFormat: map['contentWithOutFormat'] ?? '',
//       commentary: List<String>.from(map['commentary']),
//       reference: List<String>.from(map['reference']),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory VerseScrapper.fromJson(String source) => VerseScrapper.fromMap(json.decode(source));

//   VerseScrapper copyWith({
//     Map<String, String>? content,
//     String? contentWithOutFormat,
//     List<String>? commentary,
//     List<String>? reference,
//   }) {
//     return VerseScrapper(
//       content: content ?? this.content,
//       contentWithOutFormat: contentWithOutFormat ?? this.contentWithOutFormat,
//       commentary: commentary ?? this.commentary,
//       reference: reference ?? this.reference,
//     );
//   }

//   @override
//   String toString() {
//     return 'VerseScrapper(content: $content, contentWithOutFormat: $contentWithOutFormat, commentary: $commentary, reference: $reference)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is VerseScrapper &&
//         mapEquals(other.content, content) &&
//         other.contentWithOutFormat == contentWithOutFormat &&
//         listEquals(other.commentary, commentary) &&
//         listEquals(other.reference, reference);
//   }

//   @override
//   int get hashCode {
//     return content.hashCode ^ contentWithOutFormat.hashCode ^ commentary.hashCode ^ reference.hashCode;
//   }
// }
