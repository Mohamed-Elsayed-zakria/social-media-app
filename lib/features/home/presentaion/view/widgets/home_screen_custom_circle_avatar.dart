import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../controller/home_sceen_controller.dart';
import '../../../data/model/home_screen_model.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class HomeScreenCustomCircleAvatar extends StatelessWidget {
  const HomeScreenCustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    HomeScreenModel homeScreenModel;

    return FutureBuilder(
      future: getAllUserData(),
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
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          homeScreenModel = HomeScreenModel.fromJson(data);
          return CircleAvatar(
            radius: size.width * .064,
            backgroundColor: AppColors.kBackgroundColor,
            child: CircleAvatar(
              radius: size.width * .060,
              backgroundColor: AppColors.kBackgroundColor,
              backgroundImage: CachedNetworkImageProvider(
                homeScreenModel.personalPicture!,
              ),
            ),
          );
        }
      },
    );
  }
}
