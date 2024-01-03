import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoMessagesYet extends StatelessWidget {
  const NoMessagesYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No messages yet'.tr),
    );
  }
}
