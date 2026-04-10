import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerAnalysis {
  /// Get the count of a word in the bible, with optional filters for book, chapter, and division.
  Future<List<CountWord>> getCountWord({
    required String word,
    required int idBibleVersion,
    int? idBook,
    int? numberChapter,
    Division? division,
    bool ignoreCase = false,
  });

  /// Get the total count of a word in the entire bible for a specific version.
  Future<int> getTotalCountWordInBible({
    required String word,
    required int idBibleVersion,
    bool ignoreCase = false,
  });
}
