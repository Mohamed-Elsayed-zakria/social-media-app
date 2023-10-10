import '../../../posts/data/model/post_model.dart';
import '../../data/repository/video_screen_api.dart';

Future<List<PostModel>> getPostsOfTypeVideos() async {
  return VideoScreenApi().getPostsOfTypeVideos();
}
