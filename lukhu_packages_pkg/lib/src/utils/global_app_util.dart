import 'package:flutter/material.dart';

import 'enums.dart';
import 'styles/colors.dart';

class GlobalAppUtil {
  //API Keys
  static String intaSendApiKey =
      "ISPubKey_test_311e9fee-1b44-4c35-a4ab-2a56aca48a8e";
  static String intaSendToken =
      "ISSecretKey_test_ba46e0d8-dad6-49f0-8fd6-91a6c3ff26d9";
  //Packages
  static String mainPackageName = 'lukhu_packages_pkg';
  static String productListingPackageName = 'product_listing_pkg';
  static String lukhuPayPackageName = 'lukhu_pay';
  static String dukastaxPackageName = "dukastax_pkg";
  static String salesPackageName = "sales_pkg";
  //Global Icons
  static String chevronDown = 'assets/images/chevron_down.png';
  static String closeIcon = 'assets/images/close_button.png';
  static String dukastaxLogo = 'assets/images/dukastax.png';
  static List<Map<String, dynamic>> productInfo = [
    {
      'name': 'Category',
      'value': 'Unisex - Footwear',
      'type': FilterType.category,
      'options': ['Unisex', 'Womenswear', 'Menswear', 'Kidswear']
    },
    {
      'name': 'Sizes',
      'value': 'Available in Various sizes',
      'type': FilterType.sizes,
      'options': []
    },
    {
      'name': 'Condition',
      'value': 'New',
      'type': FilterType.condition,
      'options': [
        'Thrift/Pre-loved',
        'New',
        'Made in Kenya - New',
        'Made in Kenya - Thrift',
        'Upcycled'
      ]
    },
    {
      'name': 'Color',
      'value': 'White',
      'type': FilterType.color,
      'options': [
        {'name': 'Black', 'value': Colors.black},
        {'name': 'Red', 'value': Colors.red},
        {'name': 'Yellow', 'value': Colors.yellow},
        {'name': 'Green', 'value': Colors.green},
        {'name': 'Blue', 'value': Colors.blue},
        {'name': 'White', 'value': Colors.white},
        {'name': 'Grey', 'value': Colors.grey},
        {'name': 'Brown', 'value': Colors.brown},
        {'name': 'Tan', 'value': const Color(0xffE8BD87)},
        {'name': 'Cream', 'value': const Color(0xffEFE6B8)},
        {'name': 'Khaki', 'value': const Color(0xff8A7F32)},
        {'name': 'Burgundy', 'value': const Color(0xff8F1C16)},
        {'name': 'Silver', 'value': const Color(0xffC0C0C0)}
      ]
    }
  ];

  static List<Map<String, dynamic>> plans = [
    {
      "title": "Lukhu Basic",
      "image": "assets/icons/award.png",
      "package": salesPackageName,
      "status": true,
      "description":
          "Perfect for new sellers. Get access to essential features with no monthly fee.",
      "type": PlanType.free,
      "price": 0.0,
    },
    {
      "title": "Lukhu Plus",
      "image": "assets/icons/flash-circle.png",
      "package": lukhuPayPackageName,
      "status": false,
      "description":
          "For sellers looking to grow their business, the Plus plan offers advanced features.",
      "type": PlanType.paid,
      "price": 1500.0,
    },
    {
      "title": "Lukhu Premium",
      "image": "assets/icons/crown.png",
      "package": lukhuPayPackageName,
      "status": false,
      "description":
          "For established sellers with high-volume sales, this plan provides exclusive features.",
      "type": PlanType.paid,
      "price": 2500.0,
    }
  ];

