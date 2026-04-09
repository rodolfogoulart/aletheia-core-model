import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryAnalysis {
  Future<List<CountWord>> getCountWord({
    required String word,
    required int idBibleVersion,
    int? idBook,
    int? numberChapter,
    Division? division,
  });

  Future<int> getTotalCountWordInBible({
    required String word,
    required int idBibleVersion,
  });
}
