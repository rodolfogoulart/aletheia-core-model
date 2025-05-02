import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerCrossReference {
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
