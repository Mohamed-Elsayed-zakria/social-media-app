import '../controller/saved_items_controller.dart';
import 'widgets/saved_items/custom_post_saved_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavedItemsScreen extends StatelessWidget {
  const SavedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SavedItemsController>(
        init: SavedItemsController(),
        builder: (controller) => RefreshIndicator(
          onRefresh: () async => controller.update(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('Saved items'.tr),
                floating: true,
                snap: true,
              ),
              CustomPostSavedItems(
                getPostsToSavedItems: getPostsToSavedItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
