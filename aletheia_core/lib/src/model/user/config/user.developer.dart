import 'dart:convert';

class DeveloperAletheia {
  bool? isDeveloper;
  bool? isEditor;
  DeveloperAletheia({
    this.isDeveloper = false,
    this.isEditor,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (isDeveloper != null) {
      result.addAll({'isDeveloper': isDeveloper});
    }
    if (isEditor != null) {
      result.addAll({'isEditor': isEditor});
    }

    return result;
  }

  factory DeveloperAletheia.fromMap(Map<String, dynamic> map) {
    return DeveloperAletheia(
      isDeveloper: map['isDeveloper'],
      isEditor: map['isEditor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeveloperAletheia.fromJson(String source) =>
      DeveloperAletheia.fromMap(json.decode(source));
}
