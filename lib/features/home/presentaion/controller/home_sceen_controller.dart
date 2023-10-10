import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../posts/data/model/post_model.dart';
import '../../../stories/data/model/stories_model.dart';
import '../../data/repository/home_screen_api.dart';
import 'package:flutter/material.dart';

TextEditingController getTextStory = TextEditingController();

Future<DocumentSnapshot<Map<String, dynamic>>> getAllUserData() {
  return HomeScreenApi().getAllUserData();
}

Future<List<StoriesModel>> getCurrentUserStory() {
  return HomeScreenApi().getCurrentUserStory();
}

Future<List<List<StoriesModel>>> getAllUsersStories() {
  return HomeScreenApi().getAllUsersStories();
}

Future<List<PostModel>> getAllPosts() {
  return HomeScreenApi().getAllPosts();
}