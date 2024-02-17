// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

extension TypeAspectExtension on TypeAspect {
  bool get isUnknown => this == TypeAspect.ASPECT_UNKNOWN;
  bool get isPerfective => this == TypeAspect.PERFECTIVE;
  bool get isImperfective => this == TypeAspect.IMPERFECTIVE;
  bool get isProgressive => this == TypeAspect.PROGRESSIVE;
  String get title => 'Aspect';
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
  String get title => 'Case';
}

extension TypeCaseExtension on TypeCase {
  bool get isUnknown => this == TypeCase.CASE_UNKNOWN;
  bool get isAccusative => this == TypeCase.ACCUSATIVE;
  bool get isAdverbial => this == TypeCase.ADVERBIAL;
  bool get isComplementive => this == TypeCase.COMPLEMENTIVE;
  bool get isDative => this == TypeCase.DATIVE;
  bool get isGenitive => this == TypeCase.GENITIVE;
  bool get isInstrumental => this == TypeCase.INSTRUMENTAL;
  bool get isLocative => this == TypeCase.LOCATIVE;
  bool get isNominative => this == TypeCase.NOMINATIVE;
  bool get isOblique => this == TypeCase.OBLIQUE;
  bool get isPartitive => this == TypeCase.PARTITIVE;
  bool get isPrepositional => this == TypeCase.PREPOSITIONAL;
  bool get isReflexive => this == TypeCase.REFLEXIVE_CASE;
  bool get isRelative => this == TypeCase.RELATIVE_CASE;
  bool get isVocative => this == TypeCase.VOCATIVE;
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
  String get title => 'Form';
}

extension TypeFormExtension on TypeForm {
  bool get isUnknown => this == TypeForm.FORM_UNKNOWN;
  bool get isAdnomial => this == TypeForm.ADNOMIAL;
  bool get isAuxiliary => this == TypeForm.AUXILIARY;
  bool get isComplementizer => this == TypeForm.COMPLEMENTIZER;
  bool get isFinalEnding => this == TypeForm.FINAL_ENDING;
  bool get isGerund => this == TypeForm.GERUND;
  bool get isRealis => this == TypeForm.REALIS;
  bool get isIrrealis => this == TypeForm.IRREALIS;
  bool get isShort => this == TypeForm.SHORT;
  bool get isLong => this == TypeForm.LONG;
  bool get isOrder => this == TypeForm.ORDER;
  bool get isSpecific => this == TypeForm.SPECIFIC;
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
  String get title => 'Mood';
}

extension TypeMoodExtension on TypeMood {
  bool get isUnknown => this == TypeMood.MOOD_UNKNOWN;
  bool get isConditional => this == TypeMood.CONDITIONAL_MOOD;
  bool get isImperative => this == TypeMood.IMPERATIVE;
  bool get isIndicative => this == TypeMood.INDICATIVE;
  bool get isInterrogative => this == TypeMood.INTERROGATIVE;
  bool get isJussive => this == TypeMood.JUSSIVE;
  bool get isSubjunctive => this == TypeMood.SUBJUNCTIVE;
}

enum TypeGender {
  GENDER_UNKNOWN('Gender is not applicable in the analyzed language or is not predicted.'),
  FEMININE('Feminine'),
  MASCULINE('Masculine'),
  NEUTER('Neuter');

  const TypeGender(this._description);
  final String _description;
  String get description => _description;
  String get title => 'Gender';
}

extension TypeGenderExtension on TypeGender {
  bool get isUnknown => this == TypeGender.GENDER_UNKNOWN;
  bool get isFeminine => this == TypeGender.FEMININE;
  bool get isMasculine => this == TypeGender.MASCULINE;
  bool get isNeuter => this == TypeGender.NEUTER;
}

enum TypeNumber {
  NUMBER_UNKNOWN('Number is not applicable in the analyzed language or is not predicted.'),
  SINGULAR('Singular'),
  PLURAL('Plural'),
  DUAL('Dual');

  const TypeNumber(this._description);
  final String _description;
  String get description => _description;
  String get title => 'Number';
}

