import 'package:aletheia_core/aletheia_core_interface_controller.dart';

abstract class InterfaceControllerBible {
  downloadModules();

  InterfaceControllerVerse get verse;
  InterfaceControllerBook get book;
  InterfaceControllerBibleVersion get bibleVersion;
  InterfaceControllerVerseSearch get searchVerse;
  InterfaceControllerCrossReference get crossReference;
}
