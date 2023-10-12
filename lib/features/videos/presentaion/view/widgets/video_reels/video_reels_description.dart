import 'package:flash/core/constant/style.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/constant.dart';

class VideoReelsDescription extends StatelessWidget {
  final String description;
  const VideoReelsDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Positioned(
      bottom: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                description,
                style: const TextStyle(
                  color: AppColors.kSurfaceColor,
                  fontSize: AppStyle.kTextStyle16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
