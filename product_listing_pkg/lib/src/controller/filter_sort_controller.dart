import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show FilterType, GlobalAppUtil;

class FilterSortController extends ChangeNotifier {
  List<String> sortOptions = [
    'Recently Added',
    'Most Popular',
    'Low Price',
    'High Price',
  ];

  List<String> discoverSortOptions = [
    'Hot 🔥',
    'New Posts 🤩',
    'Users you Follow 💕',
  ];

  String _selectedSortItem = '';
  String get selectedSortItem => _selectedSortItem;

  set selectedSortItem(String value) {
    _selectedSortItem = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> filterValues = GlobalAppUtil.filterValues;

  void updateFilterValues({required String key, String? value}) {
    filterValues.firstWhere((data) => data['name'] == key)['value'] =
        value ?? '';
    notifyListeners();
  }

  Map<String, dynamic> _selectedFilterValue = {};
  Map<String, dynamic> get selectedFilterValue => _selectedFilterValue;
  set selectedFilterValue(Map<String, dynamic> value) {
    _selectedFilterValue = value;
    notifyListeners();
  }

  bool isColorValueSame(String key, String value) {
    return filterValues.firstWhere(
          (element) => element['name'] == key,
        )['value'] ==
        value;
  }

  bool _activateSizes = false;
  bool get activateSizes => _activateSizes;

  set activateSizes(bool value) {
    _activateSizes = value;
    notifyListeners();
  }

  bool _chooseAnyColor = false;
  bool get chooseAnyColor => _chooseAnyColor;

  set chooseAnyColor(bool value) {
    _chooseAnyColor = value;
    notifyListeners();
  }

  bool _chooseItemsOnSale = false;
  bool get chooseItemsOnSale => _chooseItemsOnSale;
  set chooseItemsOnSale(bool value) {
    _chooseItemsOnSale = value;
    notifyListeners();
  }

  bool _chooseItemsWithFreeShipping = false;
  bool get chooseItemsWithFreeShipping => _chooseItemsWithFreeShipping;
  set chooseItemsWithFreeShipping(bool value) {
    _chooseItemsWithFreeShipping = value;
    notifyListeners();
  }

  String? _filterTitle;
  String? get filterTitle => _filterTitle;

  set filterTitle(String? value) {
    _filterTitle = value;
    notifyListeners();
  }

  FilterType _filterValueType = FilterType.other;
  FilterType get filterValueType => _filterValueType;
  set filterValueType(FilterType value) {
    _filterValueType = value;
    notifyListeners();
  }

  double _startPrice = 0;
  double get startPrice => _startPrice;
  set startPrice(double value) {
    _startPrice = value;
    notifyListeners();
  }

  double _endPrice = 100;
  double get endPrice => _endPrice;
  set endPrice(double value) {
    _endPrice = value;
    updateFilterValues(key: filterTitle ?? '', value: value.toStringAsFixed(0));
    notifyListeners();
  }

  bool get showFilterChildren => filterTitle != null;

  bool get showFilterTitleRange => filterTitle == 'Price';

  bool get showFilterColors => filterTitle == 'Color';

  List<String> filterChildrenValues(String key) {
    if (key.isEmpty) {
      return filterValues.firstWhere((data) => data['name'] == key)['options'];
    }
    return [];
  }

  final Map<String, Color> _filterColors = {
    'Red': Colors.red,
    'Yellow': Colors.yellow,
    'White': Colors.white,
    'Gray': Colors.grey,
    'Black': Colors.black,
    'Brown': Colors.brown,
    'Blue': const Color(0xff5185F8),
    'Cream': const Color(0xffEFE6B8),
    'Tan': const Color(0xffE8BD87),
    'Khaki': const Color(0xff8A7F32),
    'Navy': const Color(0xff0A2452),
    'Green': Colors.green,
    'Burgundy': const Color(0xff8F1C16),
    'Silver': const Color(0xffC0C0C0)
  };
  Map<String, Color> get filterColors => _filterColors;

  String _selectedColor = 'Black';
  String get selectedColor => _selectedColor;

  set selectedColor(String value) {
    _selectedColor = value;
    notifyListeners();
  }

  void getColorSelected(Color value) {
    selectedColor = _filterColors.keys.firstWhere(
      (element) => filterColors[element] == value,
    );
  }
}
