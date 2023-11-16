import '../../../../../core/utils/get_current_date_time.dart';
import '../../../../stories/data/model/stories_model.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../posts/data/model/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../home_screen_repo.dart';

class HomeScreenApi extends HomeScreenRepo {
  @override
  Future<List<StoriesModel>> getCurrentUserStory() async {
    List<StoriesModel> storiesData = [];

    DateTime currentTime = await getServerTime();

    DateTime twentyFourHoursAgo = currentTime.subtract(
      const Duration(hours: 24),
    );

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.storyCollection)
        .where('datePublish',
            isGreaterThanOrEqualTo: twentyFourHoursAgo.toUtc().toString())
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .get();
        var userData = userDataDoc.data();
        data.addAll(userData!);
        StoriesModel postModel = StoriesModel.fromJson(data);
        storiesData.add(postModel);
      }
    }
    return storiesData;
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> allPosts = [];

    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .get();

    List<String> followers = List<String>.from(
      currentUserData['followers'],
    );

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.postCollection)
        .where('postStatus', isNotEqualTo: "Private")
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> allData = {};
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();

        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Collections.userCollection)
            .doc(data['personUid'])
            .get();
        if (userDataDoc.exists) {
          Map<String, dynamic>? userData = userDataDoc.data();
          data.addAll(userData!);
          allData = data;
          if (allData['personUid'] == ApiService.user.uid) {
            PostModel postModel = PostModel.fromJson(allData);
            allPosts.add(postModel);
          } else if (allData['postStatus'] == "Following") {
            if (followers.contains(allData['personUid'])) {
              PostModel postModel = PostModel.fromJson(allData);
              allPosts.add(postModel);
            }
          } else {
            PostModel postModel = PostModel.fromJson(allData);
            allPosts.add(postModel);
          }
        }
      }
    }
    return allPosts;
  }

  @override
  Future<List<List<StoriesModel>>> getAllUsersStories() async {
    List<List<StoriesModel>> allStoriesList = [];
    DateTime currentTime = await getServerTime();

    DateTime twentyFourHoursAgo = currentTime.subtract(
      const Duration(hours: 24),
    );

    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .get();
    Map<String, dynamic>? jsonFollowingList = currentUserData.data();

    StoriesModel getFollowingList = StoriesModel.fromJson(jsonFollowingList!);
    List followingList = getFollowingList.followingList;

    for (var userUid in followingList) {
      List<StoriesModel> userStories = [];

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
          .firestore
          .collection(Collections.userCollection)
          .doc(userUid)
          .collection(Collections.storyCollection)
          .where('datePublish',
              isGreaterThanOrEqualTo: twentyFourHoursAgo.toUtc().toString())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          var data = doc.data();
          DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
              .firestore
              .collection(Collections.userCollection)
              .doc(data['personUid'])
              .get();
          if (userDataDoc.exists) {
            var userData = userDataDoc.data();
            data.addAll(userData!);

            StoriesModel story = StoriesModel.fromJson(data);
            userStories.add(story);
          }
        }
      }
      if (userStories.isNotEmpty) {
        allStoriesList.add(userStories);
      }
    }

    return allStoriesList;
  }
}