extension TypeNumberExtension on TypeNumber {
  bool get isUnknown => this == TypeNumber.NUMBER_UNKNOWN;
  bool get isSingular => this == TypeNumber.SINGULAR;
  bool get isPlural => this == TypeNumber.PLURAL;
  bool get isDual => this == TypeNumber.DUAL;
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
  String get title => 'Person';
}

extension TypePersonExtension on TypePerson {
  bool get isUnknown => this == TypePerson.PERSON_UNKNOWN;
  bool get isFirst => this == TypePerson.FIRST;
  bool get isSecond => this == TypePerson.SECOND;
  bool get isThird => this == TypePerson.THIRD;
  bool get isReflexive => this == TypePerson.REFLEXIVE_PERSON;
}

enum TypeProper {
  PROPER_UNKNOWN('Proper is not applicable in the analyzed language or is not predicted.'),
  PROPER('Proper'),
  NOT_PROPER('Not proper');

  const TypeProper(this._description);
  final String _description;
  String get description => _description;
  String get title => 'Substantive';
}

extension TypeProperExtension on TypeProper {
  bool get isUnknown => this == TypeProper.PROPER_UNKNOWN;
  bool get isProper => this == TypeProper.PROPER;
  bool get isNotProper => this == TypeProper.NOT_PROPER;
}

enum TypeReciprocity {
  RECIPROCITY_UNKNOWN('Reciprocity is not applicable in the analyzed language or is not predicted.'),
  RECIPROCAL('Reciprocal'),
  NON_RECIPROCAL('Non-reciprocal');

  const TypeReciprocity(this._description);
  final String _description;
  String get description => _description;
  String get title => 'Pronoun';
}

extension TypeReciprocityExtension on TypeReciprocity {
  bool get isUnknown => this == TypeReciprocity.RECIPROCITY_UNKNOWN;
  bool get isReciprocal => this == TypeReciprocity.RECIPROCAL;
  bool get isNonReciprocal => this == TypeReciprocity.NON_RECIPROCAL;
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
  String get title => 'Part of speech';
}

extension TypeTagExtension on TypeTag {
  bool get isUnknown => this == TypeTag.UNKNOWN;
  bool get isAdjective => this == TypeTag.ADJ;
  bool get isAdposition => this == TypeTag.ADP;
  bool get isAdverb => this == TypeTag.ADV;
  bool get isConjunction => this == TypeTag.CONJ;
  bool get isDeterminer => this == TypeTag.DET;
  bool get isNoun => this == TypeTag.NOUN;
  bool get isCardinalNumber => this == TypeTag.NUM;
  bool get isPronoun => this == TypeTag.PRON;
  bool get isParticle => this == TypeTag.PRT;
  bool get isPunctuation => this == TypeTag.PUNCT;
  bool get isVerb => this == TypeTag.VERB;
  bool get isOther => this == TypeTag.X;
  bool get isAffix => this == TypeTag.AFFIX;
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
  String get title => 'Grammatical tense';
}

extension TypeTenseExtension on TypeTense {
  bool get isUnknown => this == TypeTense.TENSE_UNKNOWN;
  bool get isConditional => this == TypeTense.CONDITIONAL_TENSE;
  bool get isFuture => this == TypeTense.FUTURE;
  bool get isPast => this == TypeTense.PAST;
  bool get isPresent => this == TypeTense.PRESENT;
  bool get isImperfect => this == TypeTense.IMPERFECT;
  bool get isPluperfect => this == TypeTense.PLUPERFECT;
}

enum TypeVoice {
  VOICE_UNKNOWN('Voice is not applicable in the analyzed language or is not predicted.'),
  ACTIVE('Active'),
  CAUSATIVE('Causative'),
  PASSIVE('Passive');

  const TypeVoice(this._description);
  final String _description;
  String get description => _description;
  String get title => 'Voice';
}

extension TypeVoiceExtension on TypeVoice {
  bool get isUnknown => this == TypeVoice.VOICE_UNKNOWN;
  bool get isActive => this == TypeVoice.ACTIVE;
  bool get isCausative => this == TypeVoice.CAUSATIVE;
  bool get isPassive => this == TypeVoice.PASSIVE;
}
