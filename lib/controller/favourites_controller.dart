import 'package:get/get.dart';
import '../models/persons.dart';

class FavoritesController extends GetxController {
  var favoriteList = <Datum>[].obs;

  void addFavorite(Datum person) {
    if (!favoriteList.contains(person)) {
      favoriteList.add(person);
    }
  }

  void removeFavorite(Datum person) {
    favoriteList.remove(person);
  }

  bool isFavorite(Datum person) {
    return favoriteList.contains(person);
  }
}
