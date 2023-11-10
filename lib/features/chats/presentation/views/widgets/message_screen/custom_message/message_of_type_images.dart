import '../../../../../../../core/widgets/photo_grid/custom_photo_grid.dart';
import '../../../../../../../core/utils/size_screen.dart';
import '../../../../../data/models/message_model.dart';
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        child: CustomPhotoGrid(
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
      ),
    );
  }
}
