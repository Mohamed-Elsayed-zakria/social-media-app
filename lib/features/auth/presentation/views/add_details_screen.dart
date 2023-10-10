import 'widgets/add_details/add_details_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsScreen extends StatelessWidget {
  const AddDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add details'.tr),
      ),
      body: const AddDetailsScreenBody(),
    );
  }
}
