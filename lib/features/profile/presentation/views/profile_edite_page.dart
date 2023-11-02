import 'widgets/profile_edite_page/profile_edite_personal_picture.dart';
import 'widgets/profile_edite_page/profile_edite_cover_photo.dart';
import 'widgets/profile_edite_page/profile_edite_elbio.dart';
import '../../../../core/model/current_user_data.dart';
import '../controller/profile_edite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditePage extends StatelessWidget {
  const ProfileEditePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Profile'.tr),
      ),
      body: Container(
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
                urlPersonalPicture: CurrentUserData.personalPicture,
              ),
              ProfileEditeCoverPhoto(
                urlCoverPhoto: CurrentUserData.coverPhoto,
              ),
              ProfileEditeElbio(elbio: CurrentUserData.bio),
            ],
          ),
        ),
      ),
    );
  }
}
