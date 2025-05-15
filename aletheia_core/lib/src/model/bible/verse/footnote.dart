// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///Footnote class used on Verse Content
class Footnote {
  ///[id] is the id of the footnote
  ///
  ///use [n1] or [n2] or [n+number] to identify the footnote
  ///
  ///use key `fnId` to [id] on convert to map and from map
  ///
  final String id;

  ///[note] is the text of the footnote
  ///
  ///use key `fnN` to [note] on convert to map and from map
  final String note;

  Footnote({
    required this.id,
    required this.note,
  });

  Footnote copyWith({
    String? id,
    String? note,
  }) {
    return Footnote(
      id: id ?? this.id,
      note: note ?? this.note,
    );
  }

  ///*DON'T FORGET TO CHANGE THE NAME OF THE KEY
  ///
  ///use KEY [fnId] to id
  ///
  ///use KEY [fnN] to note
  ///
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fnId': id,
      'fnN': note,
    };
  }

  ///*DON'T FORGET TO CHANGE THE NAME OF THE KEY
  ///
  ///use KEY [fnId] to id
  ///
  ///use KEY [fnN] to note
  ///
  factory Footnote.fromMap(Map<String, dynamic> map) {
    try {
      return Footnote(
        id: map['fnId'] as String,
        note: map['fnN'] as String,
      );
    } catch (e) {
      throw Exception('Error parsing Footnote.fromMap: $e, map: $map');
    }
  }

  String toJson() => json.encode(toMap());

  factory Footnote.fromJson(String source) =>
      Footnote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Footnote(id: $id, note: $note)';

  @override
  bool operator ==(covariant Footnote other) {
    if (identical(this, other)) return true;

    return other.id == id && other.note == note;
  }

  @override
  int get hashCode => id.hashCode ^ note.hashCode;
}
