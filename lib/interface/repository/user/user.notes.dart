import 'package:aletheia_core_model/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserNotes {
  Future<List<UserNotes>> getAllUserNotes();

  Future<List<UserNotes>> getLastLimitUserNotes(int limit);

  Future<List<UserNotes>> getNotesContainsTitle(String title);

  Future<int> insertNotes(UserNotes userNotes);

  Future<int> updateNotes(UserNotes userNotes);

  Future<int> deleteNotes({required dynamic id});

  getNotes({int? idNote, int? idBook, int? numberChapter, int? numberVerse});
}
