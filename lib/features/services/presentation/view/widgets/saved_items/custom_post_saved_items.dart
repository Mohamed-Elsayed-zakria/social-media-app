import '../../../../../posts/presentation/views/widgets/custom_post/custom_post_shimmer.dart';
import '../../../../../posts/presentation/views/widgets/custom_post/custom_post_item.dart';
import '../../../../../posts/data/model/post_model.dart';
import 'saved_items_message_not_fount.dart';
import 'package:flutter/material.dart';

class CustomPostSavedItems extends StatelessWidget {
  final Future<List<PostModel>> getPostsToSavedItems;
  const CustomPostSavedItems({
    super.key,
    required this.getPostsToSavedItems,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPostsToSavedItems,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              (context, index) => const CustomPostShimmer(),
            ),
          );
        } else if (!snapshot.hasData ||
            snapshot.hasError ||
            snapshot.data!.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: SavedItemsMessageNotFount(),
          );
        } else {
          List<PostModel> listPost = snapshot.data!;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: listPost.length,
              (context, index) {
                final post = listPost[index];
                return CustomPostItem(
                  postData: post,
                  detailsPage: false,
                );
              },
            ),
          );
        }
      },
    );
  }
}
