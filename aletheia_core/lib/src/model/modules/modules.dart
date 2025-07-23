enum TypeModules {
  bible,
  commentary,
  dictionary,
  lexico,
  nlp,
  user,
  sync,
  ;

  toMap() {
    return name;
  }

  factory TypeModules.fromMap(value) {
    return TypeModules.values.byName(value);
  }
}

extension TypeModulesExtension on TypeModules {
  bool get isBible => this == TypeModules.bible;
  bool get isCommentary => this == TypeModules.commentary;
  bool get isDictionary => this == TypeModules.dictionary;
  bool get isLexico => this == TypeModules.lexico;
  bool get isNlp => this == TypeModules.nlp;
  bool get isUser => this == TypeModules.user;
  bool get isSync => this == TypeModules.sync;
}
