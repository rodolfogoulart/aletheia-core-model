import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerUserPericope {
  ///v1.0.16
  ///
  ///getChapter
  ///
  ///To get the chapter and all the information related to it use
  ///```dart
  ///LocalControllerUserChapter().getChapter
  ///```
  ///
  ///LocalControllerUserChapter().getChapter(idBook: , numberChapter: ) will retrieve the chapter and all the information related to it, including the pericopes
  Future<UserChapter?> getChapter({
    required int idBook,
    required int numberChapter,
  });

  Future<List<Pericope>> getPericopes({required String idChapter});

  Future<UserChapter> addOrUpdatePericope({
    required Pericope pericope,
    required UserChapter userChapter,
  });

  Future<int> removePericope({required String uuid});
}
