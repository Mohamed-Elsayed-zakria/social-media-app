import '../../../../controllers/chat_screen_messages_controller.dart';
import '../../../../../../../core/widgets/custom_form_field.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../data/models/message_model.dart';
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
      onTap: () {
        Get.back();
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
