import '../models/user_chat_data.dart';
import '../models/message_model.dart';

abstract class ChatScreenAllUsersRepo {
  Future<List<UserChatData>> getUserDataToChat();
  Stream<List<MessageModel>> getLastMessages({required String otherUserId});
}
