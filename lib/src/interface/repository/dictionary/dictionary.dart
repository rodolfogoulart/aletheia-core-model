import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryDictionary {
  Future<List<Dictionary>> getDictionarys({int? id});

  Future<List<DictionaryWord>> getWord({required int idDictionary, required String word, required bool equal});

  Future<int> setDictionary({required Dictionary dictionary});

  Future<int> setDictionaryWord({required DictionaryWord dictionaryWord});
}
