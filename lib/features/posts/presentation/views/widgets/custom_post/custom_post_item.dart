import '../../../../../../core/constant/colors.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'custom_post_content.dart';
import 'custom_post_header.dart';
import 'custom_post_lower.dart';

class CustomPostItem extends StatelessWidget {
  final PostModel postData;
  final bool detailsPage;
  const CustomPostItem({
    super.key,
    required this.postData,
    required this.detailsPage,
  });

  @override
  Widget build(BuildContext context) {
    Widget postContent = Column(
      children: [
        CustomPostHeader(postData: postData),
        CustomPostContent(postData: postData),
        CustomPostLower(postData: postData),
      ],
    );
    return detailsPage
        ? Container(
            color: AppColors.kSurfaceColor,
            child: postContent,
          )
        : Card(
            color: AppColors.kSurfaceColor,
            child: postContent,
          );
  }
}
