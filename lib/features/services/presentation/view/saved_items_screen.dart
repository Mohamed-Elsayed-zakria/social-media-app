import 'widgets/saved_items/custom_post_saved_items.dart';
import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedItemsScreen extends StatelessWidget {
  const SavedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Saved items'.tr),
            floating: true,
            snap: true,
          ),
          const CustomPostSavedItems(),
        ],
      ),
    );
  }
}
