import 'dart:async';

import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerVerse {
  Future<bool> isDatabaseEmpty();

  ///Get all data for VerseView
  ///
  ///`lexico`
  ///
  ///`user data`
  ///
  ///return VerseView
  Future<List<VerseView>> getVerseData(
      {required List<VerseCore> verses, required Book book, required List<BibleVersion> bibleVersion});

  Future<List<VerseView>> getChapterFromAllVersions(
      {required Book book,
      required List<BibleVersion> bibleVersion,
      required int numberChapter,
      LexicoVersion? defaultLexicoVersion});

  Future<List<VerseView>> getChapterFromSingleVersion(
      {required Book book, required BibleVersion bibleVersion, required int chapter, LexicoVersion? defaultLexicoVersion});

  Future<List<VerseView>> getReference(
      {required Reference reference, required BibleVersion bibleVersion, LexicoVersion? defaultLexicoVersion});

  Future<List<VerseCrossReference>> getCrossReferenceFromVerse({
    required BookView book,
    required BibleVersion bibleVersion,
    // required int chapter,
    required VerseView verse,
  });

  Future<int> setVerse(
      {Book? book, BibleVersion? bibleVersion, required VerseCore verse, int idBibleVersion = 0, int idBook = 0});

  Future<int> updateVerse({required VerseCore verse});

  Future<List<VerseView>> getVerse(
      {required int idBibleVersion, required int idBook, required int numberChapter, required int numberVerse});

  Future<int> getVerseCountFromBookChapter({required int idBook, required int numberChapter, required int idBibleVersion});

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

  //MARK: searchVerse
  ///Searches for verses that match the given tokens.
  ///
  ///The `tokens` parameter is a list of strings that represent the tokens to search for in the verse content.
  ///
  ///The `maxResults` parameter is an optional integer that specifies the maximum number of results to return.
  ///
  ///The `pagination` parameter is an optional integer that specifies the pagination value.
  ///
  ///The `division` parameter is an optional [Division] object that represents the division of the book.
  ///
  ///The `book` parameter is an optional [Book] object that represents the book of the verse.
  ///
  ///The `bibleVersion` parameter is an optional [BibleVersion] object that represents the bible version.
  ///
  ///The `containAllTokens` parameter is an optional boolean that specifies whether all tokens should be found in the verse content.
  ///
  ///if now passed, the query will search using OR operator between all tokens.
  ///Returns a Future that resolves to a List of [VerseView] objects that match the search criteria.
  ///
  ///The search is case-insensitive.
  // Future<List<SearchVerse>> searchVerse({
  //   required List<String> tokens,
  //   int? maxResults = 50,
  //   int pagination = 0,
  //   Division? division,
  //   Book? book,
  //   BibleVersion? bibleVersion,
  //   required BibleVersion defaultbibleVersion,
  //   // bool containAllTokens = false,
  //   required StreamController onCompute,
  // });

  Future<List<VerseView>> getVersesByLexico({required String idLexico, required BibleVersion idBibleVersion});

  Future<int> getNumberVersesOnChapter({required idBook, required chapter});
}
