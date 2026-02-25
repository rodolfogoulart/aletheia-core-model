import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerUserConfig {
  Future<OpenAIConfig?> getOpenAIConfig();

  Future<int> setOpenAIConfig({required OpenAIConfig openAi});

  Future<int> updateToken({required OpenAIConfig openAiConfig});
  Future<int> deleteOpenAIConfig();

  Future<GoogleServiceAccountCredentialsConfig?>
      getGoogleServiceAccountCredentialsConfig();

  Future<int> setGoogleServiceAccountCredentialsConfig(
      {required GoogleServiceAccountCredentialsConfig? credencial});

  Future<int> updateGoogleServiceAccountCredentialsConfig(
      {required GoogleServiceAccountCredentialsConfig credencial});

  Future<int> deleteGoogleServiceAccountCredentialsConfig();

  Future<DeveloperAletheia?> getDeveloperConfig();

  Future<int> setDefaultLanguage({
    required String languageCode,
    String? countryCode,
  });

  Future<List<String?>?> getDefaultLanguage();

  setDefaultLexico();
  getDefaultLexico();
  setDefaultDictionary();
  getDefaultDictionary();

  ///Gemini project API key
  ///
  ///generate your api key here:
  ///https://aistudio.google.com/app/apikey
  ///
  Future<GeminiApiConfig?> getGenerativeLanguageClientAPIKey();

  ///Gemini project API key
  ///
  ///generate your api key here:
  ///https://aistudio.google.com/app/apikey
  ///
  Future<int> setGenerativeLanguageClientAPIKey(
      {required GeminiApiConfig? value});

  ///Gemini project API key
  ///
  ///generate your api key here:
  ///https://aistudio.google.com/app/apikey
  ///
  Future<int> updateGenerativeLanguageClientAPIKey(
      {required GeminiApiConfig? value});

  ///Gemini project API key
  ///
  ///generate your api key here:
  ///https://aistudio.google.com/app/apikey
  ///
  Future<int> deleteGenerativeLanguageClientAPIKey();

  /// Get the default Bible versions for comparison
  ///
  /// Returns a list of hash of Bible version identifiers or null if not set
  Future<List<String>?> getDefaultCompareBibleVersions();

  /// Set the default Bible versions for comparison
  ///
  /// Accepts a list of hash of Bible version identifiers and returns true if the operation was successful
  Future<bool> setDefaultCompareBibleVersions({required List<String> versions});
}