  static List<Map<String, dynamic>> filterValues = [
    {
      'name': 'Location',
      'value': 'Anywhere',
      'type': FilterType.location,
      'options': [
        'Anywhere',
        'Near Me',
      ]
    },
    {
      'name': 'Category',
      'value': 'Any',
      'type': FilterType.category,
      'options': ['Unisex', 'Womenswear', 'Menswear', 'Kidswear']
    },
    {
      'name': 'Price',
      'value': 'Any',
      'type': FilterType.price,
      'options': ['100', '200']
    },
    {
      'name': 'Condition',
      'value': 'Any',
      'type': FilterType.condition,
      'options': [
        'Thrift/Pre-loved',
        'New',
        'Made in Kenya - New',
        'Made in Kenya - Thrift',
        'Upcycled'
      ]
    },
    {
      'name': 'Color',
      'value': 'White',
      'type': FilterType.color,
      'options': [
        {'name': 'Black', 'value': Colors.black},
        {'name': 'Red', 'value': Colors.red},
        {'name': 'Yellow', 'value': Colors.yellow},
        {'name': 'Green', 'value': Colors.green},
        {'name': 'Blue', 'value': Colors.blue},
        {'name': 'White', 'value': Colors.white},
        {'name': 'Grey', 'value': Colors.grey},
        {'name': 'Brown', 'value': Colors.brown},
        {'name': 'Tan', 'value': const Color(0xffE8BD87)},
        {'name': 'Cream', 'value': const Color(0xffEFE6B8)},
        {'name': 'Khaki', 'value': const Color(0xff8A7F32)},
        {'name': 'Burgundy', 'value': const Color(0xff8F1C16)},
        {'name': 'Silver', 'value': const Color(0xffC0C0C0)}
      ]
    }
  ];

  static String paymentUrl =
      'https://us-central1-lukhu-dev.cloudfunctions.net/transactions/api/v1';
  static String walletApi = '/wallets';
  static String walletTopUpApi = '/topup';
  static String topUpStatusApi = '/status';
  static String withdrawWalletApi = '/withdraw';

  /// It takes a DeliveryStatus enum and returns a List of Colors
  ///
  /// Args:
  ///   type (DeliveryStatus): DeliveryStatus.pending
  ///
  /// Returns:
  ///   A list of colors.
  static List<Color>? deliveryTextColor(DeliveryStatus type) {
    List<Color>? color;
    switch (type) {
      case DeliveryStatus.pending:
        color = [StyleColors.lukhuWarning10, StyleColors.lukhuWarning200];
        break;
      case DeliveryStatus.shipping:
        color = [StyleColors.lukhuBlue10, StyleColors.lukhuBlue];
        break;
      case DeliveryStatus.delivered:
        color = [StyleColors.shadeColor1, StyleColors.lukhuSuccess200];
        break;
      case DeliveryStatus.approved:
        color = [StyleColors.shadeColor1, StyleColors.lukhuSuccess200];
        break;
      case DeliveryStatus.cancelled:
        color = [StyleColors.lukhuError10, StyleColors.lukhuError200];
        break;

      case DeliveryStatus.soon:
        color = [StyleColors.lukhuWarning10, StyleColors.lukhuWarning200];
        break;

      case DeliveryStatus.marketPlace:
        color = [StyleColors.lukhuGrey10, StyleColors.lukhuGrey80];
        break;
      case DeliveryStatus.website:
        color = [StyleColors.lukhuGrey10, StyleColors.lukhuGrey80];
        break;
      case DeliveryStatus.pos:
        color = [StyleColors.lukhuGrey10, StyleColors.lukhuGrey80];
        break;
      case DeliveryStatus.deliveryOnly:
        color = [StyleColors.lukhuGrey10, StyleColors.lukhuGrey80];
        break;
      case DeliveryStatus.returned:
        color = [StyleColors.lukhuGrey10, StyleColors.lukhuGrey80];
        break;

      default:
        color = [StyleColors.lukhuWarning10, StyleColors.lukhuGrey80];
    }
    return color;
  }

