import 'package:aletheia_core_model/model/commentary/commentary.content.dart';
import 'package:aletheia_core_model/model/commentary/commentary.dart';

abstract class InterfaceRepositoryCommentary {
  Future<Commentary?> insertCommentary(Commentary commentary);

  Future<Commentary> updateCommentary(Commentary commentary);

  Future<List<Commentary>> getCommentary({int? id, String? name, bool nameEqual = false});

  Future<CommentaryContent?> insertCommentaryContent(CommentaryContent content);

  Future<int> deleteAllContent(int idCommentary);

  Future<List<CommentaryContent>> getCommentaryContent({
    int? id,
    int? idBook,
    required int idCommentary,
    int? chapter,
    int? verse,
  });

  Future<int> isDatabaseEmpty();
}
