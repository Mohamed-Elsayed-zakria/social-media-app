import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../posts/data/model/post_model.dart';
import '../../../stories/data/model/stories_model.dart';

abstract class HomeScreenRepo {
  Future<DocumentSnapshot<Map<String, dynamic>>> getAllUserData();

  Future<List<StoriesModel>> getCurrentUserStory();

  Future<List<List<StoriesModel>>> getAllUsersStories();

  Future<List<PostModel>> getAllPosts();
}
