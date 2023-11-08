import '../../../../../../core/widgets/custom_read_more_text.dart';
import '../../../../../../core/utils/show_toast.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_post_vedio_item.dart';
import 'custom_post_images.dart';
import 'package:get/get.dart';

class CustomPostContent extends StatelessWidget {
  final PostModel postData;

  const CustomPostContent({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
          child: InkWell(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: postData.description)).then(
                (value) => showToast(msg: "The text has been copied".tr),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: CustomReadMoreText(
                text: postData.description,
                trimLines: postData.imgUrl.isEmpty ? 12 : 6,
                style: const TextStyle(fontSize: AppStyle.kTextStyle18),
              ),
            ),
          ),
        ),
        Visibility(
          visible: postData.imgUrl.isNotEmpty,
          child: PostCustomImages(urlImages: postData.imgUrl),
        ),
        Visibility(
          visible: postData.videoUrl.isNotEmpty,
          child: Container(
            margin: const EdgeInsets.only(top: 4),
            child: CustomPostVedioItem(videoUrl: postData.videoUrl),
          ),
        ),
      ],
    );
  }
}
