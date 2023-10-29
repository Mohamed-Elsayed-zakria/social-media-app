import '../../controller/search_screen_controller.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCustomAppbar extends StatelessWidget {
  const SearchCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: getSearchResultController,
            onChanged: (value) => getSearchResult.value = value,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your username".tr,
            ),
          ),
        ),
        IconButton(
          onPressed: () => scanQr(),
          icon: const Icon(
            Icons.qr_code_scanner_outlined,
            size: 30,
            color: AppColors.kPrimaryColor,
          ),
        )
      ],
    );
  }
}
