import '../../../posts/data/model/post_model.dart';

abstract class SavedItemsRepo {
  Future<List<PostModel>> getPostsToSavedItems();
}
