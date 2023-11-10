import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash/core/utils/size_screen.dart';
import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.only(right: 25, left: 20, bottom: 14, top: 6),
      height: size.width * .4,
      width: size.width * .4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: urlImage,
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
          placeholder: (context, url) => CustomShimmer(
            child: Container(
              height: size.width * .4,
              width: size.width * .4,
              color: AppColors.kSurfaceColor,
            ),
          ),
          errorWidget: (context, url, error) => SizedBox(
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
