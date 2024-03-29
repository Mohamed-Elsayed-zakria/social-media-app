import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/constant/collections.dart';
import '../model/notice_model.dart';
import 'notification_repo.dart';

class NotificationApi implements NotificationRepo {
  @override
  Future<List<NoticeModel>> getAllNotification() async {
    List<NoticeModel> allNotification = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.notificationCollection)
        .orderBy('datePublished', descending: true)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> allData = {};
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Collections.userCollection)
            .doc(data['personUid'])
            .get();

        if (userDataDoc.exists) {
          Map<String, dynamic>? userData = userDataDoc.data();
          data.addAll(userData!);
          allData = data;
          NoticeModel noteData = NoticeModel.fromJson(allData);
          allNotification.add(noteData);
        }
      }
    }

    return allNotification;
  }
}
