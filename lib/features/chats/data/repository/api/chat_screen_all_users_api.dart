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
    List<Map<String, dynamic>> allUserData = [];
    List<UserChatData> sortedUserData = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .where('personUid', isNotEqualTo: ApiService.user.uid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> userData = doc.data();
        QuerySnapshot<Map<String, dynamic>> lastMessageSnapshot =
            await ApiService.firestore
                .collection(Collections.userCollection)
                .doc(ApiService.user.uid)
                .collection(Collections.chatCollection)
                .doc(userData['personUid'])
                .collection(Collections.messageCollection)
                .orderBy('dateTime', descending: true)
                .limit(1)
                .get();
        DateTime lastMessageTime;
        if (lastMessageSnapshot.docs.isNotEmpty) {
          Map<String, dynamic> lastMessageData =
              lastMessageSnapshot.docs.first.data();
          lastMessageTime = DateTime.parse(lastMessageData['dateTime']);
          userData['lastMessageTime'] = lastMessageTime;
          allUserData.add(userData);
        } else {
          DateTime lastMessageTime = ApiService.user.metadata.creationTime!;
          userData['lastMessageTime'] = lastMessageTime;
          allUserData.add(userData);
        }
      }

      // Sort the list based on last message time in descending order
      allUserData.sort(
        (a, b) => (b['lastMessageTime'] as DateTime)
            .compareTo(a['lastMessageTime'] as DateTime),
      );

      // Convert the list of maps to a list of UserChatData
      sortedUserData = allUserData
          .map((userData) => UserChatData.fromJson(userData))
          .toList();
    }

    return sortedUserData;
  }

  @override
  Stream<List<MessageModel>> getLastMessages({
    required String otherUserId,
  }) {
    final StreamController<List<MessageModel>> messagesController =
        StreamController<List<MessageModel>>();
    ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(otherUserId)
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
