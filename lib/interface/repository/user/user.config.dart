import 'package:aletheia_core_model/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserConfig {
  Future<R?> getConfig<R>(String key);

  Future<String?>? getConfigValue(String key);

  Future<OpenAIConfig?> getOpenAIConfig();

  Future<int> setTokenOpenAI({required OpenAIConfig openAiConfig});

  Future<int> updateTokenOpenAI({required OpenAIConfig openAi});

  Future<int> deleteOpenAIConfig();

  Future<GoogleServiceAccountCredentialsConfig?> getGoogleServiceAccountCredentialsConfig();

  Future<int> setGoogleServiceAccountCredentialsConfig({required GoogleServiceAccountCredentialsConfig credencial});

  Future<int> updateGoogleServiceAccountCredentialsConfig({required GoogleServiceAccountCredentialsConfig credencial});

  Future<int> deleteGoogleServiceAccountCredentialsConfig();

  Future<DeveloperAletheia?> getDeveloperConfig();

  Future<int> setDefaultLanguage({required String languageCode, String? countryCode});

  Future<String?> getDefaultLanguage();
}
