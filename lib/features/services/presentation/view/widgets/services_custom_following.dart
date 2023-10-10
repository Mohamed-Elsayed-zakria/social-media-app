import 'package:icon_broken/icon_broken.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../profile/presentation/views/profile_all_following_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesCustomFollowing extends StatelessWidget {
  const ServicesCustomFollowing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () => Get.to(
          () => ProfileAllFollowingScreen(otherUid: ApiService.user.uid),
        ),
        title: Text('Following'.tr),
        leading: ClipOval(
          child: Container(
            color: const Color.fromARGB(254, 235, 203, 255),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.people_alt_sharp,
              size: 28,
              color: Color.fromARGB(255, 158, 32, 255),
            ),
          ),
        ),
        trailing: const Icon(IconBroken.Arrow___Right_2),
      ),
    );
  }
}
