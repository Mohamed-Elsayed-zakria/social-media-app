import '../../../../../core/constant/colors.dart';
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
      title: Text('@${userData.username}'),
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kSurfaceColor,
            radius: 28,
            backgroundImage: NetworkImage(
              userData.personalPicture,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Visibility(
              visible: userData.verified,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kSurfaceColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.verified,
                  size: 18,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
