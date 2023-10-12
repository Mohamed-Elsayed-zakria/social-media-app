import '../../../../../../profile/presentation/views/profile_screen.dart';
import '../../../../../../../core/widgets/custom_read_more_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../../core/constant/constant.dart';
import '../../../../controllers/comments_controller.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../data/model/comment_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'on_long_press_current_comment.dart';
import 'on_long_press_other_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentItem extends StatelessWidget {
  final String postUid;
  final CommentModel commentData;

  const CommentItem({
    super.key,
    required this.commentData,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserDataToComments(personUid: commentData.personUid),
      builder: (context, snapshot) {
        bool verified = false;
        String? personalPicture;
        if (snapshot.hasData) {
          personalPicture = snapshot.data!.get('personalPicture');
          verified = snapshot.data!.get('verified') ?? false;
        }
        return GestureDetector(
          onLongPress: () {
            Get.bottomSheet(
              commentData.personUid == ApiService.user.uid
                  ? OnLongPressCurrentComment(commentData: commentData)
                  : OnLongPressOtherComment(commentData: commentData),
            );
          },
          child: Card(
            color: AppColors.kSurfaceColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Text('@${commentData.username}'),
                      const SizedBox(width: 5),
                      Visibility(
                        visible: verified,
                        child: const Icon(
                          Icons.verified,
                          size: 17,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Constant.convertDateTime(
                          historyAsText: commentData.dataPublished,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                commentData.likes.contains(
                                  ApiService.user.uid,
                                )
                                    ? removeLikeFromComment(
                                        commentUid: commentData.commentId,
                                        postUid: postUid,
                                      )
                                    : addLikeComment(
                                        commentUid: commentData.commentId,
                                        postUid: postUid,
                                      );
                              },
                              child: commentData.likes.contains(
                                ApiService.user.uid,
                              )
                                  ? const Icon(
                                      IconlyBroken.heart,
                                      size: 22,
                                      color: AppColors.kPrimaryColor,
                                    )
                                  : const Icon(
                                      IconlyBroken.heart,
                                      size: 22,
                                    ),
                            ),
                          ),
                          Text(commentData.likes.length.toString()),
                        ],
                      ),
                    ],
                  ),
                  leading: GestureDetector(
                    onTap: () => Get.to(
                      () => ProfileScreen(
                        otherUid: commentData.personUid,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.kBackgroundColor,
                      backgroundImage: personalPicture != null
                          ? CachedNetworkImageProvider(personalPicture)
                          : null,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: CustomReadMoreText(
                    text: commentData.textComment,
                    trimLines: 3,
                    style: const TextStyle(fontSize: AppStyle.kTextStyle16),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
