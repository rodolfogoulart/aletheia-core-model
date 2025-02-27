import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:aletheia_core/src/model/user/notes/user.notes.local.dart';
import 'package:aletheia_core/src/model/bible/verse/referece.dart';
import 'package:aletheia_core/src/model/user/tag/user.tag.dart';

enum TypeNotes {
  devocional,
  message,
  study,
  commentary,
  other,
  ;

  const TypeNotes();

  ///used on Dart Class Generation
  toMap() {
    return name;
  }

  ///used on Dart Class Generation
  factory TypeNotes.fromMap(dynamic value) {
    try {
      return TypeNotes.values.byName(value);
    } catch (e) {
      return TypeNotes.other;
    }
  }
}

extension TypeNotesExtension on TypeNotes {
  bool get isDevocional => this == TypeNotes.devocional;
  bool get isMessage => this == TypeNotes.message;
  bool get isStudy => this == TypeNotes.study;
  bool get isCommentary => this == TypeNotes.commentary;
  bool get isOther => this == TypeNotes.other;
}

class UserNotes {
  ///v1.0.18 - change to nullable
  int? id;
  String? title;

  ///v1.0.16 - change to Tags
  List<Tags>? tags;
  String? notes;
  DateTime date;
  TypeNotes? type;
  int? color;
  List<Reference>? references;

  ///v1.0.18 - refer where the user preached the note
  List<UserNotesLocal>? locals;
  UserNotes({
    this.id,
    this.title,
    this.tags,
    this.notes,
    required this.date,
    this.type,
    this.color,
    this.references,
    this.locals,
  });

  UserNotes copyWith({
    int? id,
    String? title,
    List<Tags>? tags,
    String? notes,
    DateTime? date,
    TypeNotes? type,
    int? color,
    List<Reference>? references,
    List<UserNotesLocal>? locals,
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
      locals: locals ?? this.locals,
    );
  }

  @override
  String toString() {
    return 'UserNotes(id: $id, title: $title, tags: $tags, notes: $notes, date: $date, type: $type, color: $color, references: $references, locals: $locals)';
  }

  @override
  bool operator ==(covariant UserNotes other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.title == title &&
        listEquals(other.tags, tags) &&
        other.notes == notes &&
        other.date == date &&
        other.type == type &&
        other.color == color &&
        listEquals(other.references, references) &&
        listEquals(other.locals, locals);
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
        locals.hashCode ^
        references.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'tags': tags?.map((x) => x.toMap()).toList(),
      'notes': notes,
      'date': date.millisecondsSinceEpoch,
      'type': type?.toMap(),
      'color': color,
      'references': references?.map((x) => x.toMap()).toList(),
      'locals': locals?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserNotes.fromMap(Map<String, dynamic> map) {
    return UserNotes(
      id: map['id'],
      title: map['title'] != null ? map['title'] as String : null,
      tags: map['tags'] != null
          ? List<Tags>.from(
              (map['tags'] as List).map<Tags?>(
                (x) => Tags.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      type: map['type'] != null ? TypeNotes.fromMap(map['type']) : null,
      color: map['color'] != null ? int.tryParse(map['color']) : null,
      references: map['references'] != null
          ? List<Reference>.from(
              (map['references']).map<Reference?>(
                (x) => Reference.fromMap(x),
              ),
            )
          : null,
      locals: map['locals'] != null
          ? List<UserNotesLocal>.from(
              (map['locals'] as List).map<UserNotesLocal?>(
                (x) => UserNotesLocal.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNotes.fromJson(String source) => UserNotes.fromMap(json.decode(source) as Map<String, dynamic>);
}
