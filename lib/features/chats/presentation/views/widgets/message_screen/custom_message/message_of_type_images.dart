import '../../../../../../../core/widgets/custom_photo_grid.dart';
import '../../../../../../../core/utils/size_screen.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/utils/date_time.dart';
import '../../../../../data/models/message_model.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../chat_screen_show_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageOfTypeImages extends StatelessWidget {
  final MessageModel messageData;
  const MessageOfTypeImages({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return SizedBox(
      width: size.width * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPhotoGrid(
            imageUrls: messageData.imgUrl,
            onImageClicked: (index) => Get.to(
              () => ChatScreenShowImages(
                imagePath: messageData.imgUrl,
                initialPage: index,
              ),
            ),
            onExpandClicked: () => Get.to(
              () => ChatScreenShowImages(
                imagePath: messageData.imgUrl,
              ),
            ),
            maxImages: 4,
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              MyDateUtil.convertDateTime(
                historyAsText: messageData.dateTime,
              ),
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle12,
                color: AppColors.kOnSurfaceColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
