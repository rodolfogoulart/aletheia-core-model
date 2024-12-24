import 'package:aletheia_core_model/aletheia_core_model.dart';

abstract class InterfaceRepositoryUserTag {
  Future<Tags?> getTagByName({required String name});
  Future<List<Tags>> getAllTags({bool? active = true});
  Future<Tags> addTag({required Tags tag});
  Future<Tags> updateTag({required Tags tag});
}
