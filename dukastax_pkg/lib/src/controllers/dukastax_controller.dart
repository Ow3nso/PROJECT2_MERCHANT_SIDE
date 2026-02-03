import 'package:flutter/material.dart';

class DukastaxController extends ChangeNotifier {
  String _sellerExperience = '';
  String get sellerExperience => _sellerExperience;
  set sellerExperience(String value) {
    _sellerExperience = value;
    notifyListeners();
  }
}
