import 'package:cached_network_image/cached_network_image.dart';
import 'widgets/custom_post/image_viewer_bottom_sheet.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPostImageViewerPage extends StatelessWidget {
  final String imagePath;

  const CustomPostImageViewerPage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 20 || details.primaryDelta! < -20) {
            Get.back();
          }
        },
        onLongPress: () => Get.bottomSheet(
          ImageViewerBottomSheet(imagePath: imagePath),
        ),
        child: Scaffold(
          backgroundColor: AppColors.kOnSurfaceColor,
          body: Stack(
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          ImageViewerBottomSheet(imagePath: imagePath),
                        );
                      },
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: AppColors.kSurfaceColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        color: AppColors.kSurfaceColor,
                        Icons.close_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
