import 'dart:convert';

class AppliedUpdates {
  int version;
  String tableName;
  String type;
  String aboutUpdate;
  DateTime appliedAt;
  String log;
  String versionApp;

  AppliedUpdates({
    required this.tableName,
    required this.version,
    required this.type,
    required this.aboutUpdate,
    required this.appliedAt,
    required this.log,
    this.versionApp = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tableName': tableName,
      'version': version,
      'type': type,
      'aboutUpdate': aboutUpdate,
      //fazer o parse para toIso8601String porque o banco esta armazenando como TEXT
      'appliedAt': appliedAt.toIso8601String(),
      'log': log,
      'versionApp': versionApp,
    };
  }

  ///precisa ser o mesmo nome da coluna do banco, ou seja, tem que ser o mesmo nome do create table [UpgradeFunctions().createTableAppliedUpdates()]
  factory AppliedUpdates.fromMap(Map<String, dynamic> map) {
    return AppliedUpdates(
      tableName: map['tableName'] ?? map['table_name'] ?? '',
      version: map['version'] as int,
      type: map['type'] as String,
      aboutUpdate: map['aboutUpdate'] ?? map['about_update'] ?? '',
      appliedAt: DateTime.parse(map['appliedAt'] ?? map['applied_at']),
      log: map['log'] ?? '',
      versionApp: map['versionApp'] ?? map['version_app'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppliedUpdates.fromJson(String source) =>
      AppliedUpdates.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant AppliedUpdates other) {
    if (identical(this, other)) return true;

    return other.tableName == tableName &&
        other.version == version &&
        other.type == type &&
        other.aboutUpdate == aboutUpdate &&
        other.appliedAt == appliedAt &&
        other.log == log &&
        other.versionApp == versionApp;
  }

  @override
  int get hashCode {
    return tableName.hashCode ^
        version.hashCode ^
        type.hashCode ^
        aboutUpdate.hashCode ^
        appliedAt.hashCode ^
        log.hashCode ^
        versionApp.hashCode;
  }
}
