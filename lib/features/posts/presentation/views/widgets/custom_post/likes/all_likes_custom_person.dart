import '../../../../../../../core/widgets/custom_verified_in_circal_avatar.dart';
import '../../../../../../profile/presentation/views/profile_screen.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../data/model/likes_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllLikesCustomPerson extends StatelessWidget {
  final LikesModel likesModel;

  const AllLikesCustomPerson({
    super.key,
    required this.likesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () => Get.to(
          () => ProfileScreen(otherUid: likesModel.personUid),
        ),
        title: Row(
          children: [
            Text(
              textDirection: TextDirection.ltr,
              '@${likesModel.username}',
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
              ),
            ),
            const SizedBox(width: 5),
            Visibility(
              visible: likesModel.verified,
              child: const Icon(
                Icons.verified,
                size: 17,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.kBackgroundColor,
              backgroundImage: NetworkImage(
                likesModel.personalPicture,
              ),
            ),
            CustomVerifiedInCircalAvatar(visible: likesModel.verified),
          ],
        ),
        trailing: const Icon(
          color: AppColors.kPrimaryColor,
          IconlyBold.heart,
        ),
      ),
    );
  }
}
