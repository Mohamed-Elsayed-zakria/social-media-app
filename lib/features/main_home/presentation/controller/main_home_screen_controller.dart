import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

RxInt pageNumber = 0.obs;

List<BottomNavigationBarItem> itemBottomNavigationBar = [
  BottomNavigationBarItem(
    icon: const Icon(IconlyBroken.home),
    label: 'Home'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconlyBroken.notification),
    label: 'Notice'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconlyBroken.video),
    label: 'Videos'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconlyBroken.category),
    label: 'Services'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconlyBroken.setting),
    label: 'Settings'.tr,
  ),
];
