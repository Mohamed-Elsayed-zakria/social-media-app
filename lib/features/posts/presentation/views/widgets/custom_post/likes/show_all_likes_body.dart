import '../../../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../../../controllers/all_likes_controller.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../data/model/likes_model.dart';
import 'package:flutter/material.dart';
import 'all_likes_custom_person.dart';

class ShowAllLikesBody extends StatelessWidget {
  final List allLikes;

  const ShowAllLikesBody({
    super.key,
    required this.allLikes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kSurfaceColor,
      child: Column(
        children: allLikes.map((getLikesByUid) {
          return FutureBuilder(
            future: getPersonWordLikeByUid(getLikesByUid: getLikesByUid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: List.generate(
                    4,
                    (index) => const CustomPersonaListTileShimmer(),
                  ),
                );
              } else {
                LikesModel likesModel;
                Map<String, dynamic> jsonData =
                    snapshot.data!.data() as Map<String, dynamic>;
                likesModel = LikesModel.fromJson(jsonData);
                return AllLikesCustomPerson(likesModel: likesModel);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
