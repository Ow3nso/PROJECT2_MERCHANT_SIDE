import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
import 'package:storefront/src/features/cart/presentation/ui/pages/order_details.dart';
import 'package:storefront/src/features/cart/presentation/ui/widgets/checkout/cart_card.dart';

import 'package:storefront/src/features/products/presentation/ui/pages/get_products.dart';
import '../../functions/payment_service.dart'; // Import the payment service


class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> initialize() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await _fcm.getToken();
      print("FCM Token: $token");
      // Save this token to your backend or use it to send notifications
    }
  }

  void onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message: ${message.notification?.title}");
      // Handle the notification in the app
    });
  }
}

Future<void> sendPushNotification(String token, String title, String body) async {
  final String serverKey = 'YOUR_FCM_SERVER_KEY';
  final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';

  final response = await http.post(
    Uri.parse(fcmUrl),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    },
    body: jsonEncode(<String, dynamic>{
      'to': token,
      'notification': <String, dynamic>{
        'title': title,
        'body': body,
      },
    }),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully');
  } else {
    print('Failed to send notification');
  }
}

class DeliveryView extends StatefulWidget {
  @override
  _DeliveryViewState createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView>
    with SingleTickerProviderStateMixin {
  bool isHomeDelivery = true;
  int currentStep = 1; // 1 for Delivery, 2 for Payment, 3 for Review
  String selectedPaymentMethod = ''; // Track selected payment method
  String phoneNumber = '';
  String locationArea = '';
  String buildingNumber = '';
  bool isProcessingPayment = false; // Track payment processing state

  final TextEditingController nameController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;

  bool _validateInputs() {
    if (currentStep == 1) {
      if (phoneNumber.isEmpty || locationArea.isEmpty || (isHomeDelivery && buildingNumber.isEmpty)) {
        return false;
      }
    } else if (currentStep == 2) {
      if (selectedPaymentMethod.isEmpty) {
        return false;
      }
    }
    return true;
  }

  Future<void> _placeOrder() async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final cartItems = cartProvider.items.values.toList();
    final sellerId = cartItems.isNotEmpty ? cartItems.first.sellerId : "";

    setState(() {
      isProcessingPayment = true; // Show loading screen
    });

    // Check if the user is signed in
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not signed in");
      setState(() {
        isProcessingPayment = false; // Hide loading screen
      });
      _showFailureBottomSheet(context); // Show failure bottom sheet
      return;
    }

    // Fetch seller details (walletId and shopId) from Firebase
    Map<String, dynamic>? sellerDetails;
    try {
      sellerDetails = await _fetchSellerDetails(sellerId);
    } catch (e) {
      print("Failed to fetch seller details: $e");
      setState(() {
        isProcessingPayment = false; // Hide loading screen
      });
      _showFailureBottomSheet(context); // Show failure bottom sheet
      return;
    }

    // Prepare payment data
    // Prepare payment data
	final paymentData = {
	  "name": nameController.text,
	  "customerId": "",
	  "statuType": "pending",
	  "userId": sellerId,
	  "sellerId": sellerId, // Added sellerId at global level
	  "shopId": sellerDetails?['shopId'] ?? "",
	  "walletId": sellerDetails?['walletId'] ?? "",
	  "amount": cartProvider.totalAmount, // Removed toStringAsFixed(2) to keep as number
	  "phone_number": phoneNumber,
	  "currency": "KES",
	  "description": "Bought Item",
	  "type": selectedPaymentMethod,
	  "metadata": {
	    "type": "pending"
	  },
	  "items": cartItems.map((item) => {
	    "amount": item.price, // Changed to number
	    "name": item.label,
	    "size": 'UK 44',
	    "productId": item.productId,
	    "quantity": item.quantity, // Changed to number
	    "sellerId": item.sellerId,
	    "color": "Black",
	    "orderImages": item.images.isNotEmpty ? [item.images[0]] : [], // Added orderImages array with first image
	  }).toList(),
	};

