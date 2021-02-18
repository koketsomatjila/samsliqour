import 'package:flutter/material.dart';

enum SearchBy { PRODUCTS, CATEGORIES }

class AppProvider with ChangeNotifier {
  bool isLoading = false;
  SearchBy search = SearchBy.PRODUCTS;
  void changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
