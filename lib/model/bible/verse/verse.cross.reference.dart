import 'verse.dart';

class VerseCrossReference {
  int id;
  //from
  int idBook;
  int numberChapter;
  int numberVerse;
  //cross reference
  int idBookReference;
  int? numberVerseEnd;
  List<VerseView> reference;
  VerseCrossReference({
    required this.id,
    required this.idBook,
    required this.numberChapter,
    required this.numberVerse,
    required this.idBookReference,
    this.numberVerseEnd,
    required this.reference,
  });
}

class ViewCrossReference {
  VerseView verse;
  VerseCrossReference verseCrossReference;

  ViewCrossReference({
    required this.verse,
    required this.verseCrossReference,
  });
}
