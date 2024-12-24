import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryBibleVersionBooks {
  Future<List<BibleVersionBooks>> getAllBibleVersionBooks();

  Future<List<BibleVersionBooks>> getBibleVersionBooksFromVersion({
    required int idBibleVersion,
    required int? idBook,
  });

  Future<Future<int>> setBibleVersionBook({
    required int idBibleVersion,
    required int idBook,
    required int sequence,
    int? numberChapters,
    String? abrevTranslation,
    String? nameTranslation,
  });

  Future<int> updateBibleVersionBook({
    int? id,
    int? sequence,
    int? numberChapters,
    String? abrevTranslation,
    String? nameTranslation,
  });
}
