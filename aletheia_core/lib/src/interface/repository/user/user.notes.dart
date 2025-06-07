import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserNotes {
  Future<List<UserNotes>> getAllUserNotes();

  Future<List<UserNotes>> getLastLimitUserNotes(int limit);

  Future<List<UserNotes>> getNotesContainsTitle(String title);

  ///v1.0.16
  ///return the notes id
  ///
  ///search for notes that has the scope of pericope as reference
  ///
  ///search for notes that has the same tags as pericope has
  Future<List<dynamic>> getNotesFromPericope(
      {required Pericope pericope, required UserChapter userChapter});

  Future<String> insertNotes(UserNotes userNotes);

  Future<String> updateNotes(UserNotes userNotes);

  Future<int> deleteNotes({required dynamic uuid});

  Future<List<UserNotes>> getNotes(
      {String? uuidNote, int? idBook, int? numberChapter, int? numberVerse});
}
