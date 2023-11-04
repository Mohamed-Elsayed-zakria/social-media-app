import '../../data/repository/api/chat_screen_messages_api.dart';
import '../views/chat_uploade_video_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constant/colors.dart';
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

Future<void> chatUploadeImage() async {
  final picker = ImagePicker();
  final pickedImages = await picker.pickMultiImage();

  if (pickedImages.isNotEmpty) {
    for (var image in pickedImages) {
      chatImagePaths.add(image.path);
    }
  }
}

void chatRemoveImage(int index) {
  chatImagePaths.removeAt(index);
}

Future<void> addVideoChatOpenGalary({required UserChatData userData}) async {
  final pickedVideo = await ImagePicker().pickVideo(
    source: ImageSource.gallery,
  );

  if (pickedVideo != null) {
    final videoFile = File(pickedVideo.path);
    final videoSize = await videoFile.length();

    final double videoSizeInMB = videoSize / (1024 * 1024);
    if (videoSizeInMB > 30) {
      Get.snackbar(
        "Error".tr,
        "The allowed video size is 30 MB".tr,
        backgroundColor: AppColors.kErrorColor,
        colorText: AppColors.kSurfaceColor,
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
