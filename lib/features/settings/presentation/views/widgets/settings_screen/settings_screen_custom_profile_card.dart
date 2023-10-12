import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controllers/settings_screen_controller.dart';
import '../../../../data/models/settings_screen_model.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenCustomProfileCard extends StatelessWidget {
  const SettingsScreenCustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsScreenModel userData;
    return StreamBuilder(
      stream: getuserDataToSettings(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          userData = SettingsScreenModel.fromJson(data);
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(() => ProfileScreen(otherUid: ApiService.user.uid));
                },
                title: Text(
                  '@${userData.username}',
                  style: const TextStyle(
                    fontSize: AppStyle.kTextStyle18,
                  ),
                ),
                subtitle: Text(
                  "View Profile".tr,
                  style: const TextStyle(
                    fontSize: AppStyle.kTextStyle18,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.kSurfaceColor,
                  backgroundImage: CachedNetworkImageProvider(
                    userData.personalPicture,
                  ),
                ),
                trailing: const Icon(IconlyBroken.arrowRight2),
              ),
              const SizedBox(height: 4),
            ],
          );
        } else {
          return const CustomPersonaListTileShimmer();
        }
      },
    );
  }
}
