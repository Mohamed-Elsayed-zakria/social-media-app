import '../../data/repository/api/chat_screen_messages_api.dart';
import '../views/chat_uploade_images_screen.dart';
import '../views/chat_uploade_video_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/snack_bar.dart';
import '../../data/models/user_chat_data.dart';
import '../../data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

TextEditingController getTextEditeMessage = TextEditingController();
TextEditingController getMessageChat = TextEditingController();

VideoPlayerController? addVideoChatController;
File? addVideoChatPath;

RxList<String> chatImagePaths = <String>[].obs;
RxInt imageIndex = 0.obs;

Future<void> chatUploadeImageFromGalary({
  required UserChatData userData,
}) async {
  chatImagePaths.value = [];
  ImagePicker picker = ImagePicker();
  List<XFile> pickedImages = await picker.pickMultiImage();
  if (pickedImages.isNotEmpty) {
    for (var image in pickedImages) {
      chatImagePaths.add(image.path);
    }
    Get.to(() => ChatUploadeImagesScreen(userData: userData));
  }
}

void chatRemoveImage(int index) {
  chatImagePaths.removeAt(index);
  if (chatImagePaths.isEmpty) {
    Get.back();
  }
}

Future<void> chatUploadeImageFromCamera(
    {required UserChatData userData}) async {
  chatImagePaths.value = [];
  XFile? pickedImg = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedImg != null) {
    chatImagePaths.add(pickedImg.path);
    Get.to(() => ChatUploadeImagesScreen(userData: userData));
  }
}

Future<void> addVideoChatOpenGalary({required UserChatData userData}) async {
  XFile? pickedVideo = await ImagePicker().pickVideo(
    source: ImageSource.gallery,
  );

  if (pickedVideo != null) {
    File videoFile = File(pickedVideo.path);
    int videoSize = await videoFile.length();

    double videoSizeInMB = videoSize / (1024 * 1024);

    if (videoSizeInMB > 30) {
      snackBar(
        message: "The allowed video size is 30 MB".tr,
        isError: true,
      );
      return;
    }
    addVideoChatPath = videoFile;
    addVideoChatController = VideoPlayerController.file(addVideoChatPath!);
    if (addVideoChatController != null) {
      await addVideoChatController!.initialize();
      addVideoChatController!.play();
      Get.to(
        () => ChatUploadeVideoScreen(
          playerControllerPlay: addVideoChatController!,
          userData: userData,
        ),
      );
    }
  }
}

Stream<List<MessageModel>> getAllMessages({required String receiverId}) {
  return ChatScreenMessagesApi().getAllMessages(
    receiverId: receiverId,
  );
}

Future<void> updateMessagesReadStatus({
  required MessageModel messageData,
}) async {
  ChatScreenMessagesApi().updateMessagesReadStatus(messageData: messageData);
}

Future<void> sentNewMessage({
  required UserChatData userData,
  required String text,
  required String type,
}) async {
  ChatScreenMessagesApi().sentNewMessage(
    userData: userData,
    text: text,
    type: type,
  );
}

Future<void> deleteMessageForEveryone({
  required MessageModel messageData,
}) async {
  ChatScreenMessagesApi().deleteMessageForEveryone(messageData: messageData);
}

Future<void> deleteMessageForMe({required MessageModel messageData}) async {
  ChatScreenMessagesApi().deleteMessageForMe(messageData: messageData);
}

Future<void> reportMessage({required MessageModel messageData}) async {
  ChatScreenMessagesApi().reportMessage(messageData: messageData);
}

Future<void> updateMessage({
  required MessageModel messageData,
  required String newMessage,
}) async {
  ChatScreenMessagesApi().updateMessage(
    messageData: messageData,
    newMessage: newMessage,
  );
}
