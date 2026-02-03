import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext, WatchContext, UserRepository, AppDBConstants, FirebaseFirestore, Helpers, OrderFields, OrderModel;

class OrderController extends ChangeNotifier {
  final db = FirebaseFirestore.instance;
  bool _showItemsSold = false;
  bool get showItemsSold => _showItemsSold;
  set showItemsSold(bool value) {
    _showItemsSold = value;
    notifyListeners();
  }

  bool _showItemsBought = false;
  bool get showItemsBought => _showItemsBought;
  set showItemsBought(bool value) {
    _showItemsBought = value;
    notifyListeners();
  }

  Map<String, OrderModel> _orders = {};
  Map<String, OrderModel> get orders => _orders;
  set orders(Map<String, OrderModel> value) {
    _orders = value;
    notifyListeners();
  }

  Map<String, OrderModel> _returnedOrders = {};
  Map<String, OrderModel> get returnedOrders => _returnedOrders;
  set returnedOrders(Map<String, OrderModel> value) {
    _returnedOrders = value;
    notifyListeners();
  }

  String? _shopId;
  String? get shopId => _shopId;

  Map<String, Map<String, OrderModel>> similarOrders = {};

  Future<bool> getOrders({
  required BuildContext context,
  bool isRefreshMode = false,
  int limit = 10,
}) async {
  if (!isRefreshMode && similarOrders[shopId] != null) return false;
  try {
    final userId = context.read<UserRepository>().fbUser?.uid;
    if (userId == null) {
      Helpers.debugLog('User ID is null');
      return false;
    }

    // Get all orders for the shop
    var orderDocs = await db
        .collection(AppDBConstants.orderCollection)
        .where(OrderFields.shopId, isEqualTo: shopId)
        .limit(limit)
        .get();

    // Filter and process orders
    final filteredDocs = orderDocs.docs.where((doc) {
      try {
        final data = doc.data();
        if (data.containsKey('items') && data['items'] is List) {
          return data['items'].any((item) => 
            item is Map && item['sellerId'] == userId);
        }
        return false;
      } catch (e) {
        Helpers.debugLog('Error filtering order ${doc.id}: $e');
        return false;
      }
    }).toList();

    // Process filtered orders
    final Map<String, OrderModel> tempOrders = {};
    for (var doc in filteredDocs) {
      try {
        final orderData = doc.data();
        Helpers.debugLog('Processing order: ${doc.id}');
        
        // Convert items to proper format if needed
        if (orderData['items'] is List) {
          orderData['items'] = (orderData['items'] as List).map((item) {
            if (item is Map) {
              // Ensure color is properly formatted
              if (item['color'] is List) {
                item['color'] = (item['color'] as List).whereType<String>().toList();
              }
              return item;
            }
            return {};
          }).toList();
        }

        tempOrders[doc.id] = OrderModel.fromJson(orderData);
      } catch (e) {
        Helpers.debugLog('Error processing order ${doc.id}: $e');
      }
    }

    if (tempOrders.isNotEmpty) {
      orders = tempOrders;
      similarOrders[shopId!] = orders;
      return true;
    }
    return false;
  } catch (e) {
    Helpers.debugLog('An error occurred while fetching orders: $e');
    return false;
  }
}

  Future<bool> getReturnedOrders({
    bool isRefreshMode = false,
    int limit = 10,
  }) async {
    if (!isRefreshMode && similarOrders[shopId] != null) return false;
    try {
      var orderDocs = await db
          .collection(AppDBConstants.orderCollection)
          .where(OrderFields.shopId, isEqualTo: shopId)
          .where(OrderFields.status, isEqualTo: true)
          .limit(limit)
          .get();
          
      for (var doc in orderDocs.docs) {
	  print('Order Data: ${doc.data()}'); // Check the structure
	}

      if (orderDocs.docs.isNotEmpty) {
        returnedOrders = {
          for (var e in orderDocs.docs) e.id: OrderModel.fromJson(e.data())
        };
        similarOrders[shopId!] = returnedOrders;
        return true;
      }
    } catch (e) {
      Helpers.debugLog('An error occurred while fetching orders: $e');
    }
    return false;
  }

  String _orderKey(int index, Map<String, OrderModel> value) {
    return value.keys.elementAt(index);
  }

  OrderModel? order(int index, Map<String, OrderModel> value) {
    return value[_orderKey(index, value)];
  }
}
