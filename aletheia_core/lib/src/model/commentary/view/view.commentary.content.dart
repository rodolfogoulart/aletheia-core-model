import 'package:aletheia_core/aletheia_core_model.dart';
import 'package:collection/collection.dart';

class CommentaryContentView {
  List<CommentaryContent> contents;
  List<CommentaryContent>? bookIntroduction;
  Commentary comentary;

  CommentaryContentView({
    required this.contents,
    required this.comentary,
    this.bookIntroduction,
  });

  @override
  bool operator ==(covariant CommentaryContentView other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.contents, contents) &&
        listEquals(other.bookIntroduction, bookIntroduction) &&
        other.comentary == comentary;
  }

  @override
  int get hashCode =>
      contents.hashCode ^ bookIntroduction.hashCode ^ comentary.hashCode;
}
