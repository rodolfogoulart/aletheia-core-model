import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerCrossReference {
  Future<List<VerseCrossReference>> getCrossReferenceFromVerse({
    required BookView book,
    required BibleVersion bibleVersion,
    // required int chapter,
    required VerseView verse,
    bool useIsolate = true,
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
