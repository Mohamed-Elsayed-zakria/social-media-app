import '../../data/repository/api/people_nearby_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import '../view/people_nearby_screen.dart';
import 'package:get/get.dart';

RxBool getPeopleNearbyIsLoding = true.obs;
late double currentLatitude;
late double currentLongitude;

Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToPeopleNearby() {
  return PeopleNearbyApi().getUserDataToPeopleNearby();
}

Future checkLocationSettings() async {
  bool services;
  services = await Geolocator.isLocationServiceEnabled();
  if (services) {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied) {
      Get.to(() => const PeopleNearbyScreen());
    } else {
      permission = await Geolocator.requestPermission();
    }
  } else {
    Get.snackbar(
      'Error'.tr,
      'You must activate the location service first'.tr,
    );
  }
}

Future getLocationPeopleNearby() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  currentLatitude = position.latitude;
  currentLongitude = position.longitude;
  getPeopleNearbyIsLoding.value = false;
}

String calculateDistance({
  required double currentLatitude,
  required double currentLongitude,
  required double endLatitude,
  required double endLongitude,
}) {
  double distance = Geolocator.distanceBetween(
    currentLatitude,
    currentLongitude,
    endLatitude,
    endLongitude,
  );
  if (distance < 1000) {
    return "${distance.toInt()} M";
  } else {
    return "${(distance / 1000).toStringAsFixed(2)} Km";
  }
}
