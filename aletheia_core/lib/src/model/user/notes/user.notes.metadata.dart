// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../bible/verse/reference.dart';

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

extension TypeUserNotesMetaDataExtension on TypeUserNotesMetaData {
  toMap() => name;
  fromMap(String map) => TypeUserNotesMetaData.values.firstWhere(
        (e) => e.name == map,
        orElse: () => throw Exception('Invalid TypeUserNotesMetaData: $map'),
      );

  bool get isGoogleDocsId => this == TypeUserNotesMetaData.googleDocsId;
  bool get isGoogleDocsLastSync =>
      this == TypeUserNotesMetaData.googleDocsLastSync;
  bool get isGoogleDocsUserInfo =>
      this == TypeUserNotesMetaData.googleDocsUserInfo;
  bool get isUrlImportedFromGoogleDocs =>
      this == TypeUserNotesMetaData.urlImportedFromGoogleDocs;
  bool get isDocumentType => this == TypeUserNotesMetaData.documentType;
  bool get isOtherReferencesOnText =>
      this == TypeUserNotesMetaData.otherReferencesOnText;
}

/// Metadata for [UserNotes] to store additional information about the note
///
class UserNotesMetaData {
  ///for general use
  ///
  ///use [TypeUserNotesMetaData] as key for predefined metadata
  ///
  ///but the field is dynamic to allow any custom metadata to be added in the future without changing the model
  Map<String, dynamic> data;

  UserNotesMetaData({
    this.data = const {},
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory UserNotesMetaData.fromMap(Map<String, dynamic> map) {
    var result = UserNotesMetaData(
      data: map['data'] != null
          ? Map<String, dynamic>.from((map['data'] as Map<String, dynamic>))
          : const {},
    );
    //decoding the other references on text
    var key = TypeUserNotesMetaData.otherReferencesOnText.name;
    try {
      if (result.data[key] != null) {
        result.data[key] = List<Reference>.from(
          (result.data[key] as List).map(
            (e) => Reference.fromMap(e),
          ),
        );
      }
    } catch (e) {
      print('Error decoding other references on text on UserNotesMetaData: $e');
    }

    try {
      //decoding the google docs last sync
      key = TypeUserNotesMetaData.googleDocsLastSync.name;
      if (result.data[key] != null) {
        result.data[key] = DateTime.tryParse(
          result.data[key],
        );
      }
    } catch (e) {
      print('Error decoding google docs last sync on UserNotesMetaData: $e');
    }

    return result;
  }

  String toJson() => json.encode(toMap());

  factory UserNotesMetaData.fromJson(String source) =>
      UserNotesMetaData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserNotesMetaData(data: $data)';
}
