// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// import 'dart:convert';
// import 'dart:typed_data';

// class VerseAudio {
//   List<int> audioBytes;
//   String audioFormat;

//   VerseAudio({
//     required this.audioBytes,
//     required this.audioFormat,
//   });

//   factory VerseAudio.fromMap(Map<String, dynamic> json) => VerseAudio(
//         audioBytes: List<int>.from(json['audioBytes']),
//         audioFormat: json['audioFormat'],
//       );

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'audioBytes': audioBytes});
//     result.addAll({'audioFormat': audioFormat});
//     return result;
//   }

//   String toJson() => json.encode(toMap());

//   factory VerseAudio.fromJson(String source) =>
//       VerseAudio.fromMap(json.decode(source) as Map<String, dynamic>);
// }

/// Represents audio data for a Bible verse
class VerseAudio {
  final String audioBase64;
  final Transcription transcription;
  VerseAudio({
    required this.audioBase64,
    required this.transcription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'audioBase64': audioBase64,
      'transcription': transcription.toMap(),
    };
  }

  factory VerseAudio.fromMap(Map<String, dynamic> map) {
    return VerseAudio(
      audioBase64:
          map['audioBase64'] != null ? map['audioBase64'] as String : '',
      transcription:
          Transcription.fromMap(map['transcription'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VerseAudio.fromJson(String source) =>
      VerseAudio.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// Represents the transcription of audio data
class Transcription {
  final String originalText;
  final String normalizedText;
  final List<WordTimestamp> words;
  final double? confidenceScore;

  final String? pedagogicalText;
  final String? readingMode;

  Transcription({
    required this.originalText,
    required this.normalizedText,
    required this.words,
    this.confidenceScore,
    this.pedagogicalText,
    this.readingMode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'originalText': originalText,
      'normalizedText': normalizedText,
      'words': words.map((x) => x.toMap()).toList(),
      'confidenceScore': confidenceScore,
      'pedagogicalText': pedagogicalText,
      'readingMode': readingMode,
    };
  }

  factory Transcription.fromMap(Map<String, dynamic> map) {
    return Transcription(
      originalText: map['originalText'] as String,
      normalizedText: map['normalizedText'] as String,
      words: List<WordTimestamp>.from(
        (map['words'] as List<dynamic>).map<WordTimestamp>(
          (x) => WordTimestamp.fromMap(x as Map<String, dynamic>),
        ),
      ),
      confidenceScore: map['confidenceScore'] != null
          ? map['confidenceScore'] as double
          : null,
      pedagogicalText: map['pedagogicalText'] != null
          ? map['pedagogicalText'] as String
          : null,
      readingMode:
          map['readingMode'] != null ? map['readingMode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transcription.fromJson(String source) =>
      Transcription.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// Represents the timestamp information for a word in the transcription
class WordTimestamp {
  final String word;
  final double start;
  final double end;
  final int charStart;
  final int charEnd;
  final String? originalWord;
  final bool aligned;

  WordTimestamp({
    required this.word,
    required this.start,
    required this.end,
    required this.charStart,
    required this.charEnd,
    this.originalWord,
    this.aligned = true,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'word': word,
      'start': start,
      'end': end,
      'charStart': charStart,
      'charEnd': charEnd,
      'originalWord': originalWord,
      'aligned': aligned,
    };
  }

  factory WordTimestamp.fromMap(Map<String, dynamic> map) {
    return WordTimestamp(
      word: map['word'] as String,
      start: map['start'] as double,
      end: map['end'] as double,
      charStart: map['charStart'] as int,
      charEnd: map['charEnd'] as int,
      originalWord:
          map['originalWord'] != null ? map['originalWord'] as String : null,
      aligned: map['aligned'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordTimestamp.fromJson(String source) =>
      WordTimestamp.fromMap(json.decode(source) as Map<String, dynamic>);
}
