import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryVerseCrossReference {
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

  Future<List<ViewCrossReference>> selectCustomAllCrossReferencesFromVerse({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required int idBibleVersion,
    int? numberVerseEnd,
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
    Map<String, dynamic>? metaData,
  });
}
