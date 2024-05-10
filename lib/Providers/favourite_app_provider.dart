import 'package:flutter/foundation.dart';

class FavouriteAppProvider with ChangeNotifier {
  List<int> _listOfFavouriteIndexes = [];

  List<int> get listOfFavouriteIndexes => _listOfFavouriteIndexes;

  void addFavourite(int index) {
    _listOfFavouriteIndexes.add(index);
    notifyListeners();
  }

  void removeFavourite(int index) {
    _listOfFavouriteIndexes.remove(index);
    notifyListeners();
  }
}
