import 'package:aletheia_core_model/aletheia_core_model.dart';

abstract class InterfaceControllerUserChapter {
  ///v1.0.16
  ///
  ///getChapter
  ///
  ///this will get the chapter and all the information related to it
  ///
  ///@param idBook the id of the book
  ///
  ///@param numberChapter the number of the chapter
  ///
  ///@return the chapter or null if not found
  ///
  ///pericopes is on other table than chapter, so it needs to be retrieved separately
  Future<UserChapter?> getChapter({
    required int idBook,
    required int numberChapter,
  });

  Future<UserChapter> addChapter({
    required UserChapter userChapter,
  });

  Future<UserChapter?> updateChapter({
    required UserChapter userChapter,
  });

  Future<int> removeChapter({required int idBook, required int chapter});
}
