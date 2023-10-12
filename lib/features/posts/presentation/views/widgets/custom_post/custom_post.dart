import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'custom_post_not_found.dart';
import 'custom_post_shimmer.dart';
import 'custom_post_item.dart';

class CustomPost extends StatelessWidget {
  final Future<List<PostModel>> future;
  final bool vedioPage;
  final bool detailsPage;
  const CustomPost({
    super.key,
    required this.future,
    this.vedioPage = false,
    this.detailsPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, postSnapshot) {
        if (postSnapshot.connectionState == ConnectionState.waiting) {
          return detailsPage
              ? const CustomPostShimmer()
              : const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CustomPostShimmer(),
                      CustomPostShimmer(),
                    ],
                  ),
                );
        } else if (!postSnapshot.hasData || postSnapshot.data!.isEmpty) {
          return SliverToBoxAdapter(
            child: CustomPostNotFount(vedioPage: vedioPage),
          );
        } else {
          final allPostData = postSnapshot.data!;
          final List<PostModel> listPost = vedioPage
              ? allPostData.where((post) => post.imgUrl.isEmpty).toList()
              : allPostData;
          return detailsPage
              ? CustomPostItem(
                  postData: listPost[0],
                  detailsPage: detailsPage,
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: listPost.length,
                    (context, index) {
                      final post = listPost[index];
                      return CustomPostItem(
                        postData: post,
                        detailsPage: detailsPage,
                      );
                    },
                  ),
                );
        }
      },
    );
  }
}
