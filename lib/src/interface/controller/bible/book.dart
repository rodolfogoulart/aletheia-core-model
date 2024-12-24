import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerBook {
  Future<List<Book>> get getAllBooks;
  Future<int> setBook(Book book);
}
