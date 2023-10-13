import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/features/settings/data/models/block_users_model.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../block_users_repo.dart';

class BlockUserApi implements BlockUserRepo {
  @override
  Future<List<BlockUserModel>> getAllBlockUsers() async {
    List<BlockUserModel> blockUser = [];
    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .get();
    Map<String, dynamic>? jsonCurrentUserData = currentUserData.data();

    List<String> blockedUIDs = List<String>.from(
      jsonCurrentUserData!['listBlock'],
    );
    for (var userUid in blockedUIDs) {
      DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
          .firestore
          .collection(Collections.userCollection)
          .doc(userUid)
          .get();
      if (userDataDoc.exists) {
        var userData = userDataDoc.data();
        BlockUserModel blockUserModel = BlockUserModel.fromJson(userData!);
        blockUser.add(blockUserModel);
      }
    }
    return blockUser;
  }
}
