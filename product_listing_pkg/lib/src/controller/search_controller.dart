import 'package:flutter/material.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

class ProductSearchController extends ChangeNotifier {
  List<Map<String, dynamic>> searchCategory = AppUtil.searchCategories;

  TextEditingController searchController = TextEditingController();

  String _selectedMenuItem = 'New In';
  String get selecetedMenuItem => _selectedMenuItem;
  set selecetedMenuItem(String value) {
    _selectedMenuItem = value;
    notifyListeners();
  }

  List<String> _dataList = [];
  List<String> get dataList => _dataList;
  set dataList(List value) {
    if (value.isNotEmpty) {
      _dataList = value as List<String>;
    }

    notifyListeners();
  }

  int _categoryIndex = 0;
  int get categoryIndex => _categoryIndex;
  set categoryIndex(int value) {
    _categoryIndex = value;
    notifyListeners();
  }

  bool _showOnSale = false;
  bool get showOnSale => _showOnSale;
  set showOnSale(bool value) {
    _showOnSale = value;
    notifyListeners();
  }

  bool get isSearchEmpty => searchController.text.isNotEmpty;

  List<Map<String, dynamic>> searchItems = AppUtil.searchItems;

  List<Map<String, dynamic>> searchPeople = AppUtil.searchPeople;
}
