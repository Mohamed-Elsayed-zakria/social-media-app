import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../chat_screen_all_users_repo.dart';
import '../../models/user_chat_data.dart';
import '../../models/message_model.dart';
import 'dart:async';

class ChatScreenAllUsersApi extends ChatScreenAllUsersRepo {
  @override
  Future<List<UserChatData>> getUserDataToChat() async {
    List<UserChatData> allUserData = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .where('personUid', isNotEqualTo: ApiService.user.uid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        UserChatData userChatData = UserChatData.fromJson(doc.data());
        allUserData.add(userChatData);
      }
    }
    return allUserData;
  }

  @override
  Stream<List<MessageModel>> getLastMessages({
    required String otherUserId,
  }) {
    final StreamController<List<MessageModel>> messagesController =
        StreamController<List<MessageModel>>();
    ApiService.firestore
        .collection(Collections.userCollection)
        .doc(otherUserId)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .orderBy("dateTime", descending: true)
        .limit(1)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List<MessageModel> allMessagelist = [];
      for (var doc in querySnapshot.docs) {
        MessageModel userChatData = MessageModel.fromJson(doc.data());
        allMessagelist.add(userChatData);
      }
      messagesController.add(allMessagelist);
    });

    return messagesController.stream;
  }
}
