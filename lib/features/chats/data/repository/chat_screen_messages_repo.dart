import '../models/user_chat_data.dart';
import '../models/message_model.dart';

abstract class ChatScreenMessagesRepo {
  Stream<List<MessageModel>> getAllMessages({required String receiverId});
  Future<void> sentNewMessage({
    required UserChatData userData,
    required String text,
  });
}
