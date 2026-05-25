import 'dart:convert';

enum TypeUserNotesMetaData {
  ///string - the id of the google docs, used to link the note with the google docs
  googleDocsId,

  /// DateTime - the last "sync time" (when uploaded to Google Docs)
  ///
  /// use with [googleDocsId] to determine if the note has been updated since last sync with google docs
  googleDocsLastSync,

  ///string - the google account email that the google docs belongs to,
  ///
  ///use with [googleDocsId] to link the note with the google account
  googleDocsUserInfo,

  ///string - the url of the google docs that the document was imported from
  urlImportedFromGoogleDocs,

  ///string - the document type of the note, [Quill] or [Applowy]
  documentType,

  ///List[Reference] - the list of references that are related to the note but not included in the main content of the note
  otherReferencesOnText,
}

/// Metadata for [UserNotes] to store additional information about the note
///
class UserNotesMetaData {
  ///for general use
  ///
  ///use [TypeUserNotesMetaData] as key for predefined metadata
  ///
  ///but the field is dynamic to allow any custom metadata to be added in the future without changing the model
  Map<String, dynamic>? metadata;

  UserNotesMetaData({
    this.metadata,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'metadata': metadata,
    };
  }

  factory UserNotesMetaData.fromMap(Map<String, dynamic> map) {
    return UserNotesMetaData(
      metadata: map['metadata'] != null
          ? Map<String, dynamic>.from((map['metadata'] as Map<String, dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserNotesMetaData.fromJson(String source) =>
      UserNotesMetaData.fromMap(json.decode(source) as Map<String, dynamic>);
}
