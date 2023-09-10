import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../bible/verse/referece.dart';

enum TypeNotes {
  devocional,
  message,
  study,
  commentary,
  other,
  ;

  const TypeNotes();

  toMap() {
    return name;
  }

  factory TypeNotes.fromMap(dynamic value) {
    try {
      return TypeNotes.values.byName(value);
    } catch (e) {
      return TypeNotes.other;
    }
  }
}

class UserNotes {
  int id;
  String? title;
  String? tags;
  String? notes;
  DateTime date;
  TypeNotes? type;
  Color? color;
  List<Reference>? references;
  UserNotes({
    required this.id,
    this.title,
    this.tags,
    this.notes,
    required this.date,
    this.type,
    this.color,
    this.references,
  });

  UserNotes copyWith({
    int? id,
    String? title,
    String? tags,
    String? notes,
    DateTime? date,
    TypeNotes? type,
    Color? color,
    List<Reference>? references,
  }) {
    return UserNotes(
      id: id ?? this.id,
      title: title ?? this.title,
      tags: tags ?? this.tags,
      notes: notes ?? this.notes,
      date: date ?? this.date,
      type: type ?? this.type,
      color: color ?? this.color,
      references: references ?? this.references,
    );
  }

  @override
  String toString() {
    return 'UserNotes(id: $id, title: $title, tags: $tags, notes: $notes, date: $date, type: $type, color: $color, references: $references)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserNotes &&
        other.id == id &&
        other.title == title &&
        other.tags == tags &&
        other.notes == notes &&
        other.date == date &&
        other.type == type &&
        other.color == color &&
        listEquals(other.references, references);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        tags.hashCode ^
        notes.hashCode ^
        date.hashCode ^
        type.hashCode ^
        color.hashCode ^
        references.hashCode;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (title != null) {
      result.addAll({'title': title});
    }
    if (tags != null) {
      result.addAll({'tags': tags});
    }
    if (notes != null) {
      result.addAll({'notes': notes});
    }
    result.addAll({'date': date.millisecondsSinceEpoch});
    if (type != null) {
      result.addAll({'type': type!.toMap()});
    }
    if (color != null) {
      result.addAll({'color': color!.value});
    }
    if (references != null) {
      result.addAll({'references': references!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory UserNotes.fromMap(Map<String, dynamic> map) {
    return UserNotes(
      id: map['id']?.toInt() ?? 0,
      title: map['title'],
      tags: map['tags'],
      notes: map['notes'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      type: map['type'] != null ? TypeNotes.fromMap(map['type']) : null,
      color: map['color'] != null ? Color(map['color']) : null,
      references: map['references'] != null ? List<Reference>.from(map['references']?.map((x) => Reference.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNotes.fromJson(String source) => UserNotes.fromMap(json.decode(source));
}
