import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedItemsMessageNotFount extends StatelessWidget {
  const SavedItemsMessageNotFount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'There are no saved items'.tr,
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
        ),
      ),
    );
  }
}
