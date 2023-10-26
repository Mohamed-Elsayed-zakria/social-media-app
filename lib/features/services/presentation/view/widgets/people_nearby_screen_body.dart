import '../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/model/people_nearby_model.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flash/core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/people_nearby_controller.dart';

class PeopleNearbyScreenBody extends StatelessWidget {
  final double currentLatitude;
  final double currentLongitude;
  final PeopleNearbyModel userData;
  const PeopleNearbyScreenBody({
    super.key,
    required this.userData,
    required this.currentLatitude,
    required this.currentLongitude,
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
      subtitle: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.kPrimaryColor,
          ),
          Text(
            calculateDistance(
              currentLatitude: currentLatitude,
              currentLongitude: currentLongitude,
              endLatitude: double.parse(userData.latitude),
              endLongitude: double.parse(userData.longitude),
            ),
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
        ],
      ),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.kBackgroundColor,
        backgroundImage: CachedNetworkImageProvider(userData.personalPicture),
      ),
    );
  }
}
