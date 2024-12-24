import 'package:aletheia_core_model/aletheia_core_model.dart';

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
  Future<List<dynamic>> getNotesFromPericope({required Pericope pericope, required UserChapter userChapter});

  Future<int> insertNotes(UserNotes userNotes);

  Future<int> updateNotes(UserNotes userNotes);

  Future<int> deleteNotes({required dynamic id});

  getNotes({int? idNote, int? idBook, int? numberChapter, int? numberVerse});
}
