import '../../../controller/saved_items_controller.dart';
import '../../../../../posts/data/model/post_model.dart';
import 'package:flutter/material.dart';
import '../../../../../posts/presentation/views/widgets/custom_post/custom_post_shimmer.dart';
import '../../../../../posts/presentation/views/widgets/custom_post/custom_post_item.dart';
import 'saved_items_message_not_fount.dart';

class CustomPostSavedItems extends StatelessWidget {
  const CustomPostSavedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPostsToSavedItems(),
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
