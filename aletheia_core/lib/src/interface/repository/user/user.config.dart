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
}
