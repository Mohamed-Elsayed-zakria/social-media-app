import '../../../../../../../core/utils/date_time.dart';
import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountDate extends StatelessWidget {
  const CreateAccountDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Created date".tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
          Card(
            color: AppColors.kSurfaceColor,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              child: Row(
                children: [
                  const Icon(Icons.date_range_outlined),
                  const SizedBox(width: 15),
                  Text(
                    MyDateUtil.convertDateTime(
                      historyAsText:
                          ApiService.user.metadata.creationTime!.toString(),
                    ),
                    style: const TextStyle(
                      fontSize: AppStyle.kTextStyle16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
