import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SettingsScreenRepo {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getuserDataToSettings();
  Future<void> exitFromApp();
}
