import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerBibleVersion {
  Future<BibleVersion> getBibleVersionById(id);
  Future<BibleVersion> getBibleVersionByHash(String hash);
  Future<List<BibleVersion>> get getAllBibleVersions;
  Future<List<BibleVersionBooksView>> getAllBibleVersionBooksView();
  String getHashBibleVersion({required String abrev, required String language});

  Future<int> setBibleVersion(BibleVersion bibleVersion);
  Future<int> setBibleVersionBook(BibleVersionBooks bibleVersionBooks);

  Future<int> updateBibleVersionBook(BibleVersionBooks bibleVersionBooks);
  Future<List<BibleVersionBooks>> getBibleVersionBook({required int idBibleVersion, required int? idBook});
}
