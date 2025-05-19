import 'package:aletheia_core/aletheia_core_model.dart';

abstract class InterfaceControllerCommentary {
  Future<Commentary?> insertCommentary(Commentary commentary);

  Future<Commentary> updateCommentary(Commentary commentary);

  ///if search for [name], then [nameEqual] if true apply the equal, else apply the like %name% to the search
  Future<List<Commentary>> getCommentary({
    int? id,
    String? name,
    bool nameEqual = false,
  });
  Future<CommentaryContent?> insertCommentaryContent(CommentaryContent content);

  Future<List<CommentaryContent>> getCommentaryContent({
    int? id,
    int? idBook,
    required int idCommentary,
    int? chapter,
    int? verse,
  });

  /// when [chapter] is null, get the commentary for the book introduction
  ///
  /// this rule need to be set on [DAO] side
  Future<CommentaryContentView?> getCommentaryFromChapter({
    required int idBook,
    int? chapter,
    int? idCommentary,
  });

  Future<int> deleteAllCommentary(int idCommentary);
}
