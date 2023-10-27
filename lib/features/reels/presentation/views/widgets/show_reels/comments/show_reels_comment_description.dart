import '../../../../../../../core/widgets/custom_read_more_text.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class ShowReelsCommentDescription extends StatelessWidget {
  final CommentModel commentData;

  const ShowReelsCommentDescription({
    super.key,
    required this.commentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: CustomReadMoreText(
        text: commentData.textComment,
        trimLines: 3,
        style: const TextStyle(fontSize: AppStyle.kTextStyle16),
      ),
    );
  }
}
