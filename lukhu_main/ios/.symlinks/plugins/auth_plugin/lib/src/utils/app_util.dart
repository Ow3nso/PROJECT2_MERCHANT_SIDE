import 'dart:math';

import 'package:auth_plugin/src/pages/gift_cards.dart';
import 'package:auth_plugin/src/utils/product.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AccountType,
        AppDBConstants,
        DeliveryStatus,
        GlobalAppUtil,
        ImageUploadType,
        OrdersViewPage,
        ShopFields,
        UserFields;

import '../pages/earn.dart';

class AppUtil {
  static String officialSite = 'https://lukhu.co/';
  static String packageName = 'auth_plugin';
  static Duration animationDuration = const Duration(milliseconds: 300);
  static String iconVerifiedSvg = 'assets/images/star.png';
  static String callIcon = 'assets/images/call.png';
  static String location = 'assets/images/location_outlined.png';
  static String editIcon = 'assets/icons/edit_icon.png';
  static String accountSecurityIcon = 'assets/icons/security_user.png';
  static String notificationIcon = 'assets/icons/notification.png';
  static String helpIcon = 'assets/icons/like_shapes.png';
  static String supportIcon = 'assets/icons/call_received.png';
  static String versionIcon = 'assets/icons/mobile.png';
  static String rateIcon = 'assets/icons/ranking.png';
  static String aboutIcon = 'assets/icons/global.png';
  static String logoutIcon = 'assets/icons/logout.png';
  static String alertIcon = 'assets/images/alert_circle.png';
  static String trashIcon = 'assets/images/trash.png';
  static String paymentIcon = 'assets/icons/payment_icon.png';
  static String copyIcon = 'assets/images/copy.png';
  static String infoIcon = 'assets/icons/info_icon.png';

  static String errorAvatar =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60';

  static List<Map<String, dynamic>> stats = [
    {'name': 'Followers', 'value': '287'},
    {'name': 'Following', 'value': '287'},
    {'name': 'Lukhu Points', 'value': '100'}
  ];

  static List<Map<String, dynamic>> accountOptions = [
    {
      'name': 'Orders',
      'image': 'assets/icons/box.png',
      'route': OrdersViewPage.routeName,
    },
    {
      'name': 'Wallet',
      'image': 'assets/icons/empty_wallet.png',
      'route': 'wallet',
    },
    {
      'name': 'Earn',
      'image': 'assets/icons/moneys.png',
      'route': EarnPage.routeName,
    },
    {
      'name': 'Gift Cards',
      'image': 'assets/icons/card_tick.png',
      'route': GiftCardPage.routeName,
    },
  ];

  static List<Map<String, dynamic>> locationCategory = [
    {'image': 'assets/images/house.png', 'title': 'Home'},
    {'image': 'assets/images/buildings.png', 'title': 'Office'},
    {'image': 'assets/images/more_circle.png', 'title': 'Other'}
  ];

  static String getImageType(String value) {
    switch (value) {
      case 'Home':
        return 'assets/images/house.png';
      case 'Office':
        return 'assets/images/buildings.png';
      case 'Other':
        return 'assets/images/more_circle.png';
      default:
        return '';
    }
  }

  static List<String> pathToUpload(ImageUploadType value) {
    switch (value) {
      case ImageUploadType.profile:
        return [
          'user_images',
          AppDBConstants.usersCollection,
          UserFields.imageUrl
        ];
      case ImageUploadType.header:
        return [
          'user_images/header',
          AppDBConstants.shopCollection,
          ShopFields.coverImage
        ];
      case ImageUploadType.logo:
        return [
          'user_images/logo',
          AppDBConstants.shopCollection,
          ShopFields.imageUrl,
        ];
      default:
        return [
          'user_images',
          AppDBConstants.usersCollection,
          UserFields.imageUrl
        ];
    }
  }

