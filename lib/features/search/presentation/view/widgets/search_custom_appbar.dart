import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/colors.dart';
import '../../controller/search_screen_controller.dart';

class SearchCustomAppbar extends StatelessWidget {
  const SearchCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) => getSearchResult.value = value,
            decoration:  InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your username".tr,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
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
