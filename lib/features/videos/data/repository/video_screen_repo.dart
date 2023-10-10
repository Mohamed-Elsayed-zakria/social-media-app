import '../../../posts/data/model/post_model.dart';

abstract class VideoScreenRepo {
  Future<List<PostModel>> getPostsOfTypeVideos();
}