  static List<Map<String, dynamic>> socialMedia = [
    {
      'image': 'assets/icons/instagram.png',
      'color': const Color(0xFF000100),
      'value': 'Your Instagram handle',
    },
    {
      'image': 'assets/icons/facebook.png',
      'color': const Color(0xFF1877F2),
      'value': 'Your Facebook handle',
    },
    {
      'image': 'assets/icons/whatsapp.png',
      'color': const Color(0xFF00A61B),
      'value': 'Your WhatsApp number',
    },
    {
      'image': 'assets/icons/twitter.png',
      'color': const Color(0xFF1DA1F2),
      'value': 'Your Twitter handle',
    },
  ];

  static String gloablSearchIcon = 'assets/icons/global-search.png';

  static List<Product> products = [
    Product(
      price: '3,200',
      image:
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
    ),
    Product(
      price: '3,200',
      image:
          'https://images.unsplash.com/photo-1622519407650-3df9883f76a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFzaGlvbiUyMG1lbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
    ),
    Product(
      price: '3,200',
      isSoldOut: true,
      image:
          'https://images.unsplash.com/photo-1622519407650-3df9883f76a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFzaGlvbiUyMG1lbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
    ),
  ];
  static String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  static List<Map<String, dynamic>> earnings = [
    {
      'name': 'Lukhu Influencers',
      'type': DeliveryStatus.soon,
      'description':
          'Partner with amazing fashion brands and earn with Lukhu’s influencer program',
      'image': 'assets/images/medal_star.png',
      'color': const Color(0xffFEEAEA),
    }
  ];

  static DeliveryStatus getType(Map<String, dynamic> data) =>
      data.isNotEmpty && data['type'] != null
          ? data['type'] as DeliveryStatus
          : DeliveryStatus.soon;

  static List<Map<String, dynamic>> availableGifts = [
    {
      'name': 'Gift 1',
      'value': '500',
      'price': '500',
      'image': 'assets/images/gift_1.png'
    },
    {
      'name': 'Gift 2',
      'value': '1,000',
      'price': '950',
      'image': 'assets/images/gift_2.png'
    },
  ];

  static Map<String, dynamic> terms = {
    "Redemption":
        "The Lukhu Gift Card is redeemable for merchandise only on Lukhu's website and app. The gift card cannot be redeemed for cash or applied to previous purchases.",
    "Balance":
        "The balance of the gift card can be checked on Lukhu's website or app or by contacting Lukhu's customer service.",
    "Expiration":
        "The Lukhu Gift Card is valid for 1 year from the date of purchase. Any unused balance will be forfeited after the expiration date.",
    "Non-Refundable":
        "The Lukhu Gift Card is non-refundable and cannot be exchanged for cash or credit.",
    "Non-Transferable":
        "The Lukhu Gift Card is non-transferable and cannot be resold or transferred to another person.",
    "Lost or Stolen":
        "Lukhu is not responsible for lost or stolen gift cards. The gift card should be treated like cash and cannot be replaced if lost or stolen.",
    "Fraud":
        "Lukhu reserves the right to refuse, cancel or hold gift cards and orders for suspected fraud, for any reason.",
    "Limitations":
        "Lukhu may impose limitations on the use of gift cards, such as limiting the amount that can be applied to a single order, or limiting the use of gift cards in conjunction with other promotions or discounts.",
    "Modification":
        "Lukhu reserves the right to modify the gift card terms and conditions at any time without prior notice."
  };

  static List<Map<String, dynamic>> paymentOptions = [
    {
      'name': 'Pay with Wallet',
      'account': '',
      'image': 'assets/images/lukhu.png',
      'color': const Color(0xffDC0E51),
      'type': AccountType.lukhu,
      'package': AppUtil.packageName,
    },
    {
      'name': 'Mpesa',
      'account': '',
      'image': 'assets/images/mpesa.png',
      'color': Colors.white,
      'type': AccountType.mpesa,
      'package': GlobalAppUtil.productListingPackageName,
    },
    {
      'name': 'Debit/Credit Card',
      'account': '',
      'image': 'assets/images/card_pos.png',
      'color': const Color(0xff4A4064),
      'type': AccountType.card,
      'package': AppUtil.packageName,
    },
  ];
}

enum Recipient { someone, myself }
