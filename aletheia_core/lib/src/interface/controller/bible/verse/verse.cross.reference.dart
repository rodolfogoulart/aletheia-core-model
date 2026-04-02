import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerCrossReference {
  /// Get the verses that has this cross reference as reference
  ///
  /// Example: Fp 1:2 don't have cross reference, but Fp 1:2 is referenced in others verses
  ///
  /// Return the list of verses, because the verse referenced will be compose by 1 verse.
  Future<List<VerseView>> getReferencesFromCrossReference({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required int idBibleVersion,
  });

  //v.10.19 - modify according http protocol (GET)
  Future<List<VerseCrossReference>> getCrossReferenceFromVerse({
    required int bookId,
    required int bibleVersionId,
    required int chapter,
    required int verse,
    required int? verseEnd,
    // required BookView book,
    // required BibleVersion bibleVersion,
    // required VerseView verse,
    // required int chapter,
    // bool useIsolate = true,
  });

  Future<int> setVerseCrossReference({
    required int idBook,
    required int numberVerse,
    required int numberChapter,
    //
    required int idBookReference,
    required int numberChapterReference,
    required int numberVerseReferenceBegin,
    required int? numberVerseReferenceEnd,
  });
}
