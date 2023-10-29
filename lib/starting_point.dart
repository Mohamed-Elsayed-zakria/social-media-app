import 'package:flash/core/utils/app_storage.dart';

import 'features/main_home/presentation/views/main_home_screen.dart';
import 'features/auth/presentation/views/add_details_screen.dart';
import 'features/auth/presentation/views/splash_screen.dart';
import 'features/auth/presentation/views/login_screen.dart';
import 'core/localization/app_locale.dart';
import 'core/model/current_user_data.dart';
import 'core/constant/collections.dart';
import 'package:flutter/material.dart';
import 'core/api/api_service.dart';
import 'core/constant/colors.dart';
import 'package:get/get.dart';

class FlashApp extends StatelessWidget {
  const FlashApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLocalization(),
      locale: appStorage.read('language') == null
          ? Get.deviceLocale
          : Locale(appStorage.read('language')),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.kSurfaceColor),
        colorScheme: ColorScheme.fromSeed(
          background: AppColors.kSurfaceColor,
          seedColor: AppColors.kPrimaryColor,
          surfaceTint: AppColors.kSurfaceColor,
          inversePrimary: AppColors.kPrimaryColor,
        ),
        useMaterial3: true,
      ),
      // home: const MainHomeScreen(),
      home: StreamBuilder(
        stream: ApiService.auth.authStateChanges(),
        builder: (context, hasAccountSnapshot) {
          if (hasAccountSnapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else if (hasAccountSnapshot.hasData) {
            return FutureBuilder(
              future: ApiService.firestore
                  .collection(Collections.userCollection)
                  .doc(ApiService.user.uid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SplashScreen();
                } else if (snapshot.hasError) {
                  return const SplashScreen();
                } else if (!snapshot.hasData || !snapshot.data!.exists) {
                  return const AddDetailsScreen();
                } else {
                  Map<String, dynamic> json =
                      snapshot.data!.data() as Map<String, dynamic>;
                  CurrentUserData.fromJson(json);
                  return const MainHomeScreen();
                }
              },
            );
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
