import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppDBConstants,
        FirebaseFirestore,
        Helpers,
        OrderFields,
        OrderModel,
        OrderType;
import 'package:product_listing_pkg/test_data/test_data.dart';

class OrderController extends ChangeNotifier {
  final db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> get orders => TestData.orders;

  bool get hasUnreadOrder => orders.any((value) => !value['isRead']);

  void markAllAsRead() {
    for (var order in orders) {
      order['isRead'] = true;
    }
    notifyListeners();
  }

  String getOrderStatus(OrderType type) {
    var image = 'assets/images/verify.png';
    switch (type) {
      case OrderType.confirmed:
        image = 'assets/images/verify.png';
        break;
      case OrderType.shipping:
        image = 'assets/images/box_time.png';
        break;
    }
    return image;
  }

  Map<String, OrderModel> _userOrders = {};
  Map<String, OrderModel> get userOrders => _userOrders;
  set userOrders(Map<String, OrderModel> value) {
    _userOrders = value;
    notifyListeners();
  }

  Map<String, Map<String, OrderModel>> similarOrders = {};

  Future<bool> getUserOrders(
      {required String userId,
      int limit = 10,
      bool isRefreshMode = false}) async {
    if (similarOrders[userId] != null && !isRefreshMode) return true;
    try {
      var locationDocs = await db
          .collection(AppDBConstants.locationCollection)
          .where(OrderFields.userId, isEqualTo: userId)
          .limit(limit)
          .get();

      if (locationDocs.docs.isNotEmpty) {
        userOrders = {
          for (var e in locationDocs.docs) e.id: OrderModel.fromJson(e.data())
        };
        similarOrders[userId] = userOrders;

        return true;
      }
    } catch (e) {
      Helpers.debugLog('An error occurred while getting location: $e');
    }
    return false;
  }

  OrderModel? getOrder(int index, Map<String, OrderModel> value) {
    return value[_singleOrder(index, value)];
  }

  String _singleOrder(int index, Map<String, OrderModel> value) {
    return value.keys.elementAt(index);
  }
}
