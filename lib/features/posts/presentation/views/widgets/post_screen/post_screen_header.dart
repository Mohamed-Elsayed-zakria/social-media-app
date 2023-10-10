import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../../controllers/post_screen_controller.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';

class PostScreenHeader extends StatelessWidget {
  const PostScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    PostModel userData;
    return FutureBuilder(
      future: getUserData(currentUserUid: ApiService.user.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          userData = PostModel.fromJson(data);
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.kSurfaceColor,
              backgroundImage: CachedNetworkImageProvider(
                userData.personalPicture,
              ),
            ),
            title: Text('@${userData.username}'),
            subtitle: Text('Add new post'.tr),
          );
        } else {
          return const CustomPersonaListTileShimmer();
        }
      },
    );
  }
}
