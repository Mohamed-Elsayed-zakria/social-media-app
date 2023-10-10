import '../../features/chats/presentation/views/chat_screen_all_users.dart';
import '../../features/notifications/data/model/notice_model.dart';
import '../../features/profile/presentation/views/profile_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import '../constant/constant.dart';
import 'package:get/get.dart';
import 'api_service.dart';
import 'dart:convert';

abstract class ApiFirebaseMessaging {
  static String serverKey =
      'AAAAq_AsTMA:APA91bFDTSROZ94mLjbnwAYtMsMGsfkiAjEaB_eaub5bcHEAFi-hsRf60vrUu8_Vv-g-Hzxw9Zu0JBXaU9AHmoYCeOXOwcf3rWgXiHXqoA24X37O7aDc_xmh5HVZX1XbCShzcFchoeW2';

  static void sendNotfiy({
    required NoticeModel noticeModel,
    required String username,
  }) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      },
      body: jsonEncode(
        {
          'notification': {
            'title': '$username ${noticeModel.textTitle}',
            'body': noticeModel.textBody,
          },
          'priority': 'high',
          'data': {
            'datePublished': DateTime.timestamp().toString(),
            'type': noticeModel.type.toString(),
            'userUid': noticeModel.personUid,
            'username': username,
          },
          'to': noticeModel.sentTo,
        },
      ),
    );
  }

  static Future<String?> getToken() async {
    return await ApiService.firebaseMessaging.getToken();
  }

  static void initializeAwesomeNotifications() {
    AwesomeNotifications().initialize(
      '',
      [
        NotificationChannel(
          channelKey: 'firebaseKey',
          channelName: 'firebaseChannel',
          channelDescription: 'firebase test',
          playSound: true,
          channelShowBadge: true,
          importance: NotificationImportance.High,
        ),
      ],
    );
  }

  static Future<void> onMessageOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        if (message.data['type'] == 'chat') {
          Get.to(() => const ChatScreenAllUsers());
        } else if (message.data['type'] == 'profile') {
          Get.to(() => ProfileScreen(otherUid: message.data['userUid']));
        }
      }
    });
  }

//======================save note===================
  static void firebaseMessagingForeground() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: 1,
              channelKey: 'firebaseKey',
              title:
                  "${message.data['username']} ${message.notification!.title}",
              body: message.notification!.body,
            ),
          );
          ApiService.firestore
              .collection(Constant.userCollection)
              .doc(ApiService.user.uid)
              .collection(Constant.notificationCollection)
              .add({
            'textTitle': message.notification!.title,
            'textBody': message.notification!.body,
            'personUid': message.data['userUid'],
            'datePublished': message.data['datePublished'],
            'type': message.data['type'],
          });
          // if (message.data['type'] == 'chat') {
          //   Get.to(() => const ChatScreenAllUsers());
          // } else if (message.data['type'] == 'profile') {
          //   Get.to(() => ProfileScreen(otherUid: message.data['userUid']));
          // }
        }
      },
    );
  }

  static Future<void> firebaseMessagingBackground(RemoteMessage message) async {
    if (message.notification != null) {
      ApiService.firestore
          .collection(Constant.userCollection)
          .doc(ApiService.user.uid)
          .collection(Constant.notificationCollection)
          .add({
        'textTitle': message.notification!.title,
        'textBody': message.notification!.body,
        'personUid': message.data['userUid'],
        'datePublished': message.data['datePublished'],
        'type': message.data['type'],
      });
    }
  }
}
