import '../../data/repository/api/chat_screen_all_users_api.dart';
import '../../data/models/user_chat_data.dart';
import '../../data/models/message_model.dart';

Future<List<UserChatData>> getUserDataToChat() {
  return ChatScreenAllUsersApi().getUserDataToChat();
}

Stream<List<MessageModel>> getLastMessages({required String otherUserId}) {
  return ChatScreenAllUsersApi().getLastMessages(otherUserId: otherUserId);
}
