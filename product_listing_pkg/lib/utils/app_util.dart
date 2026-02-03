import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AccountType, DeliveryStatus, Product, StyleColors;
import 'data/category_data.dart';

class AppUtil {
  static String packageName = 'product_listing_pkg';
  static Duration animationDuration = const Duration(milliseconds: 300);
  static double borderRadius = 8;
  static List<CategoryData> categoryData = [
    const CategoryData(
      'assets/images/dress_icon.png',
      'Women',
    ),
    const CategoryData(
      'assets/images/icon_trouser.png',
      'Men',
    ),
    const CategoryData(
      'assets/images/icon_kids.png',
      'Kids',
    ),
    const CategoryData(
      'assets/images/icon_unisex.png',
      'Unisex',
    ),
    const CategoryData(
      'assets/images/icon_menu.png',
      'All',
    ),
  ];

  static List<Product> products = [
    Product(
      price: 3200,
      heroImage:
          'https://images.unsplash.com/photo-1475180098004-ca77a66827be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      isOnDiscount: true,
      description: ' 10% Off',
    ),
    Product(
      heroImage:
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzaGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
      price: 3200,
      isOnDiscount: true,
      description: ' 10% Off',
    ),
  ];

  //
  static String userIcon = "assets/icons/user-square.png";

  static List<Product> pickedProducts = [
    //
  ];

  //Tags
  static String offerInputTag = 'offerInputTag';
  static String offerDescriptionTag = 'offerDescriptionTag';
  static String offerButtonTag = 'offerButtonTag';
  static String offerCancelTag = 'offerCancelTag';

  static List<Product> ourPicks = [];

  static List<Product> itemsLoved = [];

  static List<Product> recentlyView = [];

  static String shopBanner = 'assets/images/shop.png';
  static String backgroundBanner = 'assets/images/boosted_store_background.png';
  static String bagImage = 'assets/images/bag_image.png';
  static String iconOfferHourlyImage = 'assets/images/light_sale.png';
  static String iconVerified = 'assets/images/star_icon_verified.png';
  static String iconOfferImage = 'assets/images/discount_shape.png';
  static String iconVerifiedSvg = 'assets/images/star.png';
  static String filterAssetImage = 'assets/images/filter_square.png';
  static String sortAssetImage = 'assets/images/filter_sort.png';
  static String sortListingIcon = 'assets/images/sort.png';
  static String filterListingIcon = 'assets/images/filter.png';
  static String arrowLeft = 'assets/images/back_button.png';
  static String luhkuMainLogo = 'assets/images/lukhu_main_logo.png';
  static String notificationBell = 'assets/images/notification_bell.png';
  static String bagImage2 = 'assets/images/bag_2.png';
  static String addImage = 'assets/images/add.png';
  static String likedHeart = 'assets/images/heart_filled.png';
  static String filterSquareSvg = 'assets/images/filter_square_discovery.png';
  static String shoppingBag = 'assets/images/shopping_bag.png';
  static String sortIcon = 'assets/images/discover_sort.png';
  static String activeCart = 'assets/images/bag_tick.png';
  static String documentIcon = 'assets/svg/icon_document.svg';
  static String galleryAddIcon = 'assets/svg/icon_gallery_add.svg';
  static String iconVideo = 'assets/svg/icon_video.svg';
  static String iconSearch = 'assets/images/search_icon.png';
  static String iconMessage = 'assets/images/message.png';
  static String iconCall = 'assets/images/call.png';
  static String iconSend = 'assets/images/send.png';
  static String iconTrash = 'assets/images/trash.png';
  static String iconAlert = 'assets/images/alert_circle.png';
  static String iconHeart = 'assets/images/heart.png';
  static String iconClose = 'assets/images/close_button.png';
  static String iconCircleCheck = 'assets/svg/icon_check_circle.svg';
  static String iconFlag = 'assets/images/flag.png';
  static String iconMessages = 'assets/images/messages.png';
  static String iconTicketDiscount = 'assets/svg/icon_ticket_discount.svg';
  static String iconFilterEdit = 'assets/images/filter_edit.png';
  static String iconInfo = 'assets/svg/icon_info.svg';
  static String iconBoxSearch = 'assets/images/box_search.png';
  static String iconNotification = 'assets/images/notification.png';
  static String iconAlertTriangle = 'assets/images/alert_triangle.png';
  static String iconCalling = 'assets/images/call_calling.png';
  static String iconVerify = 'assets/images/verify.png';
  static String iconBoxSvg = 'assets/svg/icon_box_search.svg';
  static String iconVerifyCircle = 'assets/images/verify.png';
  static String locationOutlined = 'assets/images/location_outlined.png';
  static String arrowDown = 'assets/images/chevron_down.png';
  static String arrowUp = 'assets/images/chevron_up.png';
  static String hourGlass = 'assets/svg/hour_glass.svg';
  static String bagCross = 'assets/images/bag_cross.png';
  static String addArchiveIcon = 'assets/images/archive_add.png';
  static String tickArchiveIcon = 'assets/images/archive_tick.png';
  static String closeCircleIcon = 'assets/images/close_circle.png';

