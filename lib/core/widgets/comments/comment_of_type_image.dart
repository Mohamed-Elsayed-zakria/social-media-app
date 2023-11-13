import 'package:flutter/material.dart';
import '../../utils/size_screen.dart';
import '../../constant/colors.dart';
import '../custom_shimmer.dart';
import 'package:get/get.dart';

class CommentOfTypeImage extends StatelessWidget {
  final String urlImage;

  const CommentOfTypeImage({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Container(
      margin: const EdgeInsets.only(right: 17, left: 17, bottom: 14, top: 6),
      height: size.width * .4,
      width: size.width * .4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          urlImage,
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) => CustomShimmer(
            child: Container(
              height: size.width * .4,
              width: size.width * .4,
              color: AppColors.kSurfaceColor,
            ),
          ),
          errorBuilder: (context, url, error) => SizedBox(
            height: size.width * .4,
            width: size.width * .4,
            child: Center(
              child: Text('Failed to load image'.tr),
            ),
          ),
        ),
      ),
    );
  }
}
