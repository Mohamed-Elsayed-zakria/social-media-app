import '../../../../data/model/post_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'custom_post_add_comment.dart';
import 'custom_post_add_like.dart';

class CustomPostLower extends StatelessWidget {
  final PostModel postData;
  const CustomPostLower({
    super.key,
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
                CustomPostAddLike(postData: postData),
                const SizedBox(width: 14),
                CustomPostAddComment(postData: postData),
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
