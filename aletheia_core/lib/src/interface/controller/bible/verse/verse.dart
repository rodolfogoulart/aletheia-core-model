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
  ///INTERNAL USE ONLY
  Future<List<VerseView>> getVerseData({
    required List<VerseCore> verses,
    // required Book book,
    // required List<BibleVersion> bibleVersion,
  });

  Future<List<VerseView>> getChapterFromAllVersions({
    required int bookId,
    required List<int> bibleVersionIds,
    required int chapter,
    int? defaultLexicoVersionId,
  });

  Future<List<VerseView>> getChapterFromSingleVersion({
    required int bookId,
    required int bibleVersionId,
    required int chapter,
    int? defaultLexicoVersionId,
  });

  Future<List<VerseView>> getReference({
    required Reference reference,
    required int bibleVersionId,
    int? defaultLexicoVersionId,
  });

  // Future<List<VerseCrossReference>> getCrossReferenceFromVerse({
  //   required BookView book,
  //   required BibleVersion bibleVersion,
  //   // required int chapter,
  //   required VerseView verse,
  // });

  Future<int> setVerse({
    required VerseCore verse,
    int bibleVersionId = 0,
    int bookId = 0,
  });

  Future<int> updateVerse({required VerseCore verse});

  Future<List<VerseView>> getVerse({
    required int bibleVersionId,
    required int bookId,
    required int chapter,
    required int verse,
  });

  /// Get the number of verses in a chapter of a specific version
  ///
  /// if version is not relevant, try to use [getNumberVersesOnChapter]
  Future<int> getVerseCountFromBookChapter({
    required int bookId,
    required int chapter,
    required int bibleVersionId,
  });

  /// Get verses that contain the lexico
  ///
  /// `idLexico` is the id of the lexico start with G or H (G for greek and H for hebrew)
  ///
  /// `idBibleVersion` is the id of the bible version
  ///
  /// `return` a list of VerseView that contain the lexico
  ///
  Future<List<VerseView>> getVersesByLexico({
    required String lexicoId,
    required int bibleVersionId,
  });

  /// Get the number of verses in a chapter
  ///
  Future<int> getNumberVersesOnChapter({
    required int bookId,
    required int chapter,
  });
}
