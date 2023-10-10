import 'widgets/profile_all_followers_and_following/profile_custom_shape_person.dart';
import '../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../controller/profile_all_followers_controller.dart';
import '../../data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAllFollowersScreen extends StatelessWidget {
  final String otherUid;
  const ProfileAllFollowersScreen({
    super.key,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Followers'.tr),
      ),
      body: FutureBuilder(
        future: getFollowerByUID(otherUid: otherUid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) =>
                  const CustomPersonaListTileShimmer(),
            );
          } else {
            List<ProfileScreenModel> allFolowers;
            allFolowers = snapshot.data!;
            return ListView.builder(
              itemCount: allFolowers.length,
              itemBuilder: (context, index) {
                return ProfileCustomShapePerson(
                  followerData: allFolowers[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
