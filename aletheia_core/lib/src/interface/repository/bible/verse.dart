import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryVerse {
  Future<List<VerseCore>> selectVersesFromAllOrSingleVersions(int idBook, List<int> idBibleVersion, int chapter);

  Future<int> getVerseCountFromBook({required int idBook, required int numberChapter, required int idBibleVersion});

  Future<bool> hasVerse({required int idBibleVersion, required int idBook, required int numberChapter, required int numberVerse});

  /// This method inserts a new verse into the database
  /// and returns an integer representing the ID of the newly added verse.
  Future<int> setVerse({
    required int idBibleVersion, // ID for the Bible version in which the verse belongs
    required int idBook, // ID for the book in which the verse belongs
    required int numberChapter, // The chapter number in which the verse belongs
    required int numberVerse, // The verse number
    required String contentWithOutFormat, // The actual text of the verse without format
    int? numberVerseEnd, //in case version bible has verses joined
    required String content, //the verse content with the format, sequence, strong, type
  });

  Future<int> updateVerse({
    required int id, // ID
    required String? contentWithOutFormat, // The actual text of the verse without format
    required String? content, //the verse content with the format, sequence, strong, type
    int? numberVerseEnd, //in case version bible has verses joined
  });

  Future<int> deleteVerse({required int id});

  Future<List<VerseView>> getVerse(
      {required int idBibleVersion,
      required int idBook,
      required int numberChapter,
      required int numberVerse,
      int? numberVerseEnd});

  Future<int> isDatabaseEmpty();

  /// Searches for verses that match the given tokens.
  ///
  /// * The `tokens` parameter is a list of strings that represent the tokens to search for in the verse content.
  ///
  /// * The `maxResults` parameter is an optional integer that specifies the maximum number of results to return.
  ///
  /// * The `pagination` parameter is an optional integer that specifies the pagination value.
  ///
  /// * The `division` parameter is an optional [Division] object that represents the division of the book.
  ///
  /// * The `book` parameter is an optional [Book] object that represents the book of the verse.
  ///
  /// * The `bibleVersion` parameter is an optional [BibleVersion] object that represents the bible version.
  ///
  /// * The `containAllTokens` parameter is an optional boolean that specifies whether all tokens should be found in the verse content.
  ///
  ///   * if now passed, the query will search using **OR** operator between all tokens.
  ///
  /// Returns a `Future` that resolves to a `List` of [VerseView] objects that match the search criteria.
  ///
  /// The search is case-insensitive.
  Future<List<VerseView>> searchVerse({
    required List<String> tokens,
    int? maxResults,
    int? pagination,
    int? divisionIndex,
    int? bookId,
    int? bibleVersionId,
    bool containAllTokens = false,
  });

  /// Returns the list of verses that belong to the given lexico
  ///
  /// * The `idLexico` parameter is the ID of the lexico.
  ///
  /// * The `idBibleVersion` parameter is the ID of the Bible version.
  Future<List<VerseView>> getVersesByLexico({required String idLexico, required int idBibleVersion});

  ///v1.0.16
  ///
  ///to get the number of verses on a book
  Future<int> getNumberVersesOnChapter({required idBook, required chapter});
}
