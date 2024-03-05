import 'package:aletheia_core_model/model/dictionary/dictionary.dart';
import 'package:aletheia_core_model/model/dictionary/dictionary.word.dart';

abstract class InterfaceRepositoryDictionary {
  Future<List<Dictionary>> getDictionarys({int? id});

  Future<List<DictionaryWord>> getWord({required int idDictionary, required String word, required bool equal});

  Future<int> setDictionary({required Dictionary dictionary});

  Future<int> setDictionaryWord({required DictionaryWord dictionaryWord});
}
