import '../../../../../posts/presentation/views/widgets/custom_post/custom_post.dart';
import '../../../controller/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'profile_screen_header.dart';
import 'package:get/get.dart';

class ProfileScreenBody extends StatelessWidget {
  final String otherUid;
  const ProfileScreenBody({
    super.key,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
      init: ProfileScreenController(),
      builder: (controller) => RefreshIndicator(
        onRefresh: () async => controller.update(),
        child: CustomScrollView(
          slivers: [
            ProfileScreenHeader(otherUid: otherUid),
            CustomPost(future: getPostsForSpecificPerson(otherUid: otherUid))
          ],
        ),
      ),
    );
  }
}
