import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ExploreFrindsRepo {
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToExploreFrinds();
}
