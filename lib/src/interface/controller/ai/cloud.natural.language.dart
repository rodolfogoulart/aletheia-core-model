import 'package:aletheia_core_model/aletheia_core_model.dart';

abstract class InterfaceControllerNLP {
  saveNlpChapter(
      {required String hashBibleVersion,
      required int idBook,
      required int numberChapter,
      required List<AnalizeGrammarVerse> analizeGrammarVerse,
      Sentiment? documentSentiment,
      List<Entity>? entities,
      List<Sentence>? sentences});

  Future<NlpChapter?> getNlpChapter({
    required String hashBibleVersion,
    required int idBook,
    required int numberChapter,
  });

  List<AnalizeGrammarVerse> analizeGrammarToNlpChapter(
      List<AnalizeGrammar> data, List<VerseView> verses, List<int> offsetTokensVerse);

  Future<(NlpChapter?, String)> getNlpOrcallGoogleNaturalLanguage({
    required String hashBibleVersion,
    required int idBook,
    required int numberChapter,

    ///if don't have NlpVerse on database, call Google Natural Language and save on database
    List<VerseView> verses = const [],
    bool saveCall = true,
  });
  //todo: refatorar talvez não incluir o type ServiceAccountCredentials
  Future<(dynamic, GoogleServiceAccountCredentialsConfig)> get credentialsGoogleServiceAccount;

  Future<AnalizeText> callGoogleNaturalLanguage({required String text, String? language});
}
