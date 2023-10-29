import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../../data/models/profile_model.dart';
import 'profile_screen_current_more_buttom.dart';
import 'package:flutter/material.dart';
import '../../profile_edite_page.dart';
import '../../profile_qr_screen.dart';
import 'package:get/get.dart';

class ProfileScreenCurrentUser extends StatelessWidget {
  final ProfileScreenModel userData;

  const ProfileScreenCurrentUser({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Divider(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    ProfileScreenCurrentMoreButtom(
                      userData: userData,
                    ),
                  );
                },
                icon: const Icon(Icons.more_vert_outlined),
              ),
              IconButton(
                onPressed: () => Get.to(() => const ProfileQrScreen()),
                icon: const Icon(Icons.qr_code_rounded),
              ),
              SizedBox(
                width: size.width * 0.40,
                child: CustomButton(
                  onPressed: () => Get.to(() => const ProfileEditePage()),
                  text: "Edite".tr,
                ),
              )
            ],
          ),
          const Divider(height: 6),
        ],
      ),
    );
  }
}
