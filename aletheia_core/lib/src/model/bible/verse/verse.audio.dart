/// Represents audio data for a Bible verse
class VerseAudio {
  List<int> audioBytes;
  String audioFormat;
  VerseAudio({
    required this.audioBytes,
    required this.audioFormat,
  });
}
