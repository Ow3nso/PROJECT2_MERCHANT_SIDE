import 'package:auth_plugin/src/utils/app_util.dart';
import 'package:flutter/material.dart';

import '../../utils/product.dart';

class UserItemController extends ChangeNotifier {
  List<Product> products = AppUtil.products;
}
