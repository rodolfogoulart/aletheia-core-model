import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceRepositoryBook {
  Future<List<Book>> get selectAllBooks;

  Future<int> setBook({
    required int id,
    required String name,
    required String abrev,
    required Division division,
    required String literaryGenre,
  });
}
