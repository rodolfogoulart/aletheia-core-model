import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HotfixLink {
  int version;
  List<String> url;
  String fileName;
  String description;
  int seqTotal;
  int seqCurrent;
  HotfixLink({
    required this.version,
    required this.url,
    required this.fileName,
    required this.description,
    this.seqTotal = 0,
    this.seqCurrent = -1,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'url': url,
      'fileName': fileName,
      'dataDescription': description,
      'seqTotal': seqTotal,
      'seqCurrent': seqCurrent,
    };
  }

  factory HotfixLink.fromMap(Map<String, dynamic> map) {
    return HotfixLink(
      version: map['version'] as int,
      url: List<String>.from(map['url']),
      fileName: map['fileName'] as String,
      description: map['dataDescription'] as String,
      seqTotal: map['seqTotal'] as int,
      seqCurrent: map['seqCurrent'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HotfixLink.fromJson(String source) => HotfixLink.fromMap(json.decode(source) as Map<String, dynamic>);
}
