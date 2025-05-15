// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

///Refer where the user preached the note
class UserNotesLocal {
  //can be preached many times in the same place
  List<DateTime> date;
  String place;
  String? obs;
  UserNotesLocal({
    required this.date,
    required this.place,
    required this.obs,
  });

  UserNotesLocal copyWith({
    List<DateTime>? date,
    String? place,
    String? obs,
  }) {
    return UserNotesLocal(
      date: date ?? this.date,
      place: place ?? this.place,
      obs: obs ?? this.obs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.map((x) => x.millisecondsSinceEpoch).toList(),
      'place': place,
      'obs': obs,
    };
  }

  factory UserNotesLocal.fromMap(Map<String, dynamic> map) {
    try {
      return UserNotesLocal(
        date: List<DateTime>.from(
          (map['date'] as List).map<DateTime>(
            (x) => DateTime.fromMillisecondsSinceEpoch(x),
          ),
        ),
        place: map['place'] as String,
        obs: map['obs'] != null ? map['obs'] as String : null,
      );
    } catch (e, stackTrace) {
      throw Exception('Error parsing UserNotesLocal.fromMap: $e\n$stackTrace');
    }
  }

  String toJson() => json.encode(toMap());

  factory UserNotesLocal.fromJson(String source) =>
      UserNotesLocal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserNotesLocal(date: $date, place: $place, obs: $obs)';

  @override
  bool operator ==(covariant UserNotesLocal other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.date, date) &&
        other.place == place &&
        other.obs == obs;
  }

  @override
  int get hashCode => date.hashCode ^ place.hashCode ^ obs.hashCode;
}
