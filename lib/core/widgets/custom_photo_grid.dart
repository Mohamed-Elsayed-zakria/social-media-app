import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../features/posts/presentation/views/widgets/custom_post/custom_post_image_shimmer.dart';
import '../constant/colors.dart';
import 'dart:math';

import '../utils/size_screen.dart';

class CustomPhotoGrid extends StatelessWidget {
  final Function(int) onImageClicked;
  final Function onExpandClicked;
  final List imageUrls;
  final int maxImages;

  const CustomPhotoGrid({
    super.key,
    required this.imageUrls,
    required this.onImageClicked,
    required this.onExpandClicked,
    this.maxImages = 4,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    var images = buildImages();
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              imageUrls.length <= 3 ? size.width * .6 : size.width * .3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        children: images,
      ),
    );
  }

  List<Widget> buildImages() {
    int numImages = imageUrls.length;
    return List<Widget>.generate(min(numImages, maxImages), (index) {
      String imageUrl = imageUrls[index];

      // If its the last image
      if (index == maxImages - 1) {
        // Check how many more images are left
        int remaining = numImages - maxImages;

        // If no more are remaining return a simple image widget
        if (remaining == 0) {
          return GestureDetector(
            child: viewImage(imageUrl: imageUrl),
            onTap: () => onImageClicked(index),
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining images
          return GestureDetector(
            onTap: () => onExpandClicked(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                viewImage(imageUrl: imageUrl),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black54,
                    child: Text(
                      '+$remaining',
                      style: const TextStyle(
                        fontSize: 30,
                        color: AppColors.kSurfaceColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return GestureDetector(
          child: viewImage(imageUrl: imageUrl),
          onTap: () => onImageClicked(index),
        );
      }
    });
  }

  Widget viewImage({required String imageUrl}) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: double.infinity,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      placeholder: (context, url) => const CustomPostImageShimmer(),
      errorWidget: (context, url, error) => Center(
        child: Text('Failed to load image'.tr),
      ),
    );
  }
}
