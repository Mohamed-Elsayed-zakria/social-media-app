import '../../../../../../core/widgets/custom_read_more_text.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/model/stories_model.dart';
import 'package:flutter/material.dart';

class StoryViewerLower extends StatelessWidget {
  final StoriesModel storyData;
  const StoryViewerLower({
    super.key,
    required this.storyData,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Visibility(
      visible: storyData.imgPath!.isNotEmpty || storyData.vedioUrl!.isNotEmpty,
      child: Positioned(
        bottom: 50,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          width: size.width,
          child: Center(
            child: CustomReadMoreText(
              text: storyData.description ?? '',
              trimLines: 5,
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
                color: AppColors.kSurfaceColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
