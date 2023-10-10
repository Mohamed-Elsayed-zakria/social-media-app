import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileScreenCoverAndPersonImage extends StatelessWidget {
  final ProfileScreenModel userData;
  const ProfileScreenCoverAndPersonImage({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return SizedBox(
      height: size.height * .31,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: userData.coverPhoto,
            fit: BoxFit.cover,
            height: size.height * .23,
            width: double.infinity,
            placeholder: (context, url) => Container(
              width: double.infinity,
              height: size.height * .23,
              color: AppColors.kBackgroundColor,
            ),
            errorWidget: (context, url, error) => Container(
              width: double.infinity,
              height: size.height * .23,
              color: AppColors.kBackgroundColor,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: CircleAvatar(
                radius: size.width * .17,
                backgroundColor: AppColors.kSurfaceColor,
                child: CircleAvatar(
                  radius: size.width * .16,
                  backgroundColor: AppColors.kSurfaceColor,
                  backgroundImage: CachedNetworkImageProvider(
                    userData.personalPicture,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
