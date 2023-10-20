import 'package:get/get.dart';

import '../../data/models/profile_model.dart';
import '../controller/profile_qr_screen_controller.dart';
import 'widgets/profile_qr_screen/profile_qr_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileQrScreen extends StatelessWidget {
  const ProfileQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Barcode'.tr),
      ),
      body: FutureBuilder(
        future: getUserDataProfileQrScreen(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProfileScreenModel userData;
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            userData = ProfileScreenModel.fromJson(data);
            return ProfileQrScreenBody(userData: userData);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
