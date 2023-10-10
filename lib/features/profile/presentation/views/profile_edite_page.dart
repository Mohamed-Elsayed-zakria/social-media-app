import 'widgets/profile_edite_page/profile_edite_personal_picture.dart';
import 'widgets/profile_edite_page/profile_edite_cover_photo.dart';
import 'widgets/profile_edite_page/profile_edite_elbio.dart';
import '../controller/profile_edite_controller.dart';
import '../../data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditePage extends StatelessWidget {
  const ProfileEditePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileScreenModel allUserData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Profile'.tr),
      ),
      body: StreamBuilder(
        stream: getUserDataProfileEdite(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            allUserData = ProfileScreenModel.fromJson(data);
            return Container(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => Visibility(
                        visible: updateIsLodinge.value,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const LinearProgressIndicator(),
                        ),
                      ),
                    ),
                    ProfileEditePersonalPicture(
                      urlPersonalPicture: allUserData.personalPicture,
                    ),
                    ProfileEditeCoverPhoto(
                      urlCoverPhoto: allUserData.coverPhoto,
                    ),
                    ProfileEditeElbio(
                      elbio: allUserData.bio,
                    ),
                  ],
                ),
              ),
            );
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
