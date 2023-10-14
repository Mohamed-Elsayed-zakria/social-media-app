import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../controller/home_sceen_controller.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class HomeScreenCustomCircleAvatar extends StatelessWidget {
  const HomeScreenCustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return FutureBuilder(
      future: getPersonalPicture(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomShimmer(
            child: CircleAvatar(radius: size.width * .060),
          );
        } else if (!snapshot.hasData) {
          return CustomShimmer(
            child: CircleAvatar(radius: size.width * .060),
          );
        } else {
          String personalPicture = snapshot.data!;
          return CircleAvatar(
            radius: size.width * .064,
            backgroundColor: AppColors.kBackgroundColor,
            child: CircleAvatar(
              radius: size.width * .060,
              backgroundColor: AppColors.kBackgroundColor,
              backgroundImage: CachedNetworkImageProvider(personalPicture),
            ),
          );
        }
      },
    );
  }
}
