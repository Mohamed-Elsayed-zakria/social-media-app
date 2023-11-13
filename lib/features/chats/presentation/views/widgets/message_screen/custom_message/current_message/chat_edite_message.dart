import '../../../../../controllers/chat_screen_messages_controller.dart';
import '../../../../../../../../core/utils/get_current_date_time.dart';
import '../../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../../../../../core/utils/show_toast.dart';
import '../../../../../../../../core/constant/colors.dart';
import '../../../../../../../../core/constant/style.dart';
import '../../../../../../data/models/message_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChstEditeMessage extends StatelessWidget {
  final MessageModel messageData;

  const ChstEditeMessage({
    super.key,
    required this.messageData,
  });

  @override
  Widget build(BuildContext context) {
    getTextEditeMessage.text = messageData.message;
    return ListTile(
      onTap: () async {
        Get.back();
        DateTime getCurrentDateTime = currentTimeDevice();
        DateTime messageTime = DateTime.parse(messageData.dateTime);

        int minutesDifference =
            getCurrentDateTime.difference(messageTime).inMinutes;

        if (minutesDifference <= 30) {
          Get.defaultDialog(
            backgroundColor: AppColors.kSurfaceColor,
            titlePadding: const EdgeInsets.only(top: 20),
            title: "Edite".tr,
            confirm: TextButton(
              onPressed: () {
                if (getTextEditeMessage.text.isNotEmpty) {
                  Get.back();
                  updateMessage(
                    newMessage: getTextEditeMessage.text,
                    messageData: messageData,
                  );
                }
              },
              child: Text(
                "Edite".tr,
                style: const TextStyle(fontSize: AppStyle.kTextStyle16),
              ),
            ),
            content: Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: CustomFormField(
                  controller: getTextEditeMessage,
                  keyboardType: TextInputType.multiline,
                  label: "Edite message".tr,
                  hintText: 'Type your Message here'.tr,
                ),
              ),
            ),
          );
        } else {
          showToast(msg: 'You can no longer edite the message'.tr);
        }
      },
      leading: const Icon(
        color: AppColors.kPrimaryColor,
        IconlyBroken.edit,
      ),
      title: Text(
        "Edite".tr,
        style: const TextStyle(fontSize: AppStyle.kTextStyle18),
      ),
    );
  }
}
