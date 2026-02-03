import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DeliveryStatus, OrderType;

class TestData {
  static final List<Map<String, dynamic>> orders = [
    {
      'title': 'New Order Alert 🥳',
      'time': '12:05 PM',
      'description':
          '@rey just ordered an item from your store! Tap to view more details',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isRead': false,
      'type': DeliveryStatus.pending,
      'store': '@zenyeziko',
      'order_no': 'LO3084JFIEE',
      'illustration': [
        {
          'title': 'Your order has been confirmed',
          'time': '12:00 PM',
          'description':
              'Hang on as @zenyeziko ships your item to you. You will be notified once your order has been shipped.',
          'type': OrderType.confirmed
        },
        {
          'title': 'Your order has been shipped',
          'time': '12:00 PM',
          'description':
              'Hang on as our delivery agents get your item to you as fast as they can. You can track your order below.',
          'type': OrderType.shipping
        },
      ]
    },
    {
      'title': 'Order from @rey',
      'time': '12:05 PM',
      'description': 'Tap to view more details ',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isRead': true,
      'type': DeliveryStatus.cancelled,
      'store': '@zenyeziko',
      'order_no': 'LO3084JFIEE',
      'illustration': [
        {
          'title': 'Your order has been confirmed',
          'time': '12:00 PM',
          'description':
              'Hang on as @zenyeziko ships your item to you. You will be notified once your order has been shipped.',
          'type': OrderType.confirmed
        },
        {
          'title': 'Your order has been shipped',
          'time': '12:00 PM',
          'description':
              'Hang on as our delivery agents get your item to you as fast as they can. You can track your order below.',
          'type': OrderType.shipping
        },
      ]
    },
  ];

  static final List<Map<String, dynamic>> promotions = [
    {
      'title': 'Get 56% off Converse!',
      'time': '12:05 PM',
      'description':
          'Sneaker Fest 2022 is going wild! Get 2 pairs of Converse All Star at KSh 1,700 now!',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isRead': false,
      'type': DeliveryStatus.none,
    },
    {
      'title': 'Get 56% off Converse!',
      'time': '12:05 PM',
      'description':
          'Sneaker Fest 2022 is going wild! Get 2 pairs of Converse All Star at KSh 1,700 now!',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isRead': false,
      'type': DeliveryStatus.none,
    },
    {
      'title': 'Get 56% off Converse!',
      'time': '12:05 PM',
      'description':
          'Sneaker Fest 2022 is going wild! Get 2 pairs of Converse All Star at KSh 1,700 now!',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isRead': true,
      'type': DeliveryStatus.none,
    },
  ];

  static final List<Map<String, dynamic>> updates = [
    {
      'title': 'New Update Alert 🥳',
      'time': '12:05 PM',
      'description':
          'You can now top up your Lukhu wallet with M-PESA! Update the app to enjoy. ',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isRead': false,
      'type': DeliveryStatus.none,
    },
    {
      'title': 'New Feature Unlocked',
      'time': '12:05 PM',
      'description':
          'As a seller, you can noe track your business expense directly from your Lukhu app!',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isRead': true,
      'type': DeliveryStatus.none,
    },
  ];

  static final List<Map<String, dynamic>> likesAndFollowers = [
    {
      'product_id': '1',
      'name': '@odhis',
      'message': 'liked your item',
      'time': '12:00 PM',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'avatar':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isFollowing': true,
    },
    {
      'product_id': '',
      'name': '@odhis',
      'message': 'started following you',
      'time': '12:00 PM',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'avatar':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isFollowing': false,
    },
    {
      'product_id': '',
      'name': '@odhis',
      'message': 'started following you',
      'time': '12:00 PM',
      'image':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'avatar':
          'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGZhc2hpb258ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60',
      'isFollowing': true,
    },
  ];

  static final List<Map<String, dynamic>> filterNotifications = [
    {
      'description': 'Unread Notifications',
      'isChecked': true,
    },
    {
      'description': 'Read Notifications',
      'isChecked': true,
    },
  ];

  static final List<Map<String, dynamic>> filterOrders = [
    {
      'type': DeliveryStatus.pending,
      'description': 'Not shipped yet',
      'isChecked': true,
    },
    {
      'type': DeliveryStatus.shipping,
      'description': 'Shipping in progress',
      'isChecked': true,
    },
    {
      'type': DeliveryStatus.delivered,
      'description': 'Delivered to you/buyer',
      'isChecked': true,
    },
    {
      'type': DeliveryStatus.cancelled,
      'description': 'Cancelled and refunded',
      'isChecked': true,
    },
  ];

  static final List<Map<String, dynamic>> notiifcationNews = [
    {
      'title': 'Promotions & Discounts',
      'label': 'Promotions',
      'image': 'assets/images/ticket_star.png',
      'route': 'promotion_and_update_view',
      'count': ''
    },
    {
      'title': 'Your Offers',
      'label': 'Your Offers',
      'image': 'assets/images/bag_timer.png',
      'route': 'offer_view',
      'count': ''
    },
    {
      'title': 'New likes and followers',
      'label': 'New likes and followers',
      'image': 'assets/images/heart_circle.png',
      'route': 'likes_and_followers',
      'count': ''
    },
    {
      'title': 'Lukhu Updates',
      'label': 'Lukhu Updates',
      'image': 'assets/images/directbox.png',
      'route': 'promotion_and_update_view',
      'count': ''
    }
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

  static List<Map<String, dynamic>> pickedLocations = [
    {
      'type': 'Thereme House',
      'place': '7th Floor, The Bazaar Plaza',
      'phone': '0735 326 509',
      'image': ''
    }
  ];
}
