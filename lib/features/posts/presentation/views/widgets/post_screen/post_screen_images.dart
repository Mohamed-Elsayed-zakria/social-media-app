import '../../../../../../core/utils/size_screen.dart';
import '../../../controllers/post_screen_controller.dart';
import '../../../../../../core/constant/colors.dart';
import '../../post_screen_image_viewer_page.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class PostScreenImages extends StatelessWidget {
  const PostScreenImages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);

    return Obx(
      () => Visibility(
        visible: imagePaths.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: imagePaths.length == 1 ? 1 : 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(
                      () => PostScreenImageViewerPage(
                        imagePath: imagePaths[index],
                      ),
                    ),
                    child: imagePaths.length == 1
                        ? LimitedBox(
                            maxHeight: size.height * 0.55,
                            child: Image.file(
                              File(imagePaths[index]),
                              filterQuality: FilterQuality.high,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          )
                        : SizedBox(
                            height: size.height * .3,
                            child: Image.file(
                              File(imagePaths[index]),
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  IconButton(
                    icon: const Icon(
                      color: AppColors.kSecondeColor,
                      IconlyBroken.delete,
                      size: 28,
                    ),
                    onPressed: () => removeImage(index),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
