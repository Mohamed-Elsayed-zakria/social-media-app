import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/repository/api/profile_qr_screen_api.dart';

Future<DocumentSnapshot<Map<String, dynamic>>> getUserDataProfileQrScreen() {
  return ProfileQrScreenApi().getUserDataProfileQrScreen();
}
