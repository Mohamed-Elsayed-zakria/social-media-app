import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/constant.dart';
import '../../custom_post_image_viewer_page.dart';
import 'custom_post_image_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPostShowSingleImage extends StatelessWidget {
  final String urlImage;
  const CustomPostShowSingleImage({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return GestureDetector(
      onTap: () => Get.to(() => CustomPostImageViewerPage(imagePath: urlImage)),
      child: LimitedBox(
        maxHeight: size.height * .55,
        child: CachedNetworkImage(
          imageUrl: urlImage,
          width: double.infinity,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          placeholder: (context, url) => const CustomPostImageShimmer(),
          errorWidget: (context, url, error) => SizedBox(
            height: size.height * .35,
            width: double.infinity,
            child: const Center(
              child: Text('Failed to load image'),
            ),
          ),
        ),
      ),
    );
  }
}
