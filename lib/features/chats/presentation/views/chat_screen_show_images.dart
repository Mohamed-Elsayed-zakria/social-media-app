import 'widgets/show_images/chat_show_images_buttom_sheet_download_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenShowImages extends StatelessWidget {
  final int? initialPage;
  final List imagePath;

  const ChatScreenShowImages({
    super.key,
    required this.imagePath,
    this.initialPage,
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
        child: Scaffold(
          backgroundColor: AppColors.kOnSurfaceColor,
          body: PageView.builder(
            controller: PageController(initialPage: initialPage ?? 0),
            itemCount: imagePath.length,
            itemBuilder: (context, index) => Stack(
              children: [
                Center(
                  child: CachedNetworkImage(
                    filterQuality: FilterQuality.high,
                    imageUrl: imagePath[index],
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
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
                            ChatShowImagesButtomSheetDownloadImage(
                              imagePath: imagePath[index],
                            ),
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
      ),
    );
  }
}
