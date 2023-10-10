import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PeopleNearbyRepo {
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToPeopleNearby();
  
}
