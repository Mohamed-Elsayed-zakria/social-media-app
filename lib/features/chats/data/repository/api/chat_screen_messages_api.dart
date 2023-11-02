import '../../../presentation/controllers/chat_screen_messages_controller.dart';
import '../../../../notifications/data/model/notice_model.dart';
import '../../../../../core/api/api_firebase_messaging.dart';
import '../../../../../core/model/current_user_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  Future<void> updateMessagesReadStatus({
    required MessageModel messageData,
  }) async {
    String currentDateTime = DateTime.timestamp().toString();
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
  Future<void> sentNewMessage({
    required UserChatData userData,
    required String text,
    required String type,
  }) async {
    getMessageChat.clear();
    String currentDateTime = DateTime.timestamp().toString();
    List<String> imageUrls = [];
    String videoUrl = '';
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

    if (chatImagePaths.isNotEmpty) {
      for (var imageFile in chatImagePaths) {
        String generatChatImageId = const Uuid().v1();
        final ref = ApiService.fireStorage.ref().child(
              "user-chat/${ApiService.user.uid}/chats-images/$generatChatImageId.jpg",
            );
        await ref.putFile(File(imageFile));
        final downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
    }

    if (addVideoChatPath != null) {
      String generatChatVideoId = const Uuid().v1();
      final storageRef = FirebaseStorage.instance.ref(
        "user-chat/${ApiService.user.uid}/chats-videos/$generatChatVideoId.mp4",
      );
      await storageRef.putFile(addVideoChatPath!);
      videoUrl = await storageRef.getDownloadURL();
    }

    MessageModel messageModel = MessageModel(
      receiverId: userData.personUid,
      senderId: ApiService.user.uid,
      dateTime: currentDateTime,
      videoUrl: videoUrl,
      imgUrl: imageUrls,
      message: text,
      type: type,
      isDelivered: false,
      isRead: '',
    );

    try {
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
      if (addVideoChatPath != null) {
        addVideoChatController!.dispose();
        addVideoChatPath = null;
      }
    } catch (e) {
      if (chatImagePaths.isNotEmpty) {
        chatImagePaths.value = [];
      }
      if (addVideoChatPath != null) {
        addVideoChatController!.dispose();
        addVideoChatPath = null;
      }
    }
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
          (value) => Fluttertoast.showToast(
            msg: "The message has been deleted".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          ),
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
          (value) => Fluttertoast.showToast(
            msg: "The message has been reported".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          ),
        );
  }

  @override
  Future<void> updateMessage({
    required MessageModel messageData,
    required String newMessage,
  }) async {
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
  }
}
