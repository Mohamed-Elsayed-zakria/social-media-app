import '../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/model/explore_frinds_model.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreFrindsScreenBody extends StatelessWidget {
  final ExploreFrindsModel userData;
  const ExploreFrindsScreenBody({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => ProfileScreen(otherUid: userData.personalUid)),
      title: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            '@${userData.username}',
          ),
          const SizedBox(width: 5),
          Visibility(
            visible: userData.verified,
            child: const Icon(
              Icons.verified,
              size: 17,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
      subtitle: Text('${userData.firstName} ${userData.lastName}'),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.kBackgroundColor,
        backgroundImage: CachedNetworkImageProvider(userData.personalPicture),
      ),
    );
  }
}
