import '../../data/repository/search_screen_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

RxString getSearchResult = ''.obs;
Future<QuerySnapshot<Map<String, dynamic>>> getDataFuture() {
  return SearchScreenApi().getDataFuture();
}
