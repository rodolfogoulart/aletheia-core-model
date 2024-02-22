// ignore_for_file: constant_identifier_names, non_constant_identifier_names
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
enum TypeEntity {
  UNKNOWN,
  PERSON,
  LOCATION,
  ORGANIZATION,
  EVENT,
  WORK_OF_ART,
  CONSUMER_GOOD,
  OTHER,
  PHONE_NUMBER,
  ADDRESS,
  DATE,
  NUMBER,
  PRICE;

  factory TypeEntity.fromMap(dynamic value) {
    return TypeEntity.values.byName(value);
  }
}

extension TypeEntityExtension on TypeEntity {
  bool get isUNKNOWN => this == TypeEntity.UNKNOWN;
  bool get isPERSON => this == TypeEntity.PERSON;
  bool get isLOCATION => this == TypeEntity.LOCATION;
  bool get isORGANIZATION => this == TypeEntity.ORGANIZATION;
  bool get isEVENT => this == TypeEntity.EVENT;
  bool get isWORK_OF_ART => this == TypeEntity.WORK_OF_ART;
  bool get isCONSUMER_GOOD => this == TypeEntity.CONSUMER_GOOD;
  bool get isOTHER => this == TypeEntity.OTHER;
  bool get isPHONE_NUMBER => this == TypeEntity.PHONE_NUMBER;
  bool get isADDRESS => this == TypeEntity.ADDRESS;
  bool get isDATE => this == TypeEntity.DATE;
  bool get isNUMBER => this == TypeEntity.NUMBER;
  bool get isPRICE => this == TypeEntity.PRICE;

  ///return the description of the entity
  String get description {
    return switch (this) {
      TypeEntity.UNKNOWN => 'Unknown',
      TypeEntity.PERSON => 'Person',
      TypeEntity.LOCATION => 'Location',
      TypeEntity.ORGANIZATION => 'Organization',
      TypeEntity.EVENT => 'Event',
      TypeEntity.WORK_OF_ART => 'Artwork',
      TypeEntity.CONSUMER_GOOD => 'Consumer product',
      TypeEntity.OTHER => 'Other types of entities',
      TypeEntity.PHONE_NUMBER => 'Phone',
      TypeEntity.ADDRESS => 'Address',
      TypeEntity.DATE => 'Date',
      TypeEntity.NUMBER => 'Number',
      TypeEntity.PRICE => 'Price'
    };
  }
}

/// The type of the entity mention.
/// Possible string values are:
/// - "TYPE_UNKNOWN" : Unknown
/// - "PROPER" : Proper name
/// - "COMMON" : Common noun (or noun compound)
enum TypeEntityMention {
  TYPE_UNKNOWN,
  PROPER,
  COMMON;

  factory TypeEntityMention.fromMap(dynamic value) {
    return TypeEntityMention.values.byName(value);
  }
}

extension TypeEntityMentionExtension on TypeEntityMention {
  bool get isTYPE_UNKNOWN => this == TypeEntityMention.TYPE_UNKNOWN;
  bool get isPROPER => this == TypeEntityMention.PROPER;
  bool get isCOMMON => this == TypeEntityMention.COMMON;

  ///return the description of the entity
  String get description {
    return switch (this) {
      TypeEntityMention.TYPE_UNKNOWN => 'Unknown',
      TypeEntityMention.PROPER => 'Proper name',
      TypeEntityMention.COMMON => 'Common noun (or noun compound)'
    };
  }
}
