import 'package:aletheia_core_model/aletheia_core_model.dart';

abstract class InterfaceRepositoryLexico {
  Future<Lexico?> insertLexico(Lexico lexico);

  Future<List<Lexico?>> updateLexico(Lexico lexico);

  Future<List<Lexico>> getLexicoDictionary({int? id, String? refLexico});

  Future<List<Lexico>> getManyLexicoDictionary({
    required List<String> idRefLexico,
    required int? idLexicoVersion,
  });

  Future<List<LexicoVersion>> getLexicoVersion({int? id});

  Future<int> deleteLexico(int id);

  Future<int> setLexicoDictionary({required Lexico lexico});

  /// Returns the list of verses that belong to the given lexico
  Future<List<VerseView>> getVersesByLexico({required String idLexico, required int idBibleVersion});
}
