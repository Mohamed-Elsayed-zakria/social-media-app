import '../../../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../../../controllers/all_likes_controller.dart';
import '../../../../../data/model/likes_model.dart';
import 'package:flutter/material.dart';
import 'all_likes_custom_person.dart';

class ShowAllLikesBody extends StatelessWidget {
  final String postUid;

  const ShowAllLikesBody({
    super.key,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllLikesByUid(postUid: postUid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) =>
                const CustomPersonaListTileShimmer(),
          );
        } else {
          List<LikesModel>? likesModel = snapshot.data;
          return ListView.builder(
            itemCount: likesModel!.length,
            itemBuilder: (context, index) =>
                AllLikesCustomPerson(likesModel: likesModel[index]),
          );
        }
      },
    );
  }
}
