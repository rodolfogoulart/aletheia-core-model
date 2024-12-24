import 'dart:convert';

import 'package:aletheia_core/src/model/modules/modules.dart';

enum HotfixType {
  insert,
  update,
  delete,
  select,
  statement,
  ;

  toMap() {
    return name;
  }

  factory HotfixType.fromMap(value) {
    return HotfixType.values.byName(value);
  }
}

extension HotfixTypeExtension on HotfixType {
  bool get isInsert => this == HotfixType.insert;
  bool get isUpdate => this == HotfixType.update;
  bool get isDelete => this == HotfixType.delete;
  bool get isSelect => this == HotfixType.select;
  bool get isStatement => this == HotfixType.statement;
}

// enum DatabaseHotfix {
//   bible,
//   lexico,
//   dictionary,
//   commentary,
//   user,
//   nlp,
//   ;

//   toMap() {
//     return name;
//   }

//   factory DatabaseHotfix.fromMap(value) {
//     return DatabaseHotfix.values.byName(value);
//   }
// }

// extension DatabaseHotfixExtension on DatabaseHotfix {
//   bool get isBible => this == DatabaseHotfix.bible;
//   bool get isLexico => this == DatabaseHotfix.lexico;
//   bool get isDictionary => this == DatabaseHotfix.dictionary;
//   bool get isCommentary => this == DatabaseHotfix.commentary;
//   bool get isUser => this == DatabaseHotfix.user;
//   bool get isNlp => this == DatabaseHotfix.nlp;
// }

class Hotfix {
  final dynamic id;
  final TypeModules database;
  final String sqlExec;
  final HotfixType type;
  final bool isExecuted;
  Hotfix({
    required this.id,
    required this.database,
    required this.sqlExec,
    required this.type,
    this.isExecuted = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'database': database.toMap(),
      'sqlExec': sqlExec,
      'type': type.toMap(),
      'isExecuted': isExecuted,
    };
  }

  factory Hotfix.fromMap(Map<String, dynamic> map) {
    return Hotfix(
      id: map['id'] ?? 0,
      database: TypeModules.fromMap(map['database']),
      sqlExec: map['sqlExec'] as String,
      type: HotfixType.fromMap(map['type']),
      isExecuted: (map['isExecuted'] ?? false) == 1 ? true : false,
    );
  }

  factory Hotfix.fromMapDatabase(Map<String, dynamic> map) {
    return Hotfix(
      id: map['id'] ?? 0,
      database: TypeModules.fromMap(map['database']),
      sqlExec: map['sql_exec'] as String,
      type: HotfixType.fromMap(map['type']),
      isExecuted: (map['is_executed'] ?? false) == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotfix.fromJson(String source) => Hotfix.fromMap(json.decode(source) as Map<String, dynamic>);
}
