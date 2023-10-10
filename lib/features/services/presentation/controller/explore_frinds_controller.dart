import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/repository/api/explore_frinds_api.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToExploreFrinds() {
  return ExploreFrindsApi().getUserDataToExploreFrinds();
}