    // Call payment endpoint
    final paymentSuccess = await PaymentService.processPayment(paymentData);

    // Handle payment result
    setState(() {
      isProcessingPayment = false; // Hide loading screen
    });

    if (paymentSuccess) {
      _showSuccessBottomSheet(context); // Show success bottom sheet
    } else {
      _showFailureBottomSheet(context); // Show failure bottom sheet
    }
  }

  Future<Map<String, dynamic>?> _fetchSellerDetails(String sellerId) async {
  try {
    // Step 1: Fetch user details
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(sellerId)
        .get();

    if (!userDoc.exists) {
      print("User document does not exist for sellerId: $sellerId");
      return null;
    }

    // Step 2: Fetch wallet details
    final walletQuery = await FirebaseFirestore.instance
        .collection('wallet')
        .where('userId', isEqualTo: sellerId)
        .limit(1)
        .get();

    if (walletQuery.docs.isEmpty) {
      print("Wallet document does not exist for sellerId: $sellerId");
      return null;
    }

    final walletData = walletQuery.docs.first.data();
    print("Wallet Data: $walletData");

    final walletId = walletData['_id'] ?? 'N/A'; 
    final shopIdFromWallet = walletData['shopId'];

    // Ensure shopIdFromWallet is valid before fetching shop details
    if (shopIdFromWallet == null || shopIdFromWallet.toString().trim().isEmpty) {
      print("Shop ID is null or empty in the wallet document.");
      return {
        "walletId": walletId,
        "shopId": null, // Return null instead of making an invalid query
      };
    }

    // Step 3: Fetch shop details
    final shopDoc = await FirebaseFirestore.instance
        .collection('shop')
        .doc(shopIdFromWallet)
        .get();

    if (!shopDoc.exists) {
      print("Shop document does not exist for shopId: $shopIdFromWallet");
      return null;
    }

    final shopData = shopDoc.data();
    print("Shop Data: $shopData");

    final shopId = shopData?['shopId'] ?? 'N/A';

    return {
      "walletId": walletId,
      "shopId": shopId,
    };
  } catch (e) {
    print("Error fetching seller details: $e");
    return null;
  }
}



  @override
  void initState() {
    super.initState();
    _initializeFirebaseAuth();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _sizeAnimation = Tween<double>(begin: 50, end: 50).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  Future<void> _initializeFirebaseAuth() async {
    try {
      // Initialize Firebase (if not already initialized)
      await Firebase.initializeApp();

      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "kanyambu@gmail.com", // Replace with your test email
        password: "Nyamburi@123", // Replace with your test password
      );
      print("Signed in with email/password. UID: ${userCredential.user?.uid}");
    } catch (e) {
      print("Failed to sign in with email/password: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  void _showCustomerDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0, left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text(
                  'Complete and secure your order',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Add the following information below to secure this and future orders',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),

                // Name Field
                TextField(
                  controller: nameController, // Use the shared controller
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Phone Number Field (Non-editable)
                TextField(
                  controller: TextEditingController(text: phoneNumber),
                  decoration: const InputDecoration(
                    labelText: 'Your Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  enabled: false,
                ),
                const SizedBox(height: 24),

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Close the bottom sheet
                      Navigator.pop(context);
                      _placeOrder();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Complete order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  void _showSuccessBottomSheet(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);

  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true, // Allows the bottom sheet to take up more space
    backgroundColor: Colors.transparent, // Makes the background transparent
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur effect
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0, left: 20, right: 20), // Move the bottom sheet up
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Checkmark icon with layered green circular background
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outermost light green circle
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Middle medium green circle
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Inner darkest green circle
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your order has been confirmed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'You will receive order confirmation notification and tracking information soon.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),

                // Column for full-width buttons
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity, // Full width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderDetailsPage(
                                customerName: nameController.text,
                                selectedPaymentMethod: selectedPaymentMethod,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF003CFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14), // Button height
                        ),
                        child: const Text(
                          'View Order Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12), // Spacing between buttons
                    SizedBox(
                      width: double.infinity, // Full width
                      child: ElevatedButton(
                        onPressed: () {
                          // cartProvider.clearCart();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetProductsPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xFF003CFF)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14), // Button height
                        ),
                        child: const Text(
                          'Continue Shopping',
                          style: TextStyle(
                            color: Color(0xFF003CFF),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    },
  );
}


void _showFailureBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true, // Allows the bottom sheet to take up more space
    backgroundColor: Colors.transparent, // Makes the background transparent
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur effect
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0, left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // X icon with layered circular red background
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer lightest red circle
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Middle medium red circle
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.red[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Inner darkest red circle
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sorry! Your order was not processed. Kindly try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Tap the retry button to initiate and complete processing your order',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                // Full-width Retry button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {

                      Navigator.pop(context);
                      await _placeOrder();
                      
                        // Perform final action (e.g., place order)
                        // setState(() {
                        //   isProcessingPayment = true; // Show loading screen
                        // });

                        // Prepare payment data
                        // final paymentData = {
                        //   // 'amount': cartProvider.totalAmount.toStringAsFixed(2),
                        //   'phone_number': phoneNumber,
                        //   'currency': "KES",
                        //   'type': selectedPaymentMethod,
                        //   'description': "Top Up",
                        //   'userId': "3jtTHilTtKcLoMc2F3spU7MoG0M2",
                        //   'shopId': "3jtTHilTtKcLoMc2F3spU7MoG0M2",
                        //   'walletId': "3jtTHilTtKcLoMc2F3spU7MoG0M2",
                        //   "metadata": {
                        //     "transaction": "topup"
                        //   }
                        // };

                        // // Call payment endpoint
                        // final paymentSuccess = await PaymentService.processPayment(paymentData);

                        // // Handle payment result
                        // setState(() {
                        //   isProcessingPayment = false; // Hide loading screen
                        // });

                        // if (paymentSuccess) {
                        //   _showSuccessBottomSheet(context); // Show success bottom sheet
                        // } else {
                        //   _showFailureBottomSheet(context); // Show failure bottom sheet
                        // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Retry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Full-width Cancel button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF003CFF)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xFF003CFF),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // Show loading screen if payment is being processed
    if (isProcessingPayment) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Custom progress indicator
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer layer (lightest blue)
                      Container(
                        width: _sizeAnimation.value * 1.6, // Largest circle
                        height: _sizeAnimation.value * 1.6,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2), // Lightest blue
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Middle layer (medium blue)
                      Container(
                        width: _sizeAnimation.value * 1.3, // Medium circle
                        height: _sizeAnimation.value * 1.3,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4), // Medium blue
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Inner layer (darkest blue)
                      Container(
                        width: _sizeAnimation.value, // Smallest circle
                        height: _sizeAnimation.value,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.6), // Darkest blue
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Transform.rotate(
                            angle: _rotationAnimation.value,
                            child: const Icon(
                              Icons.hourglass_bottom,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
          const SizedBox(height: 20),
          // Text
          const Text(
            "You're almost there, we are processing your payment",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusWidget(currentStep: currentStep),
                  ItemImagesWidget(),
                  const SizedBox(height: 16),
                  if (currentStep == 1)
                    DeliveryOptionsWidget(
                      isHomeDelivery: isHomeDelivery,
                      onDeliveryOptionChanged: (bool value) {
                        setState(() {
                          isHomeDelivery = value;
                        });
                      },
                      onDeliveryDetailsChanged: (phone, location, building) {
                        setState(() {
                          phoneNumber = phone;
                          locationArea = location;
                          buildingNumber = building;
                        });
                      },
                    ),
                  if (currentStep == 2)
                    SelectPaymentMethodWidget(
                      onPaymentMethodSelected: (method) {
                        setState(() {
                          selectedPaymentMethod = method;
                        });
                      },
                    ),
                  if (currentStep == 3)
                    ReviewOrderWidget(
                      isHomeDelivery: isHomeDelivery,
                      selectedPaymentMethod: selectedPaymentMethod,
                      phoneNumber: phoneNumber,
                      locationArea: locationArea,
                      buildingNumber: buildingNumber,
                    ),
                ],
              ),
            ),
          ),
          _buildContinueButton(), // Sticks at the bottom
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    // Assuming each item in the cart has a `sellerId` property
    final sellerId = cartItems.isNotEmpty ? cartItems.first.sellerId : "";
    // final shopId = cartItems.isNotEmpty ? cartItems.first.shopId : "";

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Sub Total',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF77757F)
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'KSH ${cartProvider.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF77757F)
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    'Delivery Fee',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF77757F)
                    ),
                  ),
                  Spacer(),
                  Text(
                    'KSH 0',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF77757F)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Divider(),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'KSH ${cartProvider.totalAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (!_validateInputs()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all the required fields.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                if (currentStep == 1) {
                  setState(() {
                    currentStep = 2; // Move to Payment step
                  });
                } else if (currentStep == 2) {
                  setState(() {
                    currentStep = 3; // Move to Review step
                  });
                } else if (currentStep == 3) {
                  // Perform final action (e.g., place order)
                  _showCustomerDetailsBottomSheet(context);
                }
              },
              child: Text(
                currentStep == 1
                    ? 'Continue to Payment'
                    : currentStep == 2
                        ? 'Proceed to Review'
                        : 'Place Order',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003CFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryOptionsWidget extends StatefulWidget {
  final bool isHomeDelivery;
  final Function(bool) onDeliveryOptionChanged;
  final Function(String, String, String) onDeliveryDetailsChanged;

  const DeliveryOptionsWidget({
    Key? key,
    required this.isHomeDelivery,
    required this.onDeliveryOptionChanged,
    required this.onDeliveryDetailsChanged,
  }) : super(key: key);

  @override
  _DeliveryOptionsWidgetState createState() => _DeliveryOptionsWidgetState();
}

class _DeliveryOptionsWidgetState extends State<DeliveryOptionsWidget> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    locationController.dispose();
    buildingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery Options',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth,
                      child: ToggleButtons(
                        isSelected: [widget.isHomeDelivery, !widget.isHomeDelivery],
                        onPressed: (index) {
                          widget.onDeliveryOptionChanged(index == 0);
                        },
                        borderRadius: BorderRadius.circular(8),
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth / 2.03,
                          minHeight: 48,
                        ),
                        selectedColor: Colors.white,
                        fillColor: const Color(0xFF4A4064),
                        color: Colors.black,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on_outlined),
                                Text(
                                  'Home/office',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: widget.isHomeDelivery ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                const Icon(Icons.store),
                                Text(
                                  'Pickup',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: widget.isHomeDelivery ? Colors.black : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildDeliveryInputs(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInputs() {
    if (widget.isHomeDelivery) {
      return Column(
        children: [
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              prefixText: '+254 ',
              hintText: '0712 345 678',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              widget.onDeliveryDetailsChanged(
                phoneController.text,
                locationController.text,
                buildingController.text,
              );
            },
          ),
          const SizedBox(height: 8),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.location_on),
              hintText: 'Select your location',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              widget.onDeliveryDetailsChanged(
                phoneController.text,
                locationController.text,
                buildingController.text,
              );
            },
          ),
          const SizedBox(height: 8),
          TextField(
            controller: buildingController,
            decoration: const InputDecoration(
              hintText: 'Building/House Number',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              widget.onDeliveryDetailsChanged(
                phoneController.text,
                locationController.text,
                buildingController.text,
              );
            },
          ),
        ],
      );
    } else {
      return Column(
        children: [
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(
              prefixText: '+254 ',
              hintText: '0712 345 678',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              widget.onDeliveryDetailsChanged(
                phoneController.text,
                locationController.text,
                buildingController.text,
              );
            },
          ),
          const SizedBox(height: 8),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.store),
              hintText: 'Select Pickup Location',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              widget.onDeliveryDetailsChanged(
                phoneController.text,
                locationController.text,
                buildingController.text,
              );
            },
          ),
        ],
      );
    }
  }
}

class ItemImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    // Extract images from the cart items
    List<String> productImages = cartItems
        .where((item) => item.images.isNotEmpty)
        .expand((item) => item.images.take(1)) // Take only the first image per product
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (productImages.isNotEmpty)
                ...productImages
                    .map((image) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: _buildImage(image),
                        ))
                    .toList()
              else
                _buildImage('assets/placeholder.png'), // Show a placeholder if no images
              const Spacer(),
              Text(
                '${cartItems.length} Item${cartItems.length > 1 ? 's' : ''}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      width: 50,
      height: 50,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.image_not_supported, size: 50);
      },
    );
  }
}

class StatusWidget extends StatelessWidget {
  final int currentStep;

  const StatusWidget({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF9F9F9), // Set the background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildStep(1, 'Delivery', currentStep >= 1),
              const SizedBox(width: 8.0),
              const Text(
                '-',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8.0),
              _buildStep(2, 'Payment', currentStep >= 2),
              const SizedBox(width: 8.0),
              const Text(
                '-',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8.0),
              _buildStep(3, 'Review', currentStep >= 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(int stepNumber, String stepText, bool isCompleted) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9), // Circle background color
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black, // Black border
              width: 1.0, // Border width
            ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 16,
                  )
                : Text(
                    stepNumber.toString(),
                    style: const TextStyle(
                      color: Colors.black, // Black text color
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          stepText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Black text color
          ),
        ),
      ],
    );
  }
}

