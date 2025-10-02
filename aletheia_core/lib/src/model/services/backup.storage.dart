import 'dart:convert';

class BackupStorage {
  ///aways store in iso8601 format
  final DateTime lastBackup;
  final String path;
  //device type and appHash
  final String device;
  final String appHash;
  BackupStorage({
    required this.lastBackup,
    required this.path,
    this.device = 'unknown',
    this.appHash = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //aways store in iso8601 format
      'lastBackup': lastBackup.toIso8601String(),
      'path': path,
      'device': device,
      'appHash': appHash,
    };
  }

  factory BackupStorage.fromMap(Map<String, dynamic> map) {
    //aways store in iso8601 format
    DateTime date = DateTime.parse(map['lastBackup']);

    return BackupStorage(
      lastBackup: date,
      path: map['path'] as String,
      device: map['device'] as String,
      appHash: map['appHash'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BackupStorage.fromJson(String source) =>
      BackupStorage.fromMap(json.decode(source) as Map<String, dynamic>);

  BackupStorage copyWith({
    DateTime? lastBackup,
    String? path,
    String? device,
    String? appHash,
  }) {
    return BackupStorage(
      lastBackup: lastBackup ?? this.lastBackup,
      path: path ?? this.path,
      device: device ?? this.device,
    );
  }

  @override
  String toString() =>
      'BackupStorage(lastBackup: $lastBackup, path: $path, device: $device)';

  @override
  bool operator ==(covariant BackupStorage other) {
    if (identical(this, other)) return true;

    return other.lastBackup == lastBackup &&
        other.path == path &&
        other.device == device &&
        other.appHash == appHash;
  }

  @override
  int get hashCode =>
      lastBackup.hashCode ^ path.hashCode ^ device.hashCode ^ appHash.hashCode;
}
