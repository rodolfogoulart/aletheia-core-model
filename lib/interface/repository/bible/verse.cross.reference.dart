import 'package:aletheia_core_model/aletheia_core_model.dart';

abstract class InterfaceRepositoryVerseCrossReference {
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
  });
}
