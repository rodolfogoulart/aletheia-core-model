import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserVerse {
  Future<List<UserVerse>> getVerse(
      {required int idBook, required int numberChapter, int? numberVerse});

  Future<int> updateAddVerseNotes({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required String? notes,
  });

  Future<int> updateVerseAddVerseHightLight(
      {required int idBook,
      required int numberChapter,
      required int numberVerse,
      required int colorVerseHighlighted});

  Future<int> updateVerseRemoveVerseHightLight(
      {required int idBook,
      required int numberChapter,
      required int numberVerse});

  Future<int> setVerseAddWordHightLighted({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required List<WordsHighlighted> wordsHighlighted,
    UserVerse? userVerseData,
  });

  Future<int> updateAddVerseReferences({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required List<Reference>? references,
  });
}
