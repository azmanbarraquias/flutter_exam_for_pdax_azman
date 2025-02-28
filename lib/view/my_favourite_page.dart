import 'package:flutter/material.dart';
import 'package:flutter_exam_for_pdax_azman/view/person_detail_page.dart';
import 'package:flutter_exam_for_pdax_azman/widgets/person_list_item.dart';
import 'package:get/get.dart';

import '../controller/favourites_controller.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Favourite Page'),
      ),
      body: Obx(() {
        if (favoritesController.favoriteList.isEmpty) {
          return Center(child: Text("No favorites added yet"));
        }
        return ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: favoritesController.favoriteList.length,
          itemBuilder: (ctx, index) {
            final personData = favoritesController.favoriteList[index];
            final personURL = 'https://picsum.photos/200/300?random=$index';

            return PersonListItem(
              key: ValueKey(personData.id),
              name: '${index + 1}. ${personData.getFullName()}',
              email: personData.email,
              image: personURL,
              onTap: () {
                Get.to(
                  PersonDetailPage(),
                  arguments: {
                    'id': personData.id,
                    'name': personData.getFullName(),
                    'email': personData.email,
                    'image': personURL,
                  },
                );
              },
              isFev: favoritesController.isFavorite(personData),
              fevTap: () {
                if (favoritesController.isFavorite(personData)) {
                  favoritesController.removeFavorite(personData);
                } else {
                  favoritesController.addFavorite(personData);
                }
              },
            );
          },
        );
      }),
    );
  }
}
