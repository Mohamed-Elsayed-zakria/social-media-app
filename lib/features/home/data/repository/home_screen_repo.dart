import '../../../posts/data/model/post_model.dart';
import '../../../stories/data/model/stories_model.dart';

abstract class HomeScreenRepo {
  Future<String> getPersonalPicture();

  Future<List<StoriesModel>> getCurrentUserStory();

  Future<List<List<StoriesModel>>> getAllUsersStories();

  Future<List<PostModel>> getAllPosts();
}
