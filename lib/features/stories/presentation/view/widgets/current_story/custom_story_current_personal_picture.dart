import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/widgets/custom_shimmer.dart';
import '../../../controller/story_controller.dart';
import 'package:flutter/material.dart';

class CustomStoryCurrentPersonalPicture extends StatelessWidget {
  const CustomStoryCurrentPersonalPicture({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Stack(
      children: [
        FutureBuilder(
          future: getCurrentPersonalPicture(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomShimmer(
                child: CircleAvatar(
                  radius: size.width * .102,
                ),
              );
            } else {
              String personalPictureUrl = snapshot.data!;
              return CircleAvatar(
                radius: size.width * .102,
                backgroundColor: AppColors.kBackgroundColor,
                backgroundImage: NetworkImage(personalPictureUrl),
              );
            }
          },
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.add,
                size: size.width * .058,
                color: AppColors.kSurfaceColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
