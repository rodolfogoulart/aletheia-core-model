import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerNLP {
  // saveNlpChapter(
  //     {required String hashBibleVersion,
  //     required int idBook,
  //     required int numberChapter,
  //     required List<AnalizeGrammarVerse> analizeGrammarVerse,
  //     Sentiment? documentSentiment,
  //     List<Entity>? entities,
  //     List<Sentence>? sentences});

  // Future<NlpChapter?> getNlpChapter({
  //   required String hashBibleVersion,
  //   required int idBook,
  //   required int numberChapter,
  // });

  // List<AnalizeGrammarVerse> analizeGrammarToNlpChapter(
  //     List<AnalizeGrammar> data,
  //     List<VerseView> verses,
  //     List<int> offsetTokensVerse);

  /// Call for get NlpChapter from database or call Google Natural Language API
  ///
  /// Need to return NlpChapter and String
  Future<Map<String, dynamic>> getNlpOrcallGoogleNaturalLanguage({
    required String hashBibleVersion,
    required int idBook,
    required int numberChapter,

    ///if don't have NlpVerse on database, call Google Natural Language and save on database
    List<VerseView> verses = const [],
    bool saveCall = true,
  });
  //todo: refatorar talvez não incluir o type ServiceAccountCredentials
  /// Get credentials for Google Service Account
  ///
  /// Need to return GoogleServiceAccountCredentialsConfig as a interface of ServiceAccountCredentials (google.api.auth)
  Future<GoogleServiceAccountCredentialsConfig>
      get credentialsGoogleServiceAccount;

  // Future<AnalizeText> callGoogleNaturalLanguage(
  //     {required String text, String? language});
}
