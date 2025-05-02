import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryBibleVersion {
  Future<List<BibleVersion>> get selectAllBibleVersions;

  Future<BibleVersion?> getBibleVersionbyId(id);
  Future<BibleVersion?> getBibleVersionbyHash(hash);
  Future<BibleVersion?> getBibleVersion(String abrev);

  Future<int> setBibleVersion(
      {required String name,
      required String abrev,
      required String language,
      String? copyright,
      bool? hasStrong,
      required String hash});

  Future<bool> updateBibleVersion({
    String? name,
    String? abrev,
    String? language,
    String? copyright,
    bool? hasStrong,
    String? hash,

    ///where clause
    String? whereAbrev,

    ///where clause
    int? whereId,
  });
}
