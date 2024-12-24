import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerUserTag {
  Future<Tags?> getTagByName({required String name});
  Future<List<Tags>> getAllTags({bool? active = true});
  Future<Tags> addTag({required Tags tag});
  Future<Tags> updateTag({required Tags tag});
}
