import '../../model/comment_model.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class CommentUsername extends StatelessWidget {
  final CommentModel commentData;

  const CommentUsername({
    super.key,
    required this.commentData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textDirection: TextDirection.ltr,
          '@${commentData.username}',
        ),
        const SizedBox(width: 5),
        Visibility(
          visible: commentData.verified,
          child: const Icon(
            Icons.verified,
            size: 17,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
