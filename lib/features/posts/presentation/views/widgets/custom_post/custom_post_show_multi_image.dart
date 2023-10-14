import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_post_image_viewer_page.dart';
import 'custom_post_image_shimmer.dart';

class CustomPostShowMultiImage extends StatelessWidget {
  final String urlImage;
  const CustomPostShowMultiImage({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => CustomPostImageViewerPage(imagePath: urlImage)),
      child: CachedNetworkImage(
        imageUrl: urlImage,
        width: double.infinity,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        placeholder: (context, url) => const CustomPostImageShimmer(),
        errorWidget: (context, url, error) => Center(
          child: Text('Failed to load image'.tr),
        ),
      ),
    );
  }
}
