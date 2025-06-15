import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerUserVerse {
  Future<List<UserVerse>> getUserVerse(
      {required int book, required int numberChapter, int? numberVerse});
  Future<UserVerse?> setVerseHighlight(
      {required VerseView verse, required int color});

  Future<bool> removeVerseHighlight({required VerseView verse});

  Future<UserVerse?> addNotesVerse(
      {required VerseView verse, required String notes});

  Future<bool> removeNotesVerse({required VerseView verse});

  Future<UserVerse?> setwordsHighlighted(
      {required int idBook,
      required int numberChapter,
      required int numberVerse,
      required int idBibleVersion,
      required int color,
      required int start,
      required int end});

  Future<int> removeWordsHighlighted(
      {required VerseView verse,
      required WordsHighlighted wordHighlightToRemove});

  ///add or remove reference to the user verse
  Future<UserVerse?> updateAddVerseReferences(
      {required int idBook,
      required int numberChapter,
      required int numberVerse,
      required List<Reference> reference});
}
