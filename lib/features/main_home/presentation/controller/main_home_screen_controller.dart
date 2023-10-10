import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

RxInt pageNumber = 0.obs;

List<BottomNavigationBarItem> itemBottomNavigationBar = [
  BottomNavigationBarItem(
    icon: const Icon(IconBroken.Home),
    label: 'Home'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconBroken.Notification),
    label: 'Notice'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconBroken.Video),
    label: 'Videos'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconBroken.Category),
    label: 'Services'.tr,
  ),
  BottomNavigationBarItem(
    icon: const Icon(IconBroken.Setting),
    label: 'Settings'.tr,
  ),
];
