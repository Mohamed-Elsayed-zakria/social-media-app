import '../../../../../../core/api/api_service.dart';
import '../../../controllers/custom_post_controller.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'likes/show_all_likes.dart';
import 'custom_post_details.dart';
import 'package:get/get.dart';

class CustomPostLower extends StatelessWidget {
  final List allLikes;
  final int countComments;
  final PostModel postData;
  const CustomPostLower({
    super.key,
    required this.allLikes,
    required this.countComments,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Row(
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
                ),
                const SizedBox(width: 14),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.to(
                        () => CustomPostDetails(
                          postUid: postData.postUid,
                        ),
                      ),
                      icon: const Icon(IconlyBroken.moreSquare),
                    ),
                    Text('$countComments'),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: IconButton(
                onPressed: () {
                  Share.share(
                    postData.postUrl,
                    subject: postData.description,
                  );
                },
                icon: const Icon(IconlyBroken.send),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
