import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerLexico {
  Future<Lexico?> insertLexico(Lexico lexico);

  Future<Object> updateLexico(Lexico lexico);

  Future<List<Lexico>> getLexicoDictionary(
      {int? idLexicoVersion, String? refLexico});

  Future<int> deleteLexico(int id);

  Future<List<Lexico>> getManyLexicoDictionary(
      {required List<String> idRefLexico, int? idLexicoVersion});

  Future<List<LexicoVersion>> getLexicoVersion({int? id});

  Future<Lexico> getSingleLexicoDictionary({required String idRefLexico});

  Future<int> setLexicoDictionary({required Lexico lexicoDictionary});

  /// Get lexico by original word
  ///
  Future<List<Lexico>> getByOriginalWord(
      {required String originalWord, int? idLexicoVersion});
}
