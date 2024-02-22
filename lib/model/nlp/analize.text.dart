import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:aletheia_core_model/aletheia_core_model.dart';
import 'package:aletheia_core_model/extension/custom.extensions.dart';
import 'package:aletheia_core_model/model/nlp/type.entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Sentiment {
  /// A non-negative number in the \[0, +inf) range, which represents the
  /// absolute magnitude of sentiment regardless of score (positive or
  /// negative).
  double? magnitude;

  /// Sentiment score between -1.0 (negative sentiment) and 1.0 (positive
  /// sentiment).
  double? score;
  Sentiment({
    this.magnitude,
    this.score,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'magnitude': magnitude,
      'score': score,
    };
  }

  factory Sentiment.fromMap(Map<String, dynamic> map) {
    return Sentiment(
      magnitude: map['magnitude'] != null ? map['magnitude'] as double : null,
      score: map['score'] != null ? map['score'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sentiment.fromJson(String source) => Sentiment.fromMap(json.decode(source) as Map<String, dynamic>);
}

class $TextSpan {
  /// The API calculates the beginning offset of the content in the original
  /// document according to the EncodingType specified in the API request.
  int? beginOffset;

  /// The content of the text span, which is a substring of the document.
  String? content;

  $TextSpan({
    this.beginOffset,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'beginOffset': beginOffset,
      'content': content,
    };
  }

  factory $TextSpan.fromMap(Map<String, dynamic> map) {
    return $TextSpan(
      beginOffset: map['beginOffset'] != null ? map['beginOffset'] as int : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory $TextSpan.fromJson(String source) => $TextSpan.fromMap(json.decode(source) as Map<String, dynamic>);
}

// Represents a mention for an entity in the text.
///
/// Currently, proper noun mentions are supported.
class EntityMention {
  /// For calls to AnalyzeEntitySentiment or if
  /// AnnotateTextRequest.Features.extract_entity_sentiment is set to true, this
  /// field will contain the sentiment expressed for this mention of the entity
  /// in the provided document.
  Sentiment? sentiment;

  /// The mention text.
  $TextSpan? text;

  /// The type of the entity mention.
  /// Possible string values are:
  /// - "TYPE_UNKNOWN" : Unknown
  /// - "PROPER" : Proper name
  /// - "COMMON" : Common noun (or noun compound)
  TypeEntityMention? type;

  EntityMention({
    this.sentiment,
    this.text,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sentiment': sentiment?.toMap(),
      'text': text?.toMap(),
      'type': type?.toMap(),
    };
  }

  factory EntityMention.fromMap(Map<String, dynamic> map) {
    return EntityMention(
      sentiment: map['sentiment'] != null ? Sentiment.fromMap(map['sentiment'] as Map<String, dynamic>) : null,
      text: map['text'] != null ? $TextSpan.fromMap(map['text'] as Map<String, dynamic>) : null,
      type: map['type'] != null ? TypeEntityMention.fromMap(map['type'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityMention.fromJson(String source) => EntityMention.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant EntityMention other) {
    if (identical(this, other)) return true;

    return other.sentiment == sentiment && other.text == text && other.type == type;
  }

  @override
  int get hashCode => sentiment.hashCode ^ text.hashCode ^ type.hashCode;

  @override
  String toString() => 'EntityMention(sentiment: $sentiment, text: $text, type: $type)';
}

// Represents a phrase in the text that is a known entity, such as a person, an
/// organization, or location.
///
/// The API associates information, such as salience and mentions, with
/// entities.
class Entity {
  /// The mentions of this entity in the input document.
  ///
  /// The API currently supports proper noun mentions.
  List<EntityMention>? mentions;

  /// Metadata associated with the entity.
  ///
  /// For most entity types, the metadata is a Wikipedia URL (`wikipedia_url`)
  /// and Knowledge Graph MID (`mid`), if they are available. For the metadata
  /// associated with other entity types, see the Type table below.
  Map<String, String>? metadata;

  /// The representative name for the entity.
  String? name;

  /// The salience score associated with the entity in the \[0, 1.0\] range.
  ///
  /// The salience score for an entity provides information about the importance
  /// or centrality of that entity to the entire document text. Scores closer to
  /// 0 are less salient, while scores closer to 1.0 are highly salient.
  double? salience;

  /// For calls to AnalyzeEntitySentiment or if
  /// AnnotateTextRequest.Features.extract_entity_sentiment is set to true, this
  /// field will contain the aggregate sentiment expressed for this entity in
  /// the provided document.
  Sentiment? sentiment;

  /// The entity type.
  /// Possible string values are:
  /// - "UNKNOWN" : Unknown
  /// - "PERSON" : Person
  /// - "LOCATION" : Location
  /// - "ORGANIZATION" : Organization
  /// - "EVENT" : Event
  /// - "WORK_OF_ART" : Artwork
  /// - "CONSUMER_GOOD" : Consumer product
  /// - "OTHER" : Other types of entities
  /// - "PHONE_NUMBER" : Phone number The metadata lists the phone number,
  /// formatted according to local convention, plus whichever additional
  /// elements appear in the text: * `number` - the actual number, broken down
  /// into sections as per local convention * `national_prefix` - country code,
  /// if detected * `area_code` - region or area code, if detected * `extension`
  /// - phone extension (to be dialed after connection), if detected
  /// - "ADDRESS" : Address The metadata identifies the street number and
  /// locality plus whichever additional elements appear in the text: *
  /// `street_number` - street number * `locality` - city or town *
  /// `street_name` - street/route name, if detected * `postal_code` - postal
  /// code, if detected * `country` - country, if detected\< * `broad_region` -
  /// administrative area, such as the state, if detected * `narrow_region` -
  /// smaller administrative area, such as county, if detected * `sublocality` -
  /// used in Asian addresses to demark a district within a city, if detected
  /// - "DATE" : Date The metadata identifies the components of the date: *
  /// `year` - four digit year, if detected * `month` - two digit month number,
  /// if detected * `day` - two digit day number, if detected
  /// - "NUMBER" : Number The metadata is the number itself.
  /// - "PRICE" : Price The metadata identifies the `value` and `currency`.
  TypeEntity? type;

  Entity({
    this.mentions,
    this.metadata,
    this.name,
    this.salience,
    this.sentiment,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mentions': mentions?.map((x) => x.toMap()).toList(),
      'metadata': metadata,
      'name': name,
      'salience': salience,
      'sentiment': sentiment?.toMap(),
      'type': type?.toMap(),
    };
  }

  factory Entity.fromMap(Map<String, dynamic> map) {
    return Entity(
      mentions: map['mentions'] != null
          ? List<EntityMention>.from(
              (map['mentions'] as List<int>).map<EntityMention?>(
                (x) => EntityMention.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      metadata: map['metadata'] != null ? Map<String, String>.from((map['metadata'] as Map<String, String>)) : null,
      name: map['name'] != null ? map['name'] as String : null,
      salience: map['salience'] != null ? map['salience'] as double : null,
      sentiment: map['sentiment'] != null ? Sentiment.fromMap(map['sentiment'] as Map<String, dynamic>) : null,
      type: map['type'] != null ? TypeEntity.fromMap(map['type'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Entity.fromJson(String source) => Entity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Entity(mentions: $mentions, metadata: $metadata, name: $name, salience: $salience, sentiment: $sentiment, type: $type)';
  }

  @override
  bool operator ==(covariant Entity other) {
    if (identical(this, other)) return true;

    return listEquals(other.mentions, mentions) &&
        mapEquals(other.metadata, metadata) &&
        other.name == name &&
        other.salience == salience &&
        other.sentiment == sentiment &&
        other.type == type;
  }

  @override
  int get hashCode {
    return mentions.hashCode ^ metadata.hashCode ^ name.hashCode ^ salience.hashCode ^ sentiment.hashCode ^ type.hashCode;
  }
}

/// Represents a sentence in the input document.
class Sentence {
  /// For calls to AnalyzeSentiment or if
  /// AnnotateTextRequest.Features.extract_document_sentiment is set to true,
  /// this field will contain the sentiment for the sentence.
  Sentiment? sentiment;

  /// The sentence text.
  $TextSpan? text;

  Sentence({
    this.sentiment,
    this.text,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sentiment': sentiment?.toMap(),
      'text': text?.toMap(),
    };
  }

  factory Sentence.fromMap(Map<String, dynamic> map) {
    return Sentence(
      sentiment: map['sentiment'] != null ? Sentiment.fromMap(map['sentiment'] as Map<String, dynamic>) : null,
      text: map['text'] != null ? $TextSpan.fromMap(map['text'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sentence.fromJson(String source) => Sentence.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Sentence(sentiment: $sentiment, text: $text)';

  @override
  bool operator ==(covariant Sentence other) {
    if (identical(this, other)) return true;

    return other.sentiment == sentiment && other.text == text;
  }

  @override
  int get hashCode => sentiment.hashCode ^ text.hashCode;
}

class AnalizeText {
  /// The overall sentiment for the document.
  ///
  /// Populated if the user enables
  /// AnnotateTextRequest.Features.extract_document_sentiment.
  Sentiment? documentSentiment;

  /// Entities, along with their semantic information, in the input document.
  ///
  /// Populated if the user enables
  /// AnnotateTextRequest.Features.extract_entities.
  List<Entity>? entities;

  /// Sentences in the input document.
  ///
  /// Populated if the user enables AnnotateTextRequest.Features.extract_syntax.
  List<Sentence>? sentences;

  /// Tokens, along with their syntactic information, in the input document.
  ///
  /// Populated if the user enables AnnotateTextRequest.Features.extract_syntax.
  List<AnalizeGrammar>? tokens;
}
