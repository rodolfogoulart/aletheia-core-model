import 'dart:convert';

class DataSync {
  int version;
  String url;
  String dataDescription;

  DataSync({
    required this.version,
    required this.url,
    required this.dataDescription,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataSync && other.version == version && other.url == url && other.dataDescription == dataDescription;
  }

  @override
  int get hashCode => version.hashCode ^ url.hashCode ^ dataDescription.hashCode;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'version': version});
    result.addAll({'url': url});
    result.addAll({'dataDescription': dataDescription});

    return result;
  }

  factory DataSync.fromMap(Map<String, dynamic> map) {
    return DataSync(
      version: map['version']?.toInt() ?? 0,
      url: map['url'] ?? '',
      dataDescription: map['dataDescription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DataSync.fromJson(String source) => DataSync.fromMap(json.decode(source));
}
