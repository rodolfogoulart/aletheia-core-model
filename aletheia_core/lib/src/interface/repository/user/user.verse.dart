import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserVerse {
  Future<List<UserVerse>> getVerse(
      {required int idBook, required int numberChapter, int? numberVerse});

  Future<String> updateAddVerseNotes({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required String? notes,
  });

  Future<String> updateVerseAddVerseHightLight(
      {required int idBook,
      required int numberChapter,
      required int numberVerse,
      required int colorVerseHighlighted});

  Future<String> updateVerseRemoveVerseHightLight(
      {required int idBook,
      required int numberChapter,
      required int numberVerse});

  Future<String> setVerseAddWordHightLighted({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required List<WordsHighlighted> wordsHighlighted,
    UserVerse? userVerseData,
  });

  Future<String> updateAddVerseReferences({
    required int idBook,
    required int numberChapter,
    required int numberVerse,
    required List<Reference>? references,
  });
}
