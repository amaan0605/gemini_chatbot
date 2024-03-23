import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChipProvider extends ChangeNotifier {
  final List<String> _genreList = ['action'];
  final List<String> _countryList = ['india'];
  final List<String> _gameList = ['Trivia'];
  bool isSelected = false;

  List<String> get genreList => _genreList;
  List<String> get countryList => _countryList;
  List<String> get gameList => _gameList;
  // bool get isSelected => _isSelected;

  addGenreList(String item) {
    genreList.add(item);
    notifyListeners();
  }

  addCounryList(String item) {
    countryList.add(item);
    notifyListeners();
  }

  addGameList(String item) {
    gameList.add(item);
    notifyListeners();
  }

  toggleSelection() {
    isSelected = !isSelected;
    notifyListeners();
  }
}
