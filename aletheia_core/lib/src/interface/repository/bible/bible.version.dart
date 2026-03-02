import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryBibleVersion {
  /// get all bible versions
  Future<List<BibleVersion>> get selectAllBibleVersions;

  ///v1.0.19 - add getBibleVersionbyId
  Future<BibleVersion?> getBibleVersionbyId(id);

  ///v1.0.19 - add getBibleVersionbyHash
  Future<BibleVersion?> getBibleVersionbyHash(hash);

  /// get bible version by abbreviation
  Future<BibleVersion?> getBibleVersion(String abrev);

  /// set bible version
  Future<int> setBibleVersion({
    required String name,
    required String abrev,
    required String language,
    String? copyright,
    bool? hasStrong,
    required String hash,
    required LanguageDirection languageDirection,
  });

  /// update bible version
  Future<bool> updateBibleVersion({
    String? name,
    String? abrev,
    String? language,
    String? copyright,
    bool? hasStrong,
    String? hash,
    LanguageDirection? languageDirection,

    ///where clause
    String? whereAbrev,

    ///where clause
    int? whereId,
  });
}
