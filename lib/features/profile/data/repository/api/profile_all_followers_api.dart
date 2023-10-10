import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/constant.dart';
import '../../models/profile_model.dart';
import '../profile_all_followers_repo.dart';

class ProfileAllFollowersApi extends ProfileAllFollowersRepo {
  @override
  Future<List<ProfileScreenModel>> getFollowerByUID({required String otherUid}) async {
    List<ProfileScreenModel> allFolowers = [];
    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Constant.userCollection)
        .doc(otherUid)
        .get();

    Map<String, dynamic>? followers = currentUserData.data();
    List followersList;

    if (followers != null) {
      followersList = followers['followers'] ?? [];
      for (var element in followersList) {
        DocumentSnapshot<Map<String, dynamic>> jsonData = await ApiService
            .firestore
            .collection(Constant.userCollection)
            .doc(element)
            .get();
        if (jsonData.exists) {
          var userData = jsonData.data();
          ProfileScreenModel followerData =
              ProfileScreenModel.fromJson(userData!);
          allFolowers.add(followerData);
        }
      }
    }
    return allFolowers;
  }

  @override
  Future<List<ProfileScreenModel>> getFollowingByUID({required String otherUid}) async {
    List<ProfileScreenModel> allFollowing = [];
    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Constant.userCollection)
        .doc(otherUid)
        .get();

    Map<String, dynamic>? following = currentUserData.data();
    List followingList;

    if (following != null) {
      followingList = following['following'] ?? [];
      for (var element in followingList) {
        DocumentSnapshot<Map<String, dynamic>> jsonData = await ApiService
            .firestore
            .collection(Constant.userCollection)
            .doc(element)
            .get();
        if (jsonData.exists) {
          var userData = jsonData.data();
          ProfileScreenModel followerData =
              ProfileScreenModel.fromJson(userData!);
          allFollowing.add(followerData);
        }
      }
    }
    return allFollowing;
  }
}
