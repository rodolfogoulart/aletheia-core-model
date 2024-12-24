///type of database supported in this app to import
enum TypeDatabaseImport {
  //mybible.zone
  myBible$Bible,
  myBible$Commentaries,
  myBible$Crossreferences,
  myBible$Dictionary,
  myBible$StrongDictionary,
  //mySword
  mySword$Bible,
  mySword$Commentary,
}

enum TypeStatus {
  none,
  error,
  ok,
  inProgress,
  finished,
}

class ImportMessage {
  TypeStatus statusMessage;
  String message;
  ImportMessage({
    this.statusMessage = TypeStatus.inProgress,
    required this.message,
  });
}

class NodesTags {
  String tag;
  int start;
  int end;
  String? value;
  NodesTags({
    required this.tag,
    required this.start,
    required this.end,
    this.value,
  });
}

class RangeProgress {
  int total;
  int current;
  RangeProgress({
    required this.total,
    required this.current,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RangeProgress && other.total == total && other.current == current;
  }

  @override
  int get hashCode => total.hashCode ^ current.hashCode;
}

abstract class InterfaceControllerImport {
  import({required List<String> dbPath});

  Future<TypeStatus> importMyBibleModules(String pathBible, String? pathCommentaryFootNote, {required String fileBibleName});
}
