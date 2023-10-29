import '../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../controller/search_screen_controller.dart';
import '../../../data/model/search_model.dart';
import 'package:flutter/material.dart';
import 'search_custom_person.dart';
import 'package:get/get.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => FutureBuilder(
            future: getDataFuture(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
               List<SearchModel> listOfUserData = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: listOfUserData.length,
                    itemBuilder: (context, index) {
                      return SearchCustomPerson(
                        userData: listOfUserData[index],
                      );
                    },
                  ),
                );
              } else {
                return const CustomPersonaListTileShimmer();
              }
            },
          ),
        ),
      ],
    );
  }
}
