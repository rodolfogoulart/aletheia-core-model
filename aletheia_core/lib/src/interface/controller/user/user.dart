import 'package:aletheia_core/aletheia_core_interface_controller.dart';

abstract class InterfaceControllerUser {
  InterfaceControllerUserVerse get verse;
  // InterfaceControllerUserHistorySearch get historySearch;
  InterfaceControllerUserNotes get notes;
  InterfaceControllerUserConfig get config;
  //v1.0.16
  InterfaceControllerUserChapter get chapter;
  //v1.0.16
  InterfaceControllerUserPericope get pericope;
  //v1.0.16
  InterfaceControllerUserTag get tag;
}
