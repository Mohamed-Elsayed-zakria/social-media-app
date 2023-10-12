import 'package:get/get.dart';

import '../../../../../../core/constant/style.dart';
import '../../../../../../core/widgets/custom_read_more_text.dart';
import '../../../../data/model/post_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_post_vedio_item.dart';
import 'custom_post_images.dart';

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
              Clipboard.setData(ClipboardData(text: postData.description));
              Fluttertoast.showToast(
                msg: "The text has been copied".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: CustomReadMoreText(
                text: postData.description,
                trimLines: postData.imgUrl.isEmpty ? 10 : 5,
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
