import 'package:aletheia_core_model/model/user/history/user.history.search.dart';

abstract class InterfaceRepositoryUserHistorySearch {
  Future<List<UserHistorySearch>> getAllUserHistorySearch();

  Future<int> setHistorySearch({required int idBook, required int numberChapter, String? value, required DateTime date});

  Future<UserHistorySearch?>? getLastHistorySearch();

  Future<UserHistorySearch?>? getLastHistorySearchFrom(int id);
}
