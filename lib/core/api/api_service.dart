import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import '../constant/collections.dart';

abstract class ApiService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static User get user => auth.currentUser!;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static FirebaseStorage fireStorage = FirebaseStorage.instance;

  static FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static updateUserStatus({required bool status}) async {
    firestore.collection(Collections.userCollection).doc(user.uid).update({
      'isOnline': status,
    });
  }

  static updateUserLocation() async {
    bool services;
    services = await Geolocator.isLocationServiceEnabled();
    if (services) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.denied) {
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          await ApiService.firestore
              .collection(Collections.userCollection)
              .doc(ApiService.user.uid)
              .update({
            'latitude': position.latitude,
            'longitude': position.longitude,
          });
        }
      } else {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        await ApiService.firestore
            .collection(Collections.userCollection)
            .doc(ApiService.user.uid)
            .update({
          'latitude': position.latitude,
          'longitude': position.longitude,
        });
      }
    }
  }
}
