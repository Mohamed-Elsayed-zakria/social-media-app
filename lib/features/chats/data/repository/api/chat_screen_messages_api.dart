import '../../../../../core/constant/collections.dart';
import '../../../../notifications/data/model/notice_model.dart';
import '../../../presentation/controllers/chat_screen_messages_controller.dart';
import '../../../../../core/api/api_firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../chat_screen_messages_repo.dart';
import '../../models/user_chat_data.dart';
import '../../models/message_model.dart';

class ChatScreenMessagesApi extends ChatScreenMessagesRepo {
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages({
    required String receiverId,
  }) {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(receiverId)
        .collection(Collections.messageCollection)
        .orderBy('dateTime', descending: true)
        .snapshots();
  }

  @override
  Future<void> sentNewMessage({
    required String text,
    required UserChatData userData,
  }) async {
    MessageModel messageModel = MessageModel(
      type: Type.text.name,
      senderId: ApiService.user.uid,
      receiverId: userData.personUid,
      dateTime: DateTime.timestamp().toString(),
      message: text,
    );
    getMessageChat.clear();
    NoticeModel noticeModel = NoticeModel(
      personUid: ApiService.user.uid,
      sentTo: userData.token,
      textTitle: 'sent you a message',
      textBody: text,
      type: NoticeType.chat.name,
    );
    String currentUsername = await ApiService.getCurrentUsername();

    ApiFirebaseMessaging.sendNotfiy(
      noticeModel: noticeModel,
      username: currentUsername,
    );

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(userData.personUid)
        .collection(Collections.messageCollection)
        .add(messageModel.toJson());

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(userData.personUid)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .add(messageModel.toJson());
  }
}
