import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileQrScreenRepo {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataProfileQrScreen();
}
