import 'package:flutter/material.dart';
import 'widgets/search_body.dart';
import 'widgets/search_custom_appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchCustomAppbar(),
      ),
      body: const SearchBody(),
    );
  }
}
