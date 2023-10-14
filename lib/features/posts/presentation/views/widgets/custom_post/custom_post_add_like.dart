import '../../../controllers/custom_post_controller.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'likes/show_all_likes.dart';
import 'package:get/get.dart';

class CustomPostAddLike extends StatelessWidget {
  final PostModel postData;

  const CustomPostAddLike({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getPostLikes(postUid: postData.postUid),
      builder: (context, likesSnapshot) {
        List allLikes = [];
        if (likesSnapshot.hasData) {
          allLikes = likesSnapshot.data!;
        }
        return Row(
          children: [
            IconButton(
              onPressed: () {
                allLikes.contains(ApiService.user.uid)
                    ? removeLikeToPost(postId: postData.postUid)
                    : addLikeToPost(postId: postData.postUid);
              },
              icon: allLikes.contains(ApiService.user.uid)
                  ? const Icon(
                      IconlyBold.heart,
                      color: AppColors.kPrimaryColor,
                    )
                  : const Icon(IconlyBroken.heart),
            ),
            InkWell(
              onTap: () => Get.to(
                () => ShowAllLikes(allLikes: allLikes),
              ),
              child: Text('${allLikes.length}'),
            ),
          ],
        );
      },
    );
  }
}
