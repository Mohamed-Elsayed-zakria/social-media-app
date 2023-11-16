import '../../data/repository/api/saved_items_api.dart';
import '../../../posts/data/model/post_model.dart';
import 'package:get/get.dart';

class SavedItemsController extends GetxController {}

Future<List<PostModel>> getPostsToSavedItems() async {
  return SavedItemsApi().getPostsToSavedItems();
}
