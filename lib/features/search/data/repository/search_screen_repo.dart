import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SearchScreenRepo {
  Future<QuerySnapshot<Map<String, dynamic>>> getDataFuture();
}
