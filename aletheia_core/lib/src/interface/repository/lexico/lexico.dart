import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryLexico {
  Future<Lexico?> insertLexico(Lexico lexico);

  Future<List<Lexico?>> updateLexico(Lexico lexico);

  Future<List<Lexico>> getLexicoDictionary(
      {int? idLexicoVersion, String? refLexico});

  Future<List<Lexico>> getManyLexicoDictionary({
    required List<String> idRefLexico,
    required int? idLexicoVersion,
  });

  Future<List<LexicoVersion>> getLexicoVersion({int? id});

  Future<int> deleteLexico(int id);

  Future<int> setLexicoDictionary({required Lexico lexico});

  /// Get lexico by original word
  ///
  Future<List<Lexico>> getByOriginalWord(
      {required String originalWord, int? idLexicoVersion});
}
