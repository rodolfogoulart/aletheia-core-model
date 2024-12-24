// ignore_for_file: constant_identifier_names

///Enum for WordDependencyEdge [Label]
enum TypeWordDependencyEdgeLabel {
  UNKNOWN('Unknown'),
  ABBREV('Abbreviation modifier'),
  ACOMP('Adjectival complement'),
  ADVCL('Adverbial clause modifier'),
  ADVMOD('Adverbial modifier'),
  AMOD('Adjectival modifier of an NP'),
  APPOS('Appositional modifier of an NP'),
  ATTR('Attribute dependent of a copular verb'),
  AUX('Auxiliary (non-main) verb'),
  AUXPASS('Passive auxiliary'),
  CC('Coordinating conjunction'),
  CCOMP('Clausal complement of a verb or adjective'),
  CONJ('Conjunct'),
  CSUBJ('Clausal subject'),
  CSUBJPASS('Clausal passive subject'),
  DEP('Dependency (unable to determine)'),
  DET('Determiner'),
  DISCOURSE('Discourse'),
  DOBJ('Direct object'),
  EXPL('Expletive'),
  GOESWITH('Goes with (part of a word in a text not well edited)'),
  IOBJ('Indirect object'),
  MARK('Marker (word introducing a subordinate clause)'),
  MWE('Multi-word expression'),
  MWV('Multi-word verbal expression'),
  NEG('Negation modifier'),
  NN('Noun compound modifier'),
  NPADVMOD('Noun phrase used as an adverbial modifier'),
  NSUBJ('Nominal subject'),
  NSUBJPASS('Passive nominal subject'),
  NUM('Numeric modifier of a noun'),
  NUMBER('Element of compound number'),
  P('Punctuatio("mark"),'),
  PARATAXIS('Parataxis relation'),
  PARTMOD('Participial modifier'),
  PCOMP('The complement of a preposition is a clause'),
  POBJ('Object of a preposition'),
  POSS('Possession modifier'),
  POSTNEG('Postverbal negative particle'),
  PRECOMP('Predicate complement'),
  PRECONJ('Preconjunt'),
  PREDET('Predeterminer'),
  PREF('Prefix'),
  PREP('Prepositional modifier'),
  PRONL('The relationship between a verb and verbal morpheme'),
  PRT('Particle'),
  PS('Associative or possessive marker'),
  QUANTMOD('Quantifier phrase modifier'),
  RCMOD('Relative clause modifier'),
  RCMODREL('Complementizer in relative clause'),
  RDROP('Ellipsis without a preceding predicate'),
  REF('Referent'),
  REMNANT('Remnant'),
  REPARANDUM('Reparandum'),
  ROOT('Root'),
  SNUM('Suffix specifying a unit of number'),
  SUFF('Suffix'),
  TMOD('Temporal modifier'),
  TOPIC('Topic marker'),
  VMOD('Clause headed by an infinite form of the verb that modifies noun'),
  VOCATIVE('Vocative'),
  XCOMP('Open clausal complement'),
  SUFFIX('Name suffix'),
  TITLE('Name title'),
  ADVPHMOD('Adverbial phrase modifier'),
  AUXCAUS('Causative auxiliary'),
  AUXVV('Helper auxiliary'),
  DTMOD('Rentaishi (Prenominal modifier)'),
  FOREIGN('Foreign words'),
  KW('Keyword'),
  LIST('List for chains of comparable items'),
  NOMC('Nominalized clause'),
  NOMCSUBJ('Nominalized clausal subject'),
  NOMCSUBJPASS('Nominalized clausal passive'),
  NUMC('Compound of numeric modifier'),
  COP('Copula'),
  DISLOCATED('Dislocated relation (for fronted/topicalized elements)'),
  ASP('Aspect marker'),
  GMOD('Genitive modifier'),
  GOBJ('Genitive object'),
  INFMOD('Infinitival modifier'),
  MES('Measure'),
  NCOMP('Nominal complement of a noun;');