class SelectPaymentMethodWidget extends StatefulWidget {
  final Function(String) onPaymentMethodSelected;

  const SelectPaymentMethodWidget({Key? key, required this.onPaymentMethodSelected}) : super(key: key);

  @override
  _SelectPaymentMethodWidgetState createState() => _SelectPaymentMethodWidgetState();
}

class _SelectPaymentMethodWidgetState extends State<SelectPaymentMethodWidget> {
  String? selectedMethod;

  void _onMethodSelected(String methodName) {
    setState(() {
      selectedMethod = methodName;
    });
    widget.onPaymentMethodSelected(methodName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Payment Method',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentMethodCard('assets/mpesa_icon.png', 'M-PESA'),
          const SizedBox(height: 8),
          // _buildPaymentMethodCard('assets/visa.png', 'Credit/Debit Card'),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard(String imagePath, String methodName) {
    bool isSelected = selectedMethod == methodName;
    return InkWell(
      onTap: () => _onMethodSelected(methodName),
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 40);
                },
              ),
              const SizedBox(width: 16),
              Text(
                methodName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                color: isSelected ? const Color(0xFF003CFF) : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewOrderWidget extends StatelessWidget {
  final bool isHomeDelivery;
  final String selectedPaymentMethod;
  final String phoneNumber;
  final String locationArea;
  final String buildingNumber;

  const ReviewOrderWidget({
    required this.isHomeDelivery,
    required this.selectedPaymentMethod,
    required this.phoneNumber,
    required this.locationArea,
    required this.buildingNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Review Your Order',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: const Icon(Icons.store_outlined, color: Color(0xFF003CFF)),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Shipping details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8E8C94),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          locationArea.isEmpty ? "No location provided" : locationArea,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          buildingNumber,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      selectedPaymentMethod == 'M-PESA' ? 'assets/mpesa_icon.png' : 'assets/visa.png',
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported, size: 40);
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Payment details',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8E8C94),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          selectedPaymentMethod == 'M-PESA' ? 'M-PESA - $phoneNumber' : 'Credit/Debit Card',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
