// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core_model/aletheia_core_model.dart';

///v1.0.16
///
///Verse breakpoint for the chapter
///
///the user can add a breakpoint in the chapter
class ChapterBreakPoint {
  ///start of the breakpoint
  int start;

  ///end of the breakpoint
  int end;

  ///color of the breakpoint
  int color;

  ///title of the breakpoint
  String? title;

  ///description of the breakpoint
  String? description;

  ///references of the breakpoint
  List<Reference>? references;

  ChapterBreakPoint({
    required this.start,
    required this.end,
    required this.color,
    required this.title,
    required this.description,
    required this.references,
  });

  ChapterBreakPoint copyWith({
    int? start,
    int? end,
    int? color,
    String? title,
    String? description,
    List<Reference>? references,
  }) {
    return ChapterBreakPoint(
      start: start ?? this.start,
      end: end ?? this.end,
      color: color ?? this.color,
      title: title ?? this.title,
      description: description ?? this.description,
      references: references ?? this.references,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': start,
      'end': end,
      'color': color,
      'title': title,
      'description': description,
      'references': references?.map((x) => x.toMap()).toList(),
    };
  }

  factory ChapterBreakPoint.fromMap(Map<String, dynamic> map) {
    return ChapterBreakPoint(
      start: map['start'] as int,
      end: map['end'] as int,
      color: map['color'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      references: map['references'] != null
          ? List<Reference>.from(
              (map['references'] as List).map<Reference?>(
                (x) => Reference.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChapterBreakPoint.fromJson(String source) => ChapterBreakPoint.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChapterBreakPoint(start: $start, end: $end, color: $color, title: $title, description: $description, references: $references)';
  }

  @override
  bool operator ==(covariant ChapterBreakPoint other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.start == start &&
        other.end == end &&
        other.color == color &&
        other.title == title &&
        other.description == description &&
        listEquals(other.references, references);
  }

  @override
  int get hashCode {
    return start.hashCode ^ end.hashCode ^ color.hashCode ^ title.hashCode ^ description.hashCode ^ references.hashCode;
  }
}
