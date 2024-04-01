import 'package:aletheia_core_model/aletheia_core_model.dart';

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

  /// This method returns a list of verses that match the given search tokens
  /// and the maximum number of results.
  ///
  /// The search is performed in the specified division, book and bibleVersion if provided.
  ///
  /// If no division or book or bibleVersion is provided, the search is performed in all divisions and all books and all bibleVersions.
  ///
  /// The search is case-insensitive.
  ///
  Future<List<VerseView>> searchVerse({
    required List<String> tokens,
    int? maxResults,
    int? pagination,
    Division? division,
    Book? book,
    BibleVersion? bibleVersion,
  });
}
