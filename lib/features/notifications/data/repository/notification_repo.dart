import '../model/notice_model.dart';

abstract class NotificationRepo {
  Future<List<NoticeModel>> getAllNotification();
}
