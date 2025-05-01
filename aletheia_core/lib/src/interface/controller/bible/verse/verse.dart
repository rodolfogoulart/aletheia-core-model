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

  /// Get the number of verses in a chapter of a specific version
  ///
  /// if version is not relevant, try to use [getNumberVersesOnChapter]
  Future<int> getVerseCountFromBookChapter({required int idBook, required int numberChapter, required int idBibleVersion});

  /// set the cross reference for a verse
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

  /// Get verses that contain the lexico
  ///
  /// `idLexico` is the id of the lexico start with G or H (G for greek and H for hebrew)
  ///
  /// `idBibleVersion` is the id of the bible version
  ///
  /// `return` a list of VerseView that contain the lexico
  ///
  Future<List<VerseView>> getVersesByLexico({required String idLexico, required BibleVersion idBibleVersion});

  /// Get the number of verses in a chapter
  ///
  Future<int> getNumberVersesOnChapter({required idBook, required chapter});
}
