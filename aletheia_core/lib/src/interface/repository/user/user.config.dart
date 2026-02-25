import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserConfig {
  Future<R?> getConfig<R>(String key);

  Future<String?>? getConfigValue(String key);

  Future<OpenAIConfig?> getOpenAIConfig();

  Future<int> setTokenOpenAI({required OpenAIConfig openAiConfig});

  Future<int> updateTokenOpenAI({required OpenAIConfig openAi});

  Future<int> deleteOpenAIConfig();

  Future<GoogleServiceAccountCredentialsConfig?>
      getGoogleServiceAccountCredentialsConfig();

  Future<int> setGoogleServiceAccountCredentialsConfig(
      {required GoogleServiceAccountCredentialsConfig credencial});

  Future<int> updateGoogleServiceAccountCredentialsConfig(
      {required GoogleServiceAccountCredentialsConfig credencial});

  Future<int> deleteGoogleServiceAccountCredentialsConfig();

  Future<DeveloperAletheia?> getDeveloperConfig();

  Future<int> setDefaultLanguage(
      {required String languageCode, String? countryCode});

  Future<String?> getDefaultLanguage();

  //----------------------------------------------------------------------------
  // [Gemini Language Client Api Key]
  //----------------------------------------------------------------------------
  ///v1.0.16
  Future<GeminiApiConfig?> getGenerativeLanguageClientConfig();

  ///v1.0.16
  Future<int> setGenerativeLanguageClient({required GeminiApiConfig? value});

  ///v1.0.16
  Future<int> updateGenerativeLanguageClient({required GeminiApiConfig? value});

  ///v1.0.16
  Future<int> deleteGenerativeLanguageClientConfig();

  /// Get the default Bible versions for comparison
  ///
  /// Returns a list of hash of Bible version identifiers or null if not set
  Future<List<String>?> getDefaultCompareBibleVersions();

  /// Set the default Bible versions for comparison
  ///
  /// Accepts a list of hash of Bible version identifiers and returns true if the operation was successful
  Future<bool> setDefaultCompareBibleVersions({
    required List<String> versions,
  });
}
