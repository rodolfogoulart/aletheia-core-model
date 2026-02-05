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

  factory VerseAudio.fromJson(Map<String, dynamic> json) {
    return VerseAudio(
      audioBase64:
          json['audio_base64'] != null ? json['audio_base64'] as String : '',
      transcription:
          Transcription.fromJson(json['transcription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'audio_base64': audioBase64,
      'transcription': transcription.toJson(),
    };
  }
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

  factory Transcription.fromJson(Map<String, dynamic> json) {
    return Transcription(
      originalText: json['original_text'] as String,
      normalizedText: json['normalized_text'] as String,
      words: (json['words'] as List)
          .map((w) => WordTimestamp.fromJson(w as Map<String, dynamic>))
          .toList(),
      confidenceScore: json['confidence_score'] as double?,
      pedagogicalText: json['pedagogical_text'] as String?,
      readingMode: json['reading_mode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original_text': originalText,
      'normalized_text': normalizedText,
      'words': words.map((w) => w.toJson()).toList(),
      'confidence_score': confidenceScore,
      'pedagogical_text': pedagogicalText,
      'reading_mode': readingMode,
    };
  }
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

  factory WordTimestamp.fromJson(Map<String, dynamic> json) {
    return WordTimestamp(
      word: json['word'] as String,
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
      charStart: json['char_start'] as int,
      charEnd: json['char_end'] as int,
      originalWord: json['original_word'] as String?,
      aligned: json['aligned'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'start': start,
      'end': end,
      'char_start': charStart,
      'char_end': charEnd,
      'original_word': originalWord,
      'aligned': aligned,
    };
  }
}
