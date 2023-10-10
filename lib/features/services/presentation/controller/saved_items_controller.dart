import '../../../posts/data/model/post_model.dart';
import '../../data/repository/api/saved_items_api.dart';


Future<List<PostModel>> getPostsToSavedItems() async {
  return SavedItemsApi().getPostsToSavedItems();
}
