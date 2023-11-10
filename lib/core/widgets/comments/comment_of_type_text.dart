import '../../model/comment_model.dart';
import '../custom_read_more_text.dart';
import 'package:flutter/material.dart';
import '../../constant/style.dart';

class CommentOfTypeText extends StatelessWidget {
  final CommentModel commentData;

  const CommentOfTypeText({
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
