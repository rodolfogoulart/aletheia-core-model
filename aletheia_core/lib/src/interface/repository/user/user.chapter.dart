import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserChapter {
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

  Future<UserChapter?> getChapterById({required uuid});
}