  const TypeWordDependencyEdgeLabel(this._description);
  final String _description;

  String get description => _description;
  String get title => 'Category';
}

extension TypeWordDependencyEdgeLabelExtension on TypeWordDependencyEdgeLabel {
  bool get isUNKNOWN => this == TypeWordDependencyEdgeLabel.UNKNOWN;
  bool get isABBREV => this == TypeWordDependencyEdgeLabel.ABBREV;
  bool get isACOMP => this == TypeWordDependencyEdgeLabel.ACOMP;
  bool get isADVCL => this == TypeWordDependencyEdgeLabel.ADVCL;
  bool get isADVMOD => this == TypeWordDependencyEdgeLabel.ADVMOD;
  bool get isAMOD => this == TypeWordDependencyEdgeLabel.AMOD;
  bool get isAPPOS => this == TypeWordDependencyEdgeLabel.APPOS;
  bool get isATTR => this == TypeWordDependencyEdgeLabel.ATTR;
  bool get isAUX => this == TypeWordDependencyEdgeLabel.AUX;
  bool get isAUXPASS => this == TypeWordDependencyEdgeLabel.AUXPASS;
  bool get isCC => this == TypeWordDependencyEdgeLabel.CC;
  bool get isCCOMP => this == TypeWordDependencyEdgeLabel.CCOMP;
  bool get isCONJ => this == TypeWordDependencyEdgeLabel.CONJ;
  bool get isCSUBJ => this == TypeWordDependencyEdgeLabel.CSUBJ;
  bool get isCSUBJPASS => this == TypeWordDependencyEdgeLabel.CSUBJPASS;
  bool get isDEP => this == TypeWordDependencyEdgeLabel.DEP;
  bool get isDET => this == TypeWordDependencyEdgeLabel.DET;
  bool get isDISCOURSE => this == TypeWordDependencyEdgeLabel.DISCOURSE;
  bool get isDOBJ => this == TypeWordDependencyEdgeLabel.DOBJ;
  bool get isEXPL => this == TypeWordDependencyEdgeLabel.EXPL;
  bool get isGOESWITH => this == TypeWordDependencyEdgeLabel.GOESWITH;
  bool get isIOBJ => this == TypeWordDependencyEdgeLabel.IOBJ;
  bool get isMARK => this == TypeWordDependencyEdgeLabel.MARK;
  bool get isMWE => this == TypeWordDependencyEdgeLabel.MWE;
  bool get isMWV => this == TypeWordDependencyEdgeLabel.MWV;
  bool get isNEG => this == TypeWordDependencyEdgeLabel.NEG;
  bool get isNN => this == TypeWordDependencyEdgeLabel.NN;
  bool get isNPADVMOD => this == TypeWordDependencyEdgeLabel.NPADVMOD;
  bool get isNSUBJ => this == TypeWordDependencyEdgeLabel.NSUBJ;
  bool get isNSUBJPASS => this == TypeWordDependencyEdgeLabel.NSUBJPASS;
  bool get isNUM => this == TypeWordDependencyEdgeLabel.NUM;
  bool get isNUMBER => this == TypeWordDependencyEdgeLabel.NUMBER;
  bool get isP => this == TypeWordDependencyEdgeLabel.P;
  bool get isPARATAXIS => this == TypeWordDependencyEdgeLabel.PARATAXIS;
  bool get isPARTMOD => this == TypeWordDependencyEdgeLabel.PARTMOD;
  bool get isPCOMP => this == TypeWordDependencyEdgeLabel.PCOMP;
  bool get isPOBJ => this == TypeWordDependencyEdgeLabel.POBJ;
  bool get isPOSS => this == TypeWordDependencyEdgeLabel.POSS;
  bool get isPOSTNEG => this == TypeWordDependencyEdgeLabel.POSTNEG;
  bool get isPRECOMP => this == TypeWordDependencyEdgeLabel.PRECOMP;
  bool get isPRECONJ => this == TypeWordDependencyEdgeLabel.PRECONJ;
  bool get isPREDET => this == TypeWordDependencyEdgeLabel.PREDET;
  bool get isPREF => this == TypeWordDependencyEdgeLabel.PREF;
  bool get isPREP => this == TypeWordDependencyEdgeLabel.PREP;
  bool get isPRONL => this == TypeWordDependencyEdgeLabel.PRONL;
  bool get isPRT => this == TypeWordDependencyEdgeLabel.PRT;
  bool get isPS => this == TypeWordDependencyEdgeLabel.PS;
  bool get isQUANTMOD => this == TypeWordDependencyEdgeLabel.QUANTMOD;
  bool get isRCMOD => this == TypeWordDependencyEdgeLabel.RCMOD;
  bool get isRCMODREL => this == TypeWordDependencyEdgeLabel.RCMODREL;
  bool get isRDROP => this == TypeWordDependencyEdgeLabel.RDROP;
  bool get isREF => this == TypeWordDependencyEdgeLabel.REF;
  bool get isREMNANT => this == TypeWordDependencyEdgeLabel.REMNANT;
  bool get isREPARANDUM => this == TypeWordDependencyEdgeLabel.REPARANDUM;
  bool get isROOT => this == TypeWordDependencyEdgeLabel.ROOT;
  bool get isSNUM => this == TypeWordDependencyEdgeLabel.SNUM;
  bool get isSUFF => this == TypeWordDependencyEdgeLabel.SUFF;
  bool get isTMOD => this == TypeWordDependencyEdgeLabel.TMOD;
  bool get isTOPIC => this == TypeWordDependencyEdgeLabel.TOPIC;
  bool get isVMOD => this == TypeWordDependencyEdgeLabel.VMOD;
  bool get isVOCATIVE => this == TypeWordDependencyEdgeLabel.VOCATIVE;
  bool get isXCOMP => this == TypeWordDependencyEdgeLabel.XCOMP;
  bool get isSUFFIX => this == TypeWordDependencyEdgeLabel.SUFFIX;
  bool get isTITLE => this == TypeWordDependencyEdgeLabel.TITLE;
  bool get isADVPHMOD => this == TypeWordDependencyEdgeLabel.ADVPHMOD;
  bool get isAUXCAUS => this == TypeWordDependencyEdgeLabel.AUXCAUS;
  bool get isAUXVV => this == TypeWordDependencyEdgeLabel.AUXVV;
  bool get isDTMOD => this == TypeWordDependencyEdgeLabel.DTMOD;
  bool get isFOREIGN => this == TypeWordDependencyEdgeLabel.FOREIGN;
  bool get isKW => this == TypeWordDependencyEdgeLabel.KW;
  bool get isLIST => this == TypeWordDependencyEdgeLabel.LIST;
  bool get isNOMC => this == TypeWordDependencyEdgeLabel.NOMC;
  bool get isNOMCSUBJ => this == TypeWordDependencyEdgeLabel.NOMCSUBJ;
  bool get isNOMCSUBJPASS => this == TypeWordDependencyEdgeLabel.NOMCSUBJPASS;
  bool get isNUMC => this == TypeWordDependencyEdgeLabel.NUMC;
  bool get isCOP => this == TypeWordDependencyEdgeLabel.COP;
  bool get isDISLOCATED => this == TypeWordDependencyEdgeLabel.DISLOCATED;
  bool get isASP => this == TypeWordDependencyEdgeLabel.ASP;
  bool get isGMOD => this == TypeWordDependencyEdgeLabel.GMOD;
  bool get isGOBJ => this == TypeWordDependencyEdgeLabel.GOBJ;
  bool get isINFMOD => this == TypeWordDependencyEdgeLabel.INFMOD;
  bool get isMES => this == TypeWordDependencyEdgeLabel.MES;
  bool get isNCOMP => this == TypeWordDependencyEdgeLabel.NCOMP;
}
