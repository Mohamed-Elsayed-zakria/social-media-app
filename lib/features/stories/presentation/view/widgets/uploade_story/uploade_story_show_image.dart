import '../../../../../../core/utils/size_screen.dart';
import '../../../../data/model/stories_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class UploadeStoryShowImage extends StatelessWidget {
  final TypeStoryUploade type;
  final String? imagePathStory;
  const UploadeStoryShowImage({
    super.key,
    this.imagePathStory,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return imagePathStory != null && type == TypeStoryUploade.image
        ? LimitedBox(
            maxHeight: size.height * .6,
            child: Image.file(
              File(imagePathStory!),
              filterQuality: FilterQuality.high,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          )
        : const SizedBox();
  }
}
