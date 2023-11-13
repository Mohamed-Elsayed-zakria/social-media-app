import '../../../presentation/controllers/chat_screen_messages_controller.dart';
import '../../../../notifications/data/model/notice_model.dart';
import '../../../../../core/utils/get_current_date_time.dart';
import '../../../../../core/api/api_firebase_messaging.dart';
import '../../../../../core/model/current_user_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/api/api_service.dart';
import '../chat_screen_messages_repo.dart';
import '../../models/user_chat_data.dart';
import '../../models/message_model.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';

class ChatScreenMessagesApi extends ChatScreenMessagesRepo {
  @override
  Stream<List<MessageModel>> getAllMessages({
    required String receiverId,
  }) {
    final StreamController<List<MessageModel>> messagesController =
        StreamController<List<MessageModel>>();
    ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(receiverId)
        .collection(Collections.messageCollection)
        .orderBy('dateTime', descending: true)
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

  @override
  Future<void> sentNewMessageOfTypeText({
    required UserChatData userData,
    required String text,
  }) async {
    getMessageChat.clear();
    DateTime getCurrentDateTime = currentTimeDevice();
    String currentDateTime = getCurrentDateTime.toString();

    MessageModel messageModel = MessageModel(
      type: TypeChatMessage.text.name,
      receiverId: userData.personUid,
      senderId: ApiService.user.uid,
      dateTime: currentDateTime,
      videoUrl: '',
      imgUrl: [],
      message: text,
      isDelivered: false,
      isRead: '',
    );

    NoticeModel noticeModel = NoticeModel(
      personUid: ApiService.user.uid,
      sentTo: userData.token,
      textTitle: 'sent you a message',
      textBody: text,
      type: NoticeType.chat.name,
    );

    ApiFirebaseMessaging.sendNotfiy(
      noticeModel: noticeModel,
      username: CurrentUserData.username,
    );

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(userData.personUid)
        .collection(Collections.messageCollection)
        .doc(currentDateTime)
        .set(messageModel.toJson());

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(userData.personUid)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .doc(currentDateTime)
        .set(messageModel.toJson());
  }

  @override
  Future<void> sentNewMessageOfTypeImage({
    required UserChatData userData,
  }) async {
    DateTime getCurrentDateTime = currentTimeDevice();
    String currentDateTime = getCurrentDateTime.toString();
    List<String> imageUrls = [];

    if (chatImagePaths.isNotEmpty) {
      for (var imageFile in chatImagePaths) {
        String generatChatImageId = const Uuid().v1();
        final ref = ApiService.fireStorage.ref(
          'user-files/${ApiService.user.uid}/images/chats/$generatChatImageId.jpg',
        );
        await ref.putFile(File(imageFile));
        final downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
    }
    MessageModel messageModel = MessageModel(
      type: TypeChatMessage.image.name,
      receiverId: userData.personUid,
      senderId: ApiService.user.uid,
      dateTime: currentDateTime,
      videoUrl: '',
      imgUrl: imageUrls,
      message: '',
      isDelivered: false,
      isRead: '',
    );

    NoticeModel noticeModel = NoticeModel(
      personUid: ApiService.user.uid,
      sentTo: userData.token,
      textTitle: 'sent you a message',
      textBody: 'image',
      type: NoticeType.chat.name,
    );

    ApiFirebaseMessaging.sendNotfiy(
      noticeModel: noticeModel,
      username: CurrentUserData.username,
    );

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(userData.personUid)
        .collection(Collections.messageCollection)
        .doc(currentDateTime)
        .set(messageModel.toJson());

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(userData.personUid)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .doc(currentDateTime)
        .set(messageModel.toJson());
    if (chatImagePaths.isNotEmpty) {
      chatImagePaths.value = [];
    }
  }

  @override
  Future<void> sentNewMessageOfTypeVideo({
    required UserChatData userData,
  }) async {
    DateTime getCurrentDateTime = currentTimeDevice();
    String currentDateTime = getCurrentDateTime.toString();
    String videoUrl = '';

    if (addVideoChatPath != null) {
      String generatChatVideoId = const Uuid().v1();
      final storageRef = FirebaseStorage.instance.ref(
        'user-files/${ApiService.user.uid}/video/chat/$generatChatVideoId.mp4',
      );
      await storageRef.putFile(addVideoChatPath!);
      videoUrl = await storageRef.getDownloadURL();
    }

    MessageModel messageModel = MessageModel(
      receiverId: userData.personUid,
      senderId: ApiService.user.uid,
      dateTime: currentDateTime,
      videoUrl: videoUrl,
      imgUrl: [],
      message: '',
      type: TypeChatMessage.video.name,
      isDelivered: false,
      isRead: '',
    );

    NoticeModel noticeModel = NoticeModel(
      personUid: ApiService.user.uid,
      sentTo: userData.token,
      textTitle: 'sent you a message',
      textBody: 'video',
      type: NoticeType.chat.name,
    );

    ApiFirebaseMessaging.sendNotfiy(
      noticeModel: noticeModel,
      username: CurrentUserData.username,
    );

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(userData.personUid)
        .collection(Collections.messageCollection)
        .doc(currentDateTime)
        .set(messageModel.toJson());

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(userData.personUid)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .doc(currentDateTime)
        .set(messageModel.toJson());

    if (addVideoChatPath != null) {
      addVideoChatController!.dispose();
      addVideoChatPath = null;
    }
  }

  @override
  Future<void> updateMessagesReadStatus({
    required MessageModel messageData,
  }) async {
    String currentDateTime = currentTimeDevice().toString();
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(messageData.senderId)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .doc(messageData.dateTime)
        .update({'isRead': currentDateTime});
  }

  @override
  Future<void> deleteMessageForEveryone({
    required MessageModel messageData,
  }) async {
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(messageData.receiverId)
        .collection(Collections.messageCollection)
        .doc(messageData.dateTime)
        .delete();

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(messageData.receiverId)
        .collection(Collections.chatCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.messageCollection)
        .doc(messageData.dateTime)
        .delete()
        .then(
          (value) => showToast(msg: "The message has been deleted".tr),
        );
  }

  @override
  Future<void> deleteMessageForMe({required MessageModel messageData}) async {
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.chatCollection)
        .doc(messageData.receiverId)
        .collection(Collections.messageCollection)
        .doc(messageData.dateTime)
        .delete();
  }

  @override
  Future<void> reportMessage({required MessageModel messageData}) async {
    await ApiService.firestore
        .collection(Collections.reportMessageCollection)
        .add(messageData.toJson())
        .then(
          (value) => showToast(msg: "The message has been reported".tr),
        );
  }

  @override
  Future<void> updateMessage({
    required MessageModel messageData,
    required String newMessage,
  }) async {
    DateTime getCurrentDateTime = DateTime.now();
    DateTime messageTime = DateTime.parse(messageData.dateTime);

    int minutesDifference =
        getCurrentDateTime.difference(messageTime).inMinutes;

    if (minutesDifference <= 30) {
      await ApiService.firestore
          .collection(Collections.userCollection)
          .doc(ApiService.user.uid)
          .collection(Collections.chatCollection)
          .doc(messageData.receiverId)
          .collection(Collections.messageCollection)
          .doc(messageData.dateTime)
          .update({'message': newMessage});

      await ApiService.firestore
          .collection(Collections.userCollection)
          .doc(messageData.receiverId)
          .collection(Collections.chatCollection)
          .doc(ApiService.user.uid)
          .collection(Collections.messageCollection)
          .doc(messageData.dateTime)
          .update({'message': newMessage});
    } else {
      showToast(msg: 'You can no longer edite the message'.tr);
    }
  }
}
