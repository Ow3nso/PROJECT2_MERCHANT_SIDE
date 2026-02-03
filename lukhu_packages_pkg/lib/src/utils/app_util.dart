import 'dart:math';

class AppUtil {
  static String packageName = 'lukhu_packages_pkg';
  static Duration animationDuration = const Duration(milliseconds: 300);
  static double borderRadius = 8;

  static String shopBanner = 'assets/images/shop.png';
  static String backgroundBanner = 'assets/images/boosted_store_background.png';
  static String bagImage = 'assets/images/bag_image.png';
  static String iconOfferHourlyImage = 'assets/images/light_sale.png';
  static String iconVerified = 'assets/images/star_icon_verified.png';
  static String iconOfferImage = 'assets/images/discount_shape.png';
  static String iconVerifiedSvg = 'assets/images/star.png';
  static String filterAssetImage = 'assets/images/filter_square.png';
  static String sortAssetImage = 'assets/images/sort.png';
  static String arrowLeft = 'assets/images/back_button.png';
  static String luhkuMainLogo = 'assets/images/lukhu_main_logo.png';
  static String notificationBell = 'assets/images/notification_bell.png';
  static String bagImage2 = 'assets/images/bag_2.png';
  static String addImage = 'assets/svg/icon_add.svg';
  static String filterSquareSvg = 'assets/images/filter_square_discovery.png';
  static String shoppingBag = 'assets/images/shopping_bag.png';
  static String sortIcon = 'assets/images/discover_sort.png';
  static String activeCart = 'assets/images/bag_tick.png';
  static String documentIcon = 'assets/svg/icon_document.svg';
  static String galleryAddIcon = 'assets/images/gallery_add.png';
  static String iconVideo = 'assets/images/video.png';
  static String iconSearch = 'assets/images/search_icon.png';
  static String iconMessage = 'assets/images/message.png';
  static String iconCall = 'assets/images/call.png';
  static String iconSend = 'assets/images/send.png';
  static String iconTrash = 'assets/images/trash.png';
  static String iconAlert = 'assets/images/alert_circle.png';
  static String iconHeart = 'assets/images/heart.png';
  static String iconClose = 'assets/images/close_button.png';
  static String iconCircleCheck = 'assets/images/check_circle.png';
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
  static String chevronDown = 'assets/images/chevron_down.png';

  static String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }
}
