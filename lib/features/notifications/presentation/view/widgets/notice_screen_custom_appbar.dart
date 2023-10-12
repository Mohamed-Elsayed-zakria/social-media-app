import '../../../../search/presentation/view/search_screen.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeScreenCustomAppbar extends StatelessWidget {
  const NoticeScreenCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Notifications'.tr),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: IconButton(
            onPressed: () => Get.to(() => const SearchScreen()),
            icon: const Icon(
              IconlyBroken.search,
              color: AppColors.kOnSurfaceColor,
            ),
          ),
        ),
      ],
      floating: true,
      snap: true,
    );
  }
}
