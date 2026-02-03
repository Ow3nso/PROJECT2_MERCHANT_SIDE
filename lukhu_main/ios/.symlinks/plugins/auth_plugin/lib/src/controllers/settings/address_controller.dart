import 'package:flutter/material.dart';

import '../../utils/app_util.dart';

class AddressController extends ChangeNotifier {
  List<Map<String, dynamic>> address = [
    {
      'image': 'assets/images/house.png',
      'type': 'Home',
      'phone': '0712 345 678',
      'place': 'House 10, Sagona Valey',
      'isChecked': true,
    }
  ];
  List<Map<String, dynamic>> locationCategory = AppUtil.locationCategory;

  int? _selectedLabel;
  int? get selectedLabel => _selectedLabel;
  set selectedLabel(int? value) {
    _selectedLabel = value;
    notifyListeners();
  }

  bool isLabelSelected(int index) => _selectedLabel == index;

  TextEditingController locationController = TextEditingController();
  TextEditingController houseLocationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
}
