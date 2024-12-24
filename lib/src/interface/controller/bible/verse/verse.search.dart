import 'dart:async';

import 'package:aletheia_core_model/aletheia_core_model.dart';

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
  ///
  ///if now passed, the query will search using OR operator between all tokens.
  ///Returns a Future that resolves to a List of [VerseView] objects that match the search criteria.
  ///
  ///The search is case-insensitive.
  Future<List<SearchVerse>> searchVerse({
    required List<String> tokens,
    int? maxResults = 50,
    int pagination = 0,
    Division? division,
    Book? book,
    BibleVersion? bibleVersion,
    //used to the search on the AI
    required BibleVersion defaultbibleVersion,
    // bool containAllTokens = false,
    // required StreamController onCompute,
  });

  ///extract the verse content without format according the function on RichTextVerse use to addAtributes to the Content
  String getTextContentForHighlight(VerseView verse);

  ///Generate the positions of the token on the verse
  ///
  ///use to highlight the token
  ///
  ///[token] is a list of Words
  List<Position> getPositionTokenOnVerse(VerseView verse, List<String> tokens);
}
