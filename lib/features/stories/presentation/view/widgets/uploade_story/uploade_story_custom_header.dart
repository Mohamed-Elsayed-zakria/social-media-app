import '../../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../data/model/stories_model.dart';
import '../../../controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadeStoryCustomHeader extends StatelessWidget {
  const UploadeStoryCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    StoriesModel userData;
    return FutureBuilder(
      future: getuserDataToStory(otherUid: ApiService.user.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          userData = StoriesModel.fromJson(data);
          return ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.kSurfaceColor,
              backgroundImage:
                  CachedNetworkImageProvider(userData.personalPicture),
            ),
            title: Text('@${userData.username}'),
            subtitle: Text('Add new story'.tr),
          );
        } else {
          return const CustomPersonaListTileShimmer();
        }
      },
    );
  }
}
