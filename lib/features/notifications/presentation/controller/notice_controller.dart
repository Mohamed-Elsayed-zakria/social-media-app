import '../../data/model/notice_model.dart';
import '../../data/repository/notification_api.dart';

Future<List<NoticeModel>> getAllNotification() async {
  return NotificationApi().getAllNotification();
}
