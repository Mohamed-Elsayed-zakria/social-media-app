import '../models/user_chat_data.dart';
import '../models/message_model.dart';

abstract class ChatScreenMessagesRepo {
  Stream<List<MessageModel>> getAllMessages({required String receiverId});
  Future<void> sentNewMessageOfTypeText({
    required UserChatData userData,
    required String text,
  });
  Future<void> sentNewMessageOfTypeImage({
    required UserChatData userData,
  });
  Future<void> sentNewMessageOfTypeVideo({
    required UserChatData userData,
  });
  Future<void> updateMessagesReadStatus({required MessageModel messageData});
  Future<void> deleteMessageForEveryone({required MessageModel messageData});
  Future<void> deleteMessageForMe({required MessageModel messageData});
  Future<void> reportMessage({required MessageModel messageData});
  Future<void> updateMessage({
    required MessageModel messageData,
    required String newMessage,
  });
}
