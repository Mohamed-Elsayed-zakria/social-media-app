import '../../data/repository/api/profile_edite_more_api.dart';

Future<void> addUserToListBlock({
  required String otherUid,
}) async {
  ProfileEditeMoreApi().addUserToListBlock(otherUid: otherUid);
}

Future<void> deleteUserFromListBlock({
  required String otherUid,
}) async {
  ProfileEditeMoreApi().deleteUserFromListBlock(otherUid: otherUid);
}
