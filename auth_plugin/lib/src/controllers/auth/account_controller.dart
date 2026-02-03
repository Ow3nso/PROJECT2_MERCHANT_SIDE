import 'package:flutter/material.dart';

import '../../utils/app_util.dart';

class AccountController extends ChangeNotifier {
  List<Map<String, dynamic>> stats = AppUtil.stats;

  List<Map<String, dynamic>> accountOptions = AppUtil.accountOptions;
}
