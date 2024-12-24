import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryNlpChapter {
  Future<int> insertNlpChapter({
    required String hashBibleVersion,
    required int idBook,
    required int numberChapter,
    required List<AnalizeGrammarVerse> analizeGrammarVerse,
    Sentiment? documentSentiment,
    List<Entity>? entities,
    List<Sentence>? sentences,
  });

  Future<NlpChapter?> getNlpChapter({
    required String hashBibleVersion,
    required int idBook,
    required int numberChapter,
  });
}
