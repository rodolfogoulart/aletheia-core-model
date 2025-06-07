import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerUserNotes {
  Future<List<UserNotes>> getAllUserNotes(
      {String? idNote, int? idBook, int? numberChapter, int? numberVerse});

  ///set note
  ///
  ///insert if no [id] is provided
  ///
  ///update if [id] is provided
  Future<UserNotes> setNotes({
    ///v1.0.18 - change to arg the [UserNotesLocal]
    required UserNotes note,
    // required List note,
    // TypeNotes? typeNote,
    // required String title,
    // required List<Tags> tags,
    // required DateTime date,
    // required int? colors,

    // ///if set [id] then update the note
    // int? id,
    // List<Reference>? references,
  });

  Future<int> deleteNote({required String uuid});
}
