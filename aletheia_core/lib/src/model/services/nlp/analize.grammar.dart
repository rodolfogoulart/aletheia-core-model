import 'dart:convert';

import 'package:aletheia_core/aletheia_core_model.dart';

///class based on package googleapis [Token]
class AnalizeGrammar {
  /// [Lemma](https://en.wikipedia.org/wiki/Lemma_%28morphology%29) of the
  /// token.
  String? lemma;

  ///
  String? word;

  /// The API calculates the beginning offset of the content in the original
  /// document according to the EncodingType specified in the API request.
  int? beginOffsetWord;

  WordDependencyEdge? wordDependencyEdge;

  /// Parts of speech tag for this word.
  WordPartOfSpeech? partOfSpeech;

  AnalizeGrammar({
    this.lemma,
    this.word,
    this.beginOffsetWord,
    this.wordDependencyEdge,
    this.partOfSpeech,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (lemma != null) {
      result.addAll({'lemma': lemma});
    }
    if (word != null) {
      result.addAll({'word': word});
    }
    if (beginOffsetWord != null) {
      result.addAll({'beginOffsetWord': beginOffsetWord});
    }
    if (wordDependencyEdge != null) {
      result.addAll({'wordDependencyEdge': wordDependencyEdge!.toMap()});
    }
    if (partOfSpeech != null) {
      result.addAll({'partOfSpeech': partOfSpeech!.toMap()});
    }

    return result;
  }

  factory AnalizeGrammar.fromMap(Map<String, dynamic> map) {
    return AnalizeGrammar(
      lemma: map['lemma'],
      word: map['word'],
      beginOffsetWord: map['beginOffsetWord']?.toInt(),
      wordDependencyEdge: map['wordDependencyEdge'] != null
          ? WordDependencyEdge.fromMap(map['wordDependencyEdge'])
          : null,
      partOfSpeech: map['partOfSpeech'] != null
          ? WordPartOfSpeech.fromMap(map['partOfSpeech'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnalizeGrammar.fromJson(String source) =>
      AnalizeGrammar.fromMap(json.decode(source));
}

///look to https://aclanthology.org/P13-2017.pdf for more details
///
///https://aclanthology.org/P13-2017/
///
class WordDependencyEdge {
  /// Represents the head of this token in the dependency tree.
  ///
  /// This is the index of the token which has an arc going to this token. The
  /// index is the position of the token in the array of tokens returned by the
  /// API method. If this token is a root token, then the `head_token_index` is
  /// its own index.
  int? headTokenIndex;

  /// The parse label for the token.
  /// Possible string values are:
  /// - "UNKNOWN" : Unknown
  /// - "ABBREV" : Abbreviation modifier
  /// - "ACOMP" : Adjectival complement
  /// - "ADVCL" : Adverbial clause modifier
  /// - "ADVMOD" : Adverbial modifier
  /// - "AMOD" : Adjectival modifier of an NP
  /// - "APPOS" : Appositional modifier of an NP
  /// - "ATTR" : Attribute dependent of a copular verb
  /// - "AUX" : Auxiliary (non-main) verb
  /// - "AUXPASS" : Passive auxiliary
  /// - "CC" : Coordinating conjunction
  /// - "CCOMP" : Clausal complement of a verb or adjective
  /// - "CONJ" : Conjunct
  /// - "CSUBJ" : Clausal subject
  /// - "CSUBJPASS" : Clausal passive subject
  /// - "DEP" : Dependency (unable to determine)
  /// - "DET" : Determiner
  /// - "DISCOURSE" : Discourse
  /// - "DOBJ" : Direct object
  /// - "EXPL" : Expletive
  /// - "GOESWITH" : Goes with (part of a word in a text not well edited)
  /// - "IOBJ" : Indirect object
  /// - "MARK" : Marker (word introducing a subordinate clause)
  /// - "MWE" : Multi-word expression
  /// - "MWV" : Multi-word verbal expression
  /// - "NEG" : Negation modifier
  /// - "NN" : Noun compound modifier
  /// - "NPADVMOD" : Noun phrase used as an adverbial modifier
  /// - "NSUBJ" : Nominal subject
  /// - "NSUBJPASS" : Passive nominal subject
  /// - "NUM" : Numeric modifier of a noun
  /// - "NUMBER" : Element of compound number
  /// - "P" : Punctuation mark
  /// - "PARATAXIS" : Parataxis relation
  /// - "PARTMOD" : Participial modifier
  /// - "PCOMP" : The complement of a preposition is a clause
  /// - "POBJ" : Object of a preposition
  /// - "POSS" : Possession modifier
  /// - "POSTNEG" : Postverbal negative particle
  /// - "PRECOMP" : Predicate complement
  /// - "PRECONJ" : Preconjunt
  /// - "PREDET" : Predeterminer
  /// - "PREF" : Prefix
  /// - "PREP" : Prepositional modifier
  /// - "PRONL" : The relationship between a verb and verbal morpheme
  /// - "PRT" : Particle
  /// - "PS" : Associative or possessive marker
  /// - "QUANTMOD" : Quantifier phrase modifier
  /// - "RCMOD" : Relative clause modifier
  /// - "RCMODREL" : Complementizer in relative clause
  /// - "RDROP" : Ellipsis without a preceding predicate
  /// - "REF" : Referent
  /// - "REMNANT" : Remnant
  /// - "REPARANDUM" : Reparandum
  /// - "ROOT" : Root
  /// - "SNUM" : Suffix specifying a unit of number
  /// - "SUFF" : Suffix
  /// - "TMOD" : Temporal modifier
  /// - "TOPIC" : Topic marker
  /// - "VMOD" : Clause headed by an infinite form of the verb that modifies a
  /// noun
  /// - "VOCATIVE" : Vocative
  /// - "XCOMP" : Open clausal complement
  /// - "SUFFIX" : Name suffix
  /// - "TITLE" : Name title
  /// - "ADVPHMOD" : Adverbial phrase modifier
  /// - "AUXCAUS" : Causative auxiliary
  /// - "AUXVV" : Helper auxiliary
  /// - "DTMOD" : Rentaishi (Prenominal modifier)
  /// - "FOREIGN" : Foreign words
  /// - "KW" : Keyword
  /// - "LIST" : List for chains of comparable items
  /// - "NOMC" : Nominalized clause
  /// - "NOMCSUBJ" : Nominalized clausal subject
  /// - "NOMCSUBJPASS" : Nominalized clausal passive
  /// - "NUMC" : Compound of numeric modifier
  /// - "COP" : Copula
  /// - "DISLOCATED" : Dislocated relation (for fronted/topicalized elements)
  /// - "ASP" : Aspect marker
  /// - "GMOD" : Genitive modifier
  /// - "GOBJ" : Genitive object
  /// - "INFMOD" : Infinitival modifier
  /// - "MES" : Measure
  /// - "NCOMP" : Nominal complement of a noun
  String? label;
  WordDependencyEdge({
    this.headTokenIndex,
    this.label,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (headTokenIndex != null) {
      result.addAll({'headTokenIndex': headTokenIndex});
    }
    if (label != null) {
      result.addAll({'label': label});
    }

    return result;
  }

  factory WordDependencyEdge.fromMap(Map<String, dynamic> map) {
    return WordDependencyEdge(
      headTokenIndex: map['headTokenIndex']?.toInt(),
      label: map['label'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WordDependencyEdge.fromJson(String source) =>
      WordDependencyEdge.fromMap(json.decode(source));
}

/// Represents part of speech information for a token.
///
/// Parts of speech are as defined in http://www.lrec-conf.org/proceedings/lrec2012/pdf/274_Paper.pdf
class WordPartOfSpeech {
  /// The grammatical aspect.
  /// Possible string values are:
  /// - "ASPECT_UNKNOWN" : Aspect is not applicable in the analyzed language or
  /// is not predicted.
  /// - "PERFECTIVE" : Perfective
  /// - "IMPERFECTIVE" : Imperfective
  /// - "PROGRESSIVE" : Progressive
  String? aspect;

  /// The grammatical case.
  /// Possible string values are:
  /// - "CASE_UNKNOWN" : Case is not applicable in the analyzed language or is
  /// not predicted.
  /// - "ACCUSATIVE" : Accusative
  /// - "ADVERBIAL" : Adverbial
  /// - "COMPLEMENTIVE" : Complementive
  /// - "DATIVE" : Dative
  /// - "GENITIVE" : Genitive
  /// - "INSTRUMENTAL" : Instrumental
  /// - "LOCATIVE" : Locative
  /// - "NOMINATIVE" : Nominative
  /// - "OBLIQUE" : Oblique
  /// - "PARTITIVE" : Partitive
  /// - "PREPOSITIONAL" : Prepositional
  /// - "REFLEXIVE_CASE" : Reflexive
  /// - "RELATIVE_CASE" : Relative
  /// - "VOCATIVE" : Vocative
  String? case_;

  /// The grammatical form.
  /// Possible string values are:
  /// - "FORM_UNKNOWN" : Form is not applicable in the analyzed language or is
  /// not predicted.
  /// - "ADNOMIAL" : Adnomial
  /// - "AUXILIARY" : Auxiliary
  /// - "COMPLEMENTIZER" : Complementizer
  /// - "FINAL_ENDING" : Final ending
  /// - "GERUND" : Gerund
  /// - "REALIS" : Realis
  /// - "IRREALIS" : Irrealis
  /// - "SHORT" : Short form
  /// - "LONG" : Long form
  /// - "ORDER" : Order form
  /// - "SPECIFIC" : Specific form
  String? form;

  /// The grammatical gender.
  /// Possible string values are:
  /// - "GENDER_UNKNOWN" : Gender is not applicable in the analyzed language or
  /// is not predicted.
  /// - "FEMININE" : Feminine
  /// - "MASCULINE" : Masculine
  /// - "NEUTER" : Neuter
  String? gender;

  /// The grammatical mood.
  /// Possible string values are:
  /// - "MOOD_UNKNOWN" : Mood is not applicable in the analyzed language or is
  /// not predicted.
  /// - "CONDITIONAL_MOOD" : Conditional
  /// - "IMPERATIVE" : Imperative
  /// - "INDICATIVE" : Indicative
  /// - "INTERROGATIVE" : Interrogative
  /// - "JUSSIVE" : Jussive
  /// - "SUBJUNCTIVE" : Subjunctive
  String? mood;

  /// The grammatical number.
  /// Possible string values are:
  /// - "NUMBER_UNKNOWN" : Number is not applicable in the analyzed language or
  /// is not predicted.
  /// - "SINGULAR" : Singular
  /// - "PLURAL" : Plural
  /// - "DUAL" : Dual
  String? number;

  /// The grammatical person.
  /// Possible string values are:
  /// - "PERSON_UNKNOWN" : Person is not applicable in the analyzed language or
  /// is not predicted.
  /// - "FIRST" : First
  /// - "SECOND" : Second
  /// - "THIRD" : Third
  /// - "REFLEXIVE_PERSON" : Reflexive
  String? person;

  /// The grammatical properness.
  /// Possible string values are:
  /// - "PROPER_UNKNOWN" : Proper is not applicable in the analyzed language or
  /// is not predicted.
  /// - "PROPER" : Proper
  /// - "NOT_PROPER" : Not proper
  String? proper;

  /// The grammatical reciprocity.
  /// Possible string values are:
  /// - "RECIPROCITY_UNKNOWN" : Reciprocity is not applicable in the analyzed
  /// language or is not predicted.
  /// - "RECIPROCAL" : Reciprocal
  /// - "NON_RECIPROCAL" : Non-reciprocal
  String? reciprocity;

  /// The part of speech tag.
  /// Possible string values are:
  /// - "UNKNOWN" : Unknown
  /// - "ADJ" : Adjective
  /// - "ADP" : Adposition (preposition and postposition)
  /// - "ADV" : Adverb
  /// - "CONJ" : Conjunction
  /// - "DET" : Determiner
  /// - "NOUN" : Noun (common and proper)
  /// - "NUM" : Cardinal number
  /// - "PRON" : Pronoun
  /// - "PRT" : Particle or other function word
  /// - "PUNCT" : Punctuation
  /// - "VERB" : Verb (all tenses and modes)
  /// - "X" : Other: foreign words, typos, abbreviations
  /// - "AFFIX" : Affix
  String? tag;

  /// The grammatical tense.
  /// Possible string values are:
  /// - "TENSE_UNKNOWN" : Tense is not applicable in the analyzed language or is
  /// not predicted.
  /// - "CONDITIONAL_TENSE" : Conditional
  /// - "FUTURE" : Future
  /// - "PAST" : Past
  /// - "PRESENT" : Present
  /// - "IMPERFECT" : Imperfect
  /// - "PLUPERFECT" : Pluperfect
  String? tense;

  /// The grammatical voice.
  /// Possible string values are:
  /// - "VOICE_UNKNOWN" : Voice is not applicable in the analyzed language or is
  /// not predicted.
  /// - "ACTIVE" : Active
  /// - "CAUSATIVE" : Causative
  /// - "PASSIVE" : Passive
  String? voice;
  WordPartOfSpeech({
    this.aspect,
    this.case_,
    this.form,
    this.gender,
    this.mood,
    this.number,
    this.person,
    this.proper,
    this.reciprocity,
    this.tag,
    this.tense,
    this.voice,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (aspect != null) {
      result.addAll({'aspect': aspect});
    }
    if (case_ != null) {
      result.addAll({'case_': case_});
    }
    if (form != null) {
      result.addAll({'form': form});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (mood != null) {
      result.addAll({'mood': mood});
    }
    if (number != null) {
      result.addAll({'number': number});
    }
    if (person != null) {
      result.addAll({'person': person});
    }
    if (proper != null) {
      result.addAll({'proper': proper});
    }
    if (reciprocity != null) {
      result.addAll({'reciprocity': reciprocity});
    }
    if (tag != null) {
      result.addAll({'tag': tag});
    }
    if (tense != null) {
      result.addAll({'tense': tense});
    }
    if (voice != null) {
      result.addAll({'voice': voice});
    }

    return result;
  }

  factory WordPartOfSpeech.fromMap(Map<String, dynamic> map) {
    return WordPartOfSpeech(
      aspect: map['aspect'],
      case_: map['case_'],
      form: map['form'],
      gender: map['gender'],
      mood: map['mood'],
      number: map['number'],
      person: map['person'],
      proper: map['proper'],
      reciprocity: map['reciprocity'],
      tag: map['tag'],
      tense: map['tense'],
      voice: map['voice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WordPartOfSpeech.fromJson(String source) =>
      WordPartOfSpeech.fromMap(json.decode(source));
}

///view for WordPartOfSpeech with the Enum type
class WordPartOfSpeechView {
  TypeAspect aspect;
  TypeCase case_;
  TypeForm form;
  TypeGender gender;
  TypeMood mood;
  TypeNumber number;
  TypePerson person;
  TypeProper proper;
  TypeReciprocity reciprocity;
  TypeTag tag;
  TypeTense tense;
  TypeVoice voice;
  WordPartOfSpeechView({
    required this.aspect,
    required this.case_,
    required this.form,
    required this.gender,
    required this.mood,
    required this.number,
    required this.person,
    required this.proper,
    required this.reciprocity,
    required this.tag,
    required this.tense,
    required this.voice,
  });

  factory WordPartOfSpeechView.fromWordPartOfSpeech(WordPartOfSpeech w) {
    return WordPartOfSpeechView(
      aspect:
          TypeAspect.values.byName(w.aspect ?? TypeAspect.ASPECT_UNKNOWN.name),
      case_: TypeCase.values.byName(w.case_ ?? TypeCase.CASE_UNKNOWN.name),
      form: TypeForm.values.byName(w.form ?? TypeForm.FORM_UNKNOWN.name),
      gender:
          TypeGender.values.byName(w.gender ?? TypeGender.GENDER_UNKNOWN.name),
      mood: TypeMood.values.byName(w.mood ?? TypeMood.MOOD_UNKNOWN.name),
      number:
          TypeNumber.values.byName(w.number ?? TypeNumber.NUMBER_UNKNOWN.name),
      person:
          TypePerson.values.byName(w.person ?? TypePerson.PERSON_UNKNOWN.name),
      proper:
          TypeProper.values.byName(w.proper ?? TypeProper.PROPER_UNKNOWN.name),
      reciprocity: TypeReciprocity.values
          .byName(w.reciprocity ?? TypeReciprocity.RECIPROCITY_UNKNOWN.name),
      tag: TypeTag.values.byName(w.tag ?? TypeTag.UNKNOWN.name),
      tense: TypeTense.values.byName(w.tense ?? TypeTense.TENSE_UNKNOWN.name),
      voice: TypeVoice.values.byName(w.voice ?? TypeVoice.VOICE_UNKNOWN.name),
    );
  }

  wordPartOfSpeechViewToWordPartOfSpeech(WordPartOfSpeechView w) {
    return WordPartOfSpeech(
      aspect: w.aspect.name,
      case_: w.case_.name,
      form: w.form.name,
      gender: w.gender.name,
      mood: w.mood.name,
      number: w.number.name,
      person: w.person.name,
      proper: w.proper.name,
      reciprocity: w.reciprocity.name,
      tag: w.tag.name,
      tense: w.tense.name,
      voice: w.voice.name,
    );
  }
}
