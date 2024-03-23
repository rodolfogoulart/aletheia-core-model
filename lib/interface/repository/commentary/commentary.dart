import 'package:aletheia_core_model/model/commentary/commentary.content.dart';
import 'package:aletheia_core_model/model/commentary/commentary.dart';

abstract class InterfaceRepositoryCommentary {
  Future<Commentary?> insertCommentary(Commentary commentary);

  Future<Commentary> updateCommentary(Commentary commentary);

  Future<List<Commentary>> getCommentary({int? id, String? name, bool nameEqual = false});

  Future<CommentaryContent?> insertCommentaryContent(CommentaryContent content);

  ///## Atention, use this with caution
  Future<int> deleteAllContent(int idCommentary);

  /// when [chapter] is null, get the commentary for the book introduction
  ///
  /// this rule need to be set on [DAO] side
  Future<List<CommentaryContent>> getCommentaryContent({
    int? id,
    int? idBook,
    required int idCommentary,
    int? chapter,
    int? verse,
  });

  Future<int> isDatabaseEmpty();
}
