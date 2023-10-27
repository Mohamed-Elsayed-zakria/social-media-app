import '../../../../../core/constant/colors.dart';
import '../../../../../core/widgets/custom_verified_in_circal_avatar.dart';
import '../../../../profile/presentation/views/profile_screen.dart';
import '../../../data/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCustomPerson extends StatelessWidget {
  final SearchModel userData;

  const SearchCustomPerson({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => ProfileScreen(otherUid: userData.personUid));
      },
      title: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            '@${userData.username}',
          ),
        ],
      ),
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kSurfaceColor,
            radius: 28,
            backgroundImage: NetworkImage(
              userData.personalPicture,
            ),
          ),
          CustomVerifiedInCircalAvatar(visible: userData.verified),
        ],
      ),
    );
  }
}
