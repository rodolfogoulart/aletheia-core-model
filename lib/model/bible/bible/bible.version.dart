import 'dart:convert';

class BibleVersion {
  int id;
  String? language;
  String versionName;
  String versionAbrev;
  String? copyright;
  bool? hasStrong;
  BibleVersion({
    this.id = 0,
    this.language,
    required this.versionName,
    required this.versionAbrev,
    this.copyright,
    this.hasStrong = false,
  });

  BibleVersion copyWith({
    int? id,
    String? language,
    String? versionName,
    String? versionAbrev,
    String? copyright,
  }) {
    return BibleVersion(
      id: id ?? this.id,
      language: language ?? this.language,
      versionName: versionName ?? this.versionName,
      versionAbrev: versionAbrev ?? this.versionAbrev,
      copyright: copyright ?? this.copyright,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (language != null) {
      result.addAll({'language': language});
    }
    result.addAll({'versionName': versionName});
    result.addAll({'versionAbrev': versionAbrev});
    if (copyright != null) {
      result.addAll({'copyright': copyright});
    }
    if (hasStrong != null) {
      result.addAll({'hasStrong': hasStrong});
    }

    return result;
  }

  factory BibleVersion.fromMap(Map<String, dynamic> map) {
    return BibleVersion(
      id: map['id']?.toInt() ?? 0,
      language: map['language'],
      versionName: map['versionName'] ?? '',
      versionAbrev: map['versionAbrev'] ?? '',
      copyright: map['copyright'],
      hasStrong: map['hasStrong'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BibleVersion.fromJson(String source) => BibleVersion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BibleVersion(id: $id, language: $language, versionName: $versionName, versionAbrev: $versionAbrev, copyright: $copyright, hasStrong: $hasStrong)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BibleVersion &&
        other.id == id &&
        other.language == language &&
        other.versionName == versionName &&
        other.versionAbrev == versionAbrev &&
        other.copyright == copyright &&
        other.hasStrong == hasStrong;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        language.hashCode ^
        versionName.hashCode ^
        versionAbrev.hashCode ^
        copyright.hashCode ^
        hasStrong.hashCode;
  }
}