  static String getLocationIcon(String value) {
    switch (value) {
      case 'Home':
        return 'assets/images/house.png';

      case 'Office':
        return 'assets/images/buildings.png';
      case 'Other':
        return 'assets/images/more_circle.png';
      default:
        return 'assets/images/house.png';
    }
  }

  static String shareBag = "assets/images/share_bag.png";

  static String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  static String paymentUrl =
      "https://us-central1-lukhu-dev.cloudfunctions.net/transactions/api/v1";
  static String documeDownloadIcon = "assets/icons/document-download.png";
  static String messageQuestionIcon = "assets/icons/message-question.png";
  static String dotIcon = "assets/icons/_Dot.png";

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
      case DeliveryStatus.cancelled:
        color = [StyleColors.lukhuError10, StyleColors.lukhuError200];
        break;

      default:
        color = [StyleColors.lukhuWarning10, StyleColors.lukhuWarning200];
    }
    return color;
  }

  static List<Map<String, dynamic>> paymentOptions = [
    {
      'name': 'Mpesa',
      'account': '',
      'image': 'assets/images/mpesa.png',
      'color': Colors.white,
      'type': AccountType.mpesa,
      'package': packageName,
      'isSelected': false,
    },
    {
      'name': 'Master Card',
      'account': '',
      'image': 'assets/images/mastercard.png',
      'color': Colors.white,
      'type': AccountType.mastercard,
      'package': packageName,
      'isSelected': false,
    },
    {
      'name': 'Master Card',
      'account': '',
      'image': 'assets/images/visa_logo.png',
      'color': Colors.white,
      'type': AccountType.visa,
      'package': packageName,
      'isSelected': false,
    },
    {
      'name': 'Debit Card',
      'account': '',
      'image': 'assets/images/visa_logo.png',
      'color': Colors.white,
      'type': AccountType.debit,
      'package': packageName,
      'isSelected': false,
    },
  ];

  static List<Map<String, dynamic>> pickUpPoints = [
    {
      'name': 'Town',
      'value': 'Town',
      'isOpen': false,
      'options': [
        'Nairobi',
        'Mombasa',
        'Nakuru',
        'Eldoret',
        'Kisumu',
      ]
    },
    {
      'name': 'Main Road',
      'value': 'Main Road',
      'isOpen': false,
      'options': [
        'CBD',
        'Waiyaki Way',
        'Ngong Road',
        'Mombasa Road',
      ]
    }
  ];

  static List<Map<String, dynamic>> searchCategories = [
    {
      'name': 'Women',
      'value': '',
      'data': [
        {'name': 'New In', 'options': []},
        {
          'name': 'Tops',
          'options': [
            'Crop Tops',
            'T-shirts',
            'Shirts',
            'Vests',
            'Blouses',
            'Body Suits',
            'Bralets',
            'Bandeau tops',
            'Cami tops',
            'Jerseys',
            'Corsets',
            'Other',
            'View All'
          ]
        },
        {
          'name': 'Bottoms',
          'options': [
            'Bootcut jeans',
            'Boyfriend jeans',
            'Casual trousers',
            'Culottes',
            'Dungarees',
            'Flare jeans',
            'High waisted jeans',
            'Leggings',
            'Ripped jeans',
            'Shorts',
            'Skinny jeans',
            'Pencil skirts',
            'Skirts',
            'Mini skirts',
            'Maxi skirts',
            'Pencil skirts',
            'Pleated skirts',
            'Joggers',
            'Other',
            'View All'
          ]
        },
        {
          'name': 'Dresses',
          'options': [
            'Babydoll dresses',
            'Bodycon dresses',
            'Casual dresses',
            'Evening dresses',
            'Going out dresses',
            'Jumpsuits',
            'Maxi dresses',
            'Midi dresses',
            'Rompers',
            'Suits',
            'Summer dresses',
            'Other'
          ]
        },
        {
          'name': 'Underwear',
          'options': [
            'Bras',
            'Camisoles',
            'Nightgowns',
            'Pyjamas',
            'Robes',
            'Swimwear',
            'Lingerie',
            'Other',
          ]
        },
        {
          'name': 'Outerwear',
          'options': [
            'Blazers',
            'Bomber Jackets',
            'Capes & Ponchos',
            'Denim jackets',
            'Faux fur coats',
            'Gilets',
            'Kimonos',
            'Leather jackets',
            'Parkas',
            'Pea coats',
            'Puffer jackets',
            'Jumpers',
            'Track jackets',
            'Windbreakers',
            'Hoodies',
            'Sweatshirts',
            'Cardigans',
            'Jumpers',
            'Other',
            'View All'
          ]
        },
        {
          'name': 'Accessories',
          'options': [
            'Bags & Purses',
            'Belts',
            'Hair accessories',
            'Hats',
            'Scarves',
            'Socks',
            'Sunglasses',
            'Tights',
            'Wallets',
            'Watches',
            'Gloves',
            'Other',
            'View All'
          ]
        },
        {
          'name': 'Shoes',
          'options': [
            'Boots',
            'Flats',
            'Heels',
            'Knee high boots',
            'Loafers',
            'Platforms',
            'Sandals',
            'Slides',
            'Sneakers',
            'Trainers',
            'Wedges',
            'Over the knee boots',
            'Brogues',
            'Chelsea boots',
            'Over the knee boots',
            'Other',
            'View All'
          ]
        },
      ]
    },
    {
      'name': 'Men',
      'value': '',
      'data': [
        {'name': 'New In', 'options': []},
        {
          'name': 'Tops',
          'options': [
            'Cardigans',
            'Causal shirts',
            'Formal shirts',
            'Hoodies',
            'Jumpers',
            'Polo shirts',
            'Sweatshirts',
            'T-shirts',
            'Vests',
            'Other',
            'Jerseys',
            'Other',
            'View All'
          ]
        },
        {
          'name': 'Bottoms',
          'options': [
            'Casual trousers',
            'Dress trousers',
            'Dungarees',
            'Jeans',
            'Joggers',
            'Shorts',
            'Tracksuits',
          ]
        },
        {
          'name': 'Underwear',
          'options': [
            'Boxers',
            'Briefs',
            'Swimwear',
          ]
        },
        {
          'name': 'Outerwear',
          'options': [
            'Blazer',
            'Bomber jackets',
            'Capes and Ponchos',
            'Denim jackets',
            'Gilets',
            'Leather jackets',
            'Parkas',
            'Pea coats',
            'Puffer jackets',
            'Suits',
            'Track jackets',
            'Trench coats',
            'Windbreakers',
          ]
        },
        {
          'name': 'Accessories',
          'options': [
            'Bags',
            'Belts',
            'Caps',
            'Gloves',
            'Hats',
            'Scarves',
            'Socks',
            'Sunglasses',
            'Watches',
          ]
        },
        {
          'name': 'Shoes',
          'options': [
            'Ankle boots',
            'Casual shoes',
            'Dress shoes',
            'Flip Flops',
            'Trainers',
            'Other',
            'Boots',
            'Brogues',
            'Chelsea boots',
            'Sneakers',
            'Slides',
            'View All'
          ]
        },
      ]
    },
    {
      'name': 'Unisex',
      'value': '',
      'data': [
        {'name': 'New In', 'options': []},
        {'name': 'Tops', 'options': []},
        {'name': 'Bottoms', 'options': []},
        {'name': 'Outerwear', 'options': []},
        {'name': 'Accessories', 'options': []},
        {'name': 'Shoes', 'options': []},
        {'name': 'Suits', 'options': []},
        {'name': 'Bags', 'options': []},
      ]
    },
    {
      'name': 'Kids',
      'value': '',
      'data': [
        {'name': 'New In', 'options': []},
        {'name': 'Babies', 'options': []},
        {'name': 'Girls', 'options': []},
        {'name': 'Boys', 'options': []},
        {'name': 'Unisex', 'options': []},
        {'name': 'Accessories', 'options': []},
        {'name': 'Shoes', 'options': []},
        {'name': 'Bags', 'options': []},
      ]
    },
  ];

  static List<Map<String, dynamic>> searchItems = [
    {'name': 'Summer Dresses'}
  ];

  static List<Map<String, dynamic>> searchPeople = [
    {
      'name': 'Dresses under 1k',
      'image':
          'https://images.unsplash.com/photo-1603217192097-13c306522271?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dG9wc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
      'link': '@dressesgallore'
    }
  ];
}

enum ButtonIconType { svg, image }

enum ListingType { normal, other }