  /// It takes a DeliveryStatus enum and returns a String
  ///
  /// Args:
  ///   type (DeliveryStatus): The type of the enum.
  ///
  /// Returns:
  ///   A string
  static String getStatusName(DeliveryStatus type) {
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
      case DeliveryStatus.soon:
        name = 'Coming Soon';
        break;

      case DeliveryStatus.approved:
        name = 'Approved';
        break;
      case DeliveryStatus.returned:
        name = 'Returned';
        break;
      case DeliveryStatus.marketPlace:
        name = 'Marketplace Order';
        break;
      case DeliveryStatus.pos:
        name = 'Pos Order';
        break;
      case DeliveryStatus.deliveryOnly:
        name = 'Delivery Only';
        break;
      default:
        name = 'Pending';
    }
    return name;
  }

  static List<Map<String, dynamic>> optionColors = [
    {"name": "Black", "color": Colors.black},
    {"name": "White", "color": Colors.white},
    {"name": "Red", "color": Colors.red},
    {"name": "Green", "color": Colors.green},
    {"name": "Blue", "color": Colors.blue},
    {"name": "Yellow", "color": Colors.yellow},
    {"name": "Orange", "color": Colors.orange},
    {"name": "Purple", "color": Colors.purple},
    {"name": "Grey", "color": Colors.grey},
    {"name": "Brown", "color": Colors.brown},
    {"name": "Pink", "color": Colors.pink},
    {"name": "Teal", "color": Colors.teal},
    {"name": "Cyan", "color": Colors.cyan},
    {"name": "Lime", "color": Colors.lime},
    {"name": "Indigo", "color": Colors.indigo},
    {"name": "Light Blue", "color": Colors.lightBlue},
    {"name": "Light Green", "color": Colors.lightGreen},
    {"name": "Amber", "color": Colors.amber},
    {"name": "Deep Orange", "color": Colors.deepOrange},
    {"name": "Deep Purple", "color": Colors.deepPurple},
    {"name": "Blue Grey", "color": Colors.blueGrey},
    {"name": "Tan", "color": Colors.brown[300]},
    {"name": "Gold", "color": Colors.amber[700]},
    {"name": "Silver", "color": Colors.grey[300]},
    {"name": "Bronze", "color": Colors.brown[700]},
    {"name": "Multi", "color": Colors.grey[300]},
    {"name": "Khaki", "color": const Color(0xff8A7F32)},
    {"name": "Navy", "color": const Color(0xff000080)},
    {"name": "Maroon", "color": const Color(0xff800000)},
    {"name": "Olive", "color": const Color(0xff808000)},
    {"name": "Burgundy", "color": const Color(0xff800020)},
    {"name": "Coral", "color": const Color(0xffFF7F50)},
    {"name": "Mint", "color": const Color(0xff98FB98)},
    {"name": "Lavender", "color": const Color(0xffE6E6FA)},
    {"name": "Beige", "color": const Color(0xffF5F5DC)},
    {"name": "Copper", "color": const Color(0xffB87333)},
    {"name": "Cream", "color": const Color(0xffFFFDD0)},
    {"name": "Lilac", "color": const Color(0xffC8A2C8)},
    {"name": "Turquoise", "color": const Color(0xff40E0D0)},
    {"name": "Rust", "color": const Color(0xffB7410E)},
    {"name": "Mauve", "color": const Color(0xffE0B0FF)},
    {"name": "Taupe", "color": const Color(0xff483C32)},
    {"name": "Wine", "color": const Color(0xff722F37)},
    {"name": "Charcoal", "color": const Color(0xff36454F)},
    {"name": "Aqua", "color": const Color(0xff00FFFF)},
    {"name": "Lime", "color": const Color(0xff00FF00)},
    {"name": "Magenta", "color": const Color(0xffFF00FF)},
    {"name": "Crimson", "color": const Color(0xffDC143C)},
    {"name": "Fuchsia", "color": const Color(0xffFF00FF)},
    {"name": "Wheat", "color": const Color(0xffF5DEB3)},
    {"name": "Plum", "color": const Color(0xffDDA0DD)},
  ];
}
