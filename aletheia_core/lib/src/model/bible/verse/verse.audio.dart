import 'dart:convert';

/// Represents audio data for a Bible verse
class VerseAudio {
  List<int> audioBytes;
  String audioFormat;
  VerseAudio({
    required this.audioBytes,
    required this.audioFormat,
  });

  factory VerseAudio.fromMap(Map<String, dynamic> json) => VerseAudio(
        audioBytes: List<int>.from(json['audioBytes']),
        audioFormat: json['audioFormat'],
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'audioBytes': audioBytes});
    result.addAll({'audioFormat': audioFormat});
    return result;
  }

  String toJson() => json.encode(toMap());

  factory VerseAudio.fromJson(String source) =>
      VerseAudio.fromMap(json.decode(source) as Map<String, dynamic>);
}
