import 'package:flutter/material.dart';
import 'package:needai/presentation/screens/courses/oneCourse.dart';

class AddToFavourites extends ChangeNotifier {
  final List<OneCourse> _favourites = [];

  List<OneCourse> get favourites => _favourites;

  void addToFav(OneCourse course) {
    if (!_favourites.contains(course)) {
      _favourites.add(course);
      notifyListeners();
    }
  }

  void removeFromFav(OneCourse course) {
    _favourites.remove(course);
    notifyListeners();
  }

  bool isFavourite(OneCourse course) {
    return _favourites.contains(course);
  }
}
