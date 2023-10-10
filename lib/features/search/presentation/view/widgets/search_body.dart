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
    List<SearchModel> listOfUserData;

    return Column(
      children: [
        Obx(
          () => FutureBuilder(
            future: getDataFuture(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data?.docs;
                listOfUserData = data
                        ?.map((element) => SearchModel.fromJson(element.data()))
                        .toList() ??
                    [];
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
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
