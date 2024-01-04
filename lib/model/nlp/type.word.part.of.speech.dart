// ignore_for_file: constant_identifier_names

enum TypeAspect {
  ASPECT_UNKNOWN('Aspect is not applicable in the analyzed language or is not predicted.'),
  PERFECTIVE('Perfective'),
  IMPERFECTIVE('Imperfective'),
  PROGRESSIVE('Progressive');

  const TypeAspect(this._description);
  final String _description;
  String get description => _description;
}

enum TypeCase {
  CASE_UNKNOWN('Case is not applicable in the analyzed language or is not predicted'),
  ACCUSATIVE('Accusative'),
  ADVERBIAL('Adverbial'),
  COMPLEMENTIVE('Complementive'),
  DATIVE('Dative'),
  GENITIVE('Genitive'),
  INSTRUMENTAL('Instrumental'),
  LOCATIVE('Locative'),
  NOMINATIVE('Nominative'),
  OBLIQUE('Oblique'),
  PARTITIVE('Partitive'),
  PREPOSITIONAL('Prepositional'),
  REFLEXIVE_CASE('Reflexive'),
  RELATIVE_CASE('Relative'),
  VOCATIVE('Vocative');

  const TypeCase(this._description);
  final String _description;
  String get description => _description;
}

enum TypeForm {
  FORM_UNKNOWN('Form is not applicable in the analyzed language or is not predicted'),
  ADNOMIAL('Adnomial'),
  AUXILIARY('Auxiliary'),
  COMPLEMENTIZER('Complementizer'),
  FINAL_ENDING('Final ending'),
  GERUND('Gerund'),
  REALIS('Realis'),
  IRREALIS('Irrealis'),
  SHORT('Short form'),
  LONG('Long form'),
  ORDER('Order form'),
  SPECIFIC('Specific form');

  const TypeForm(this._description);
  final String _description;
  String get description => _description;
}

enum TypeMood {
  MOOD_UNKNOWN('Mood is not applicable in the analyzed language or is not predicted.'),
  CONDITIONAL_MOOD('Conditional'),
  IMPERATIVE('Imperative'),
  INDICATIVE('Indicative'),
  INTERROGATIVE('Interrogative'),
  JUSSIVE('Jussive'),
  SUBJUNCTIVE('Subjunctive');

  const TypeMood(this._description);
  final String _description;
  String get description => _description;
}

enum TypeGender {
  GENDER_UNKNOWN('Gender is not applicable in the analyzed language or is not predicted.'),
  FEMININE('Feminine'),
  MASCULINE('Masculine'),
  NEUTER('Neuter');

  const TypeGender(this._description);
  final String _description;
  String get description => _description;
}

enum TypeNumber {
  NUMBER_UNKNOWN('Number is not applicable in the analyzed language or is not predicted.'),
  SINGULAR('Singular'),
  PLURAL('Plural'),
  DUAL('Dual');

  const TypeNumber(this._description);
  final String _description;
  String get description => _description;
}

enum TypePerson {
  PERSON_UNKNOWN('Person is not applicable in the analyzed language or is not predicted.'),
  FIRST('First'),
  SECOND('Second'),
  THIRD('Third'),
  REFLEXIVE_PERSON('Reflexive');

  const TypePerson(this._description);
  final String _description;
  String get description => _description;
}

enum TypeProper {
  PROPER_UNKNOWN('Proper is not applicable in the analyzed language or is not predicted.'),
  PROPER('Proper'),
  NOT_PROPER('Not proper');

  const TypeProper(this._description);
  final String _description;
  String get description => _description;
}

enum TypeReciprocity {
  RECIPROCITY_UNKNOWN('Reciprocity is not applicable in the analyzed language or is not predicted.'),
  RECIPROCAL('Reciprocal'),
  NON_RECIPROCAL('Non-reciprocal');

  const TypeReciprocity(this._description);
  final String _description;
  String get description => _description;
}

enum TypeTag {
  UNKNOWN('Unknown'),
  ADJ('Adjective'),
  ADP('Adposition (preposition and postposition)'),
  ADV('Adverb'),
  CONJ('Conjunction'),
  DET('Determiner'),
  NOUN('Noun (common and proper)'),
  NUM('Cardinal number'),
  PRON('Pronoun'),
  PRT('Particle or other function word'),
  PUNCT('Punctuation'),
  VERB('Verb (all tenses and modes)'),
  X('Other: foreign words, typos, abbreviations'),
  AFFIX('Affix');

  const TypeTag(this._description);
  final String _description;
  String get description => _description;
}

enum TypeTense {
  TENSE_UNKNOWN('Tense is not applicable in the analyzed language or is not predicted.'),
  CONDITIONAL_TENSE('Conditional'),
  FUTURE('Future'),
  PAST('Past'),
  PRESENT('Present'),
  IMPERFECT('Imperfect'),
  PLUPERFECT('Pluperfect');

  const TypeTense(this._description);
  final String _description;
  String get description => _description;
}

enum TypeVoice {
  VOICE_UNKNOWN('Voice is not applicable in the analyzed language or is not predicted.'),
  ACTIVE('Active'),
  CAUSATIVE('Causative'),
  PASSIVE('Passive');

  const TypeVoice(this._description);
  final String _description;
  String get description => _description;
}
