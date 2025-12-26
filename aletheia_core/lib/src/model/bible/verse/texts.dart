import 'dart:convert';

class AText {
  /// The actual text content
  ///
  /// use KEY [T]
  String text;

  /// Attributes of the text
  ///
  /// Use [TypeAttributes] map to store various attributes
  ///
  /// This is used to style the text
  ///
  /// use KEY [at]
  Map<String, dynamic>? attributes;
  AText({
    required this.text,
    this.attributes,
  });
  //getters
  int get length => text.length;
  bool get hasAttributes => attributes != null && attributes!.isNotEmpty;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    // result.addAll({'text': text});
    result.addAll({'T': text});
    if (attributes != null && attributes?.isNotEmpty == true) {
      // result.addAll({'attributes': attributes});
      result.addAll({'at': attributes});
    }

    return result;
  }

  factory AText.fromMap(Map<String, dynamic> map) {
    String text = '';
    try {
      text = map['T'] ?? map['text'] ?? '';
    } catch (e) {
      text = '';
    }
    Map<String, dynamic> attributes = {};
    try {
      attributes =
          Map<String, dynamic>.from(map['at'] ?? map['attributes'] ?? {});
    } catch (e) {
      attributes = {};
    }

    return AText(
      text: text,
      attributes: attributes.isNotEmpty ? attributes : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AText.fromJson(String source) => AText.fromMap(json.decode(source));

  AText copyWith({
    String? text,
    Map<String, dynamic>? attributes,
  }) {
    return AText(
      text: text ?? this.text,
      attributes: attributes ?? this.attributes,
    );
  }

  @override
  String toString() => 'ATexts(text: [$text], attributes: $attributes)';
}
