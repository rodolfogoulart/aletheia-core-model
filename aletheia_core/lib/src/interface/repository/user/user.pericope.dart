import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserPericope {
  Future<UserChapter?> getChapter({
    required int idBook,
    required int numberChapter,
  });

  ///get the id of pericope from the tags
  Future<List> getIdPericopeByTags(List<Tags> tags);

  ///get the id of pericope from the reference
  ///
  ///**this is not searching on pericope.reference**

  Future<List> getIdPericopeFromReference(
      {required idBook, chapter, start, end});

  ///return the number of pericopes affected
  Future<int> updateJustPericopeIdUserNotesAdd(
      {required List idPericope, required idUserNotes});

  ///return the number of pericopes affected
  Future<int> updateJustPericopeIdUserNotesRemove(
      {required List idPericope, required idUserNotes});

  Future<Pericope?> getPericopesById({required int id});

  Future<List<Pericope>> getPericopes({required int idChapter});

  Future<UserChapter> addOrUpdatePericope({
    required Pericope pericope,
    required UserChapter userChapter,
  });

  Future<int> removePericope({required id});
}
