import 'features/main_home/presentation/views/main_home_screen.dart';
import 'features/auth/presentation/views/add_details_screen.dart';
import 'features/auth/presentation/views/splash_screen.dart';
import 'features/auth/presentation/views/login_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/api/api_firebase_messaging.dart';
import 'core/localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'core/constant/constant.dart';
import 'core/api/api_service.dart';
import 'core/constant/colors.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

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

class FlashApp extends StatelessWidget {
  const FlashApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLocalization(),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          background: AppColors.kSurfaceColor,
          seedColor: AppColors.kPrimaryColor,
          surfaceTint: AppColors.kSurfaceColor,
          inversePrimary: AppColors.kPrimaryColor,
        ),
        useMaterial3: true,
      ),
      home: const MainHomeScreen(),
      // home: StreamBuilder(
      //   stream: ApiService.auth.authStateChanges(),
      //   builder: (context, hasAccountSnapshot) {
      //     if (hasAccountSnapshot.connectionState == ConnectionState.waiting) {
      //       return const SplashScreen();
      //     } else if (hasAccountSnapshot.hasData) {
      //       return FutureBuilder<DocumentSnapshot>(
      //         future: ApiService.firestore
      //             .collection(Constant.userCollection)
      //             .doc(ApiService.user.uid)
      //             .get(),
      //         builder: (context, snapshot) {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return const SplashScreen();
      //           } else if (snapshot.hasError) {
      //             return const SplashScreen();
      //           } else if (!snapshot.hasData || !snapshot.data!.exists) {
      //             return const AddDetailsScreen();
      //           } else {
      //             return const MainHomeScreen();
      //           }
      //         },
      //       );
      //     } else {
      //       return const LoginScreen();
      //     }
      //   },
      // ),
    );
  }
}
