import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerDictionary {
  Future<List<Dictionary>> getDictionarys({int? id});

  /// Retrieves a list of dictionary words based on the provided dictionary ID and a word.
  /// If [equal] is true, it will return words that match exactly; otherwise, it may return partial matches.
  ///
  /// @param idDictionary The ID of the dictionary to search within.
  /// @param word The word to search for in the dictionary.
  /// @param equal A boolean indicating whether to match the word exactly or allow partial matches.
  ///
  /// Returns a Future that resolves to a list of DictionaryWord objects that match the criteria.
  ///
  Future<List<DictionaryWord>> getWord(
      {required int idDictionary, required String word, required bool equal});

  /// Retrieves a list of dictionary words based on the provided dictionary ID and a list of words.
  /// If [equal] is true, it will return words that match exactly; otherwise, it may return partial matches.
  ///
  /// @param idDictionary The ID of the dictionary to search within.
  /// @param words A list of words to search for in the dictionary.
  /// @param equal A boolean indicating whether to match words exactly or allow partial matches.
  ///
  /// Returns a Future that resolves to a list of DictionaryWord objects that match the criteria.
  ///
  Future<List<DictionaryWord>> getWords({
    required int idDictionary,
    required List<String> words,
    required bool equal,
  });

  Future<int> setDictionary({required Dictionary dictionary});

  Future<int> setDictionaryWord({required DictionaryWord dictionaryWord});
}
