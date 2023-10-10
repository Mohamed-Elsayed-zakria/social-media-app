import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/core/constant/constant.dart';
import '../../../../core/api/api_service.dart';
import '../../../posts/data/model/post_model.dart';
import '../../../stories/data/model/stories_model.dart';
import 'home_screen_repo.dart';

class HomeScreenApi extends HomeScreenRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getAllUserData() async {
    return await ApiService.firestore
        .collection(Constant.userCollection)
        .doc(ApiService.user.uid)
        .get();
  }

  @override
  Future<List<StoriesModel>> getCurrentUserStory() async {
    List<StoriesModel> storiesData = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Constant.userCollection)
        .doc(ApiService.user.uid)
        .collection(Constant.storyCollection)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> allData = {};
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Constant.userCollection)
            .doc(ApiService.user.uid)
            .get();
        var userData = userDataDoc.data();
        data.addAll(userData!);
        allData = data;
        StoriesModel postModel = StoriesModel.fromJson(allData);
        storiesData.add(postModel);
      }
    }
    return storiesData;
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> allPosts = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await ApiService.firestore.collection(Constant.postCollection).get();

    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> allData = {};
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Constant.userCollection)
            .doc(data['personUid'])
            .get();
        if (userDataDoc.exists) {
          var userData = userDataDoc.data();
          data.addAll(userData!);
          allData = data;
          PostModel postModel = PostModel.fromJson(allData);
          allPosts.add(postModel);
        }
      }
    }
    return allPosts;
  }

  @override
  Future<List<List<StoriesModel>>> getAllUsersStories() async {
    List<List<StoriesModel>> allStoriesList = [];

    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Constant.userCollection)
        .doc(ApiService.user.uid)
        .get();
    Map<String, dynamic>? jsonFollowingList = currentUserData.data();

    StoriesModel getFollowingList = StoriesModel.fromJson(jsonFollowingList!);
    List followingList = getFollowingList.followingList;

    for (var userUid in followingList) {
      List<StoriesModel> userStories = [];

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
          .firestore
          .collection(Constant.userCollection)
          .doc(userUid)
          .collection(Constant.storyCollection)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          var data = doc.data();
          DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
              .firestore
              .collection(Constant.userCollection)
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
