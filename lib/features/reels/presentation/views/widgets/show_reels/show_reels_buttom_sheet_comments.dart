import '../../../../../../core/widgets/comments/comments_not_fount.dart';
import '../../../../../../core/widgets/comments/comments_lower.dart';
import '../../../controller/show_reels_comments_controller.dart';
import '../../../../../../core/model/comment_model.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../data/model/reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import 'comments/show_reels_comment_item.dart';
import 'package:flutter/material.dart';

class ShowReelsButtomSheetComments extends StatelessWidget {
  final ReelsModel allReels;

  const ShowReelsButtomSheetComments({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Container(
      height: size.height * .7,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: getAllReelsComments(reelUid: allReels.reelUid),
                builder: (context, commentSnapshot) {
                  if (commentSnapshot.hasData) {
                    List<CommentModel> commentsList = commentSnapshot.data!;
                    if (commentsList.isNotEmpty) {
                      return ListView.builder(
                        itemCount: commentsList.length,
                        itemBuilder: (context, index) {
                          return ShowReelsCommentItem(
                            commentData: commentsList[index],
                            reelUid: allReels.reelUid,
                          );
                        },
                      );
                    } else {
                      return const CommentsNotFount();
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            CommentsLower(
              commentController: addReelsComment,
              onTapSendComment: () {
                if (addReelsComment.text.isNotEmpty) {
                  addNewReelsCommentOfTypeText(
                    reelUid: allReels.reelUid,
                    text: addReelsComment.text,
                  );
                }
              },
              onTapSendImage: () => reelsCommentUploadImage(
                commentType: CommentType.image,
                reelUid: allReels.reelUid,
                text: addReelsComment.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
