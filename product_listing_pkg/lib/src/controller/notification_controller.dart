import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DeliveryStatus;
import 'package:product_listing_pkg/src/pages/notification/pages/promotions_update_view.dart';
import 'package:product_listing_pkg/test_data/test_data.dart';

class NotificationController extends ChangeNotifier {
  bool get hasNotiFications => true;

  List<Map<String, dynamic>> get notificationNews => TestData.notiifcationNews;
  List<Map<String, dynamic>> get filterOrders => TestData.filterOrders;
  List<Map<String, dynamic>> get promotions => TestData.promotions;

  List<Map<String, dynamic>> get likesAndFollowers =>
      TestData.likesAndFollowers;

  String getStatusName(DeliveryStatus type) {
    var name = '';
    switch (type) {
      case DeliveryStatus.pending:
        name = 'Pending';
        break;
      case DeliveryStatus.shipping:
        name = 'Shipping';
        break;
      case DeliveryStatus.delivered:
        name = 'Delivered';
        break;
      case DeliveryStatus.cancelled:
        name = 'Cancelled';
        break;

      default:
        name = 'Pending';
    }
    return name;
  }

  PromotionUpdateType _promotionUpdateType = PromotionUpdateType.promotion;
  PromotionUpdateType get promotionUpdateType => _promotionUpdateType;

  set promotionUpdateType(PromotionUpdateType value) {
    _promotionUpdateType = value;
    notifyListeners();
  }

  String _screenTitle = 'Promotion';
  String get screenTitle => _screenTitle;

  set screenTitle(String value) {
    _screenTitle = value;
    promotionUpdateType = value.contains('Promotion')
        ? PromotionUpdateType.promotion
        : PromotionUpdateType.updates;
    notifyListeners();
  }

  bool get hasUnreadNotifications =>
      promotions.any((value) => !value['isRead']);

  bool get hasUnreadPromotions => promotions.any((value) => !value['isRead']);

  bool get hasUnreadUpdates => updates.any((value) => !value['isRead']);

  void markAllAsRead([
    String type = 'promo',
  ]) {
    for (var promo in (type.contains('promo') ? promotions : updates)) {
      promo['isRead'] = true;
    }
    notifyListeners();
  }

  List<Map<String, dynamic>> get updates => TestData.updates;

  bool get isPromotionPageOpen =>
      PromotionUpdateType.promotion == promotionUpdateType;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get filterNotifications =>
      TestData.filterNotifications;

  bool? _checkCondition;
  bool? get checkCondition => _checkCondition;
  set checkCondition(bool? value) {
    _checkCondition = value;
    notifyListeners();
  }

  void checkStatus(int index, [String type = 'notification']) {
    if (type.contains('notification')) {
      filterNotifications[index]['isChecked'] =
          !filterNotifications[index]['isChecked'];
    } else {
      filterOrders[index]['isChecked'] = !filterOrders[index]['isChecked'];
    }
    notifyListeners();
  }
}
