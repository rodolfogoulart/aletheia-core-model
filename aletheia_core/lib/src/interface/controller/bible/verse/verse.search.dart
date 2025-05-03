import 'dart:async';

import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerVerseSearch {
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
  ///The `defaultbibleVersion` parameter is required [BibleVersion] object that represents the default bible version, used to search on the AI
  ///
  ///The `containAllTokens` parameter is an optional boolean that specifies whether all tokens should be found in the verse content.
  ///if now passed, the query will search using OR operator between all tokens.
  ///
  ///
  ///Them `meiliSearchConfig` parameter is an optional [HybridSearchConfig] object that represents the MeiliSearch configuration for online search.
  ///
  ///Returns a Future that resolves to a [ResultSearch] containing the searchVerse and the metaData related to the search criteria.
  ///
  ///The search is case-insensitive for non online search.
  Future<ResultSearch> searchVerse({
    required String query,
    int? maxResults = 50,
    int pagination = 0,
    SearchFilter? filter,
    // Division? divisionIndex,
    // Book? bookIdToFilter,
    // BibleVersion? bibleVersionIdToFilter,
    //used to the search on the AI
    required int defaultBibleVersionId,
    // bool containAllTokens = false,
    // required StreamController onCompute,
    HybridSearchConfig? hybridSearchConfig,
  });

  ///extract the verse content without format according the function on RichTextVerse use to addAtributes to the Content
  // String getTextContentForHighlight(VerseView verse);

  ///Generate the positions of the token on the verse
  ///
  ///use to highlight the token
  ///
  ///[token] is a list of Words
  // List<Position> getPositionTokenOnVerse(VerseView verse, List<String> tokens);
}
