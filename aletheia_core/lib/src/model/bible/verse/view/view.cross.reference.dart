import 'package:aletheia_core/aletheia_core_model.dart';

class ViewCrossReference {
  VerseView verse;
  VerseCrossReference verseCrossReference;

  ViewCrossReference({
    required this.verse,
    required this.verseCrossReference,
  });

  @override
  bool operator ==(covariant ViewCrossReference other) {
    if (identical(this, other)) return true;

    return other.verse == verse &&
        other.verseCrossReference == verseCrossReference;
  }

  @override
  int get hashCode => verse.hashCode ^ verseCrossReference.hashCode;

  @override
  String toString() =>
      'ViewCrossReference(verse: $verse, verseCrossReference: $verseCrossReference)';
}
