import 'dart:convert';

class InfoHotfix {
  final Map<String, dynamic> description;
  final String urlLink;
  final int version;
  final DateTime date;
  bool executed;

  InfoHotfix({
    required this.description,
    required this.urlLink,
    required this.version,
    required this.date,

    ///when all hotfix are executed
    this.executed = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'urlLink': urlLink,
      'version': version,
      'date': date.toIso8601String(), //use .parse on FromMap
      'executed': executed,
    };
  }

  factory InfoHotfix.fromMap(Map<String, dynamic> map) {
    return InfoHotfix(
      description: Map<String, dynamic>.from((map['description'] as Map<String, dynamic>)),
      urlLink: map['urlLink'] as String,
      version: map['version'] as int,
      date: DateTime.parse(map['date']), //use toIso8601String on toMap
      executed: map['executed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoHotfix.fromJson(String source) => InfoHotfix.fromMap(json.decode(source) as Map<String, dynamic>);
}
