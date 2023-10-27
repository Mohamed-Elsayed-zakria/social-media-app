import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/api/api_firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'core/api/api_service.dart';
import 'firebase_options.dart';
import 'starting_point.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.firebaseMessaging.requestPermission();
  ApiFirebaseMessaging.initializeAwesomeNotifications();
  ApiFirebaseMessaging.firebaseMessagingForeground();
  ApiFirebaseMessaging.onMessageOpenedApp();
  FirebaseMessaging.onBackgroundMessage(
    ApiFirebaseMessaging.firebaseMessagingBackground,
  );
  runApp(const FlashApp());
}
