import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, DefaultBackButton, DefaultCallBtn, LuhkuAppBar, OrderModel;
import 'order_tile.dart'; // Import OrderTileCard
import 'select_drop_off_points.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, DefaultInputField, ReadContext, StyleColors;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // For Timestamp
import 'package:intl/intl.dart'; // For DateFormat


class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderModel order;
  bool _isInitialized = false;
  
  String? _selectedShopName;
  String? _selectedShopLocation;
  
  bool _hideCallRiderButton = false;
  bool _showCopiedRow = false;
  bool _fadePreviousRow = false;
  bool _hideButtons = false;
  bool _callSuccess = false;
  bool _callFailed = false;
  bool _fadeCallRider = false;
  bool _showLimitedCopiedRow = false;
  bool _isBlurred = false;
  bool _showDropOffLine = false;
  bool _fadePreviousText = false;
  bool _showLimitedPreviousText = false;
  bool _deliveryConfirmed = false;
  bool _isEnabled = true;
  bool _fadeOrderShipped = false;
  bool _showLimitedOrderShipped = false;

  @override
  void initState() {
    super.initState();
    _loadState();
  }
  
 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      order = ModalRoute.of(context)!.settings.arguments as OrderModel;
      _isInitialized = true;
    }
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _hideCallRiderButton = prefs.getBool('hideCallRiderButton') ?? false;
      _showCopiedRow = prefs.getBool('showCopiedRow') ?? false;
      _fadePreviousRow = prefs.getBool('fadePreviousRow') ?? false;
      _hideButtons = prefs.getBool('hideButtons') ?? false;
      _callSuccess = prefs.getBool('callSuccess') ?? false;
      _callFailed = prefs.getBool('callFailed') ?? false;
      _fadeCallRider = prefs.getBool('fadeCallRider') ?? false;
      _showLimitedCopiedRow = prefs.getBool('showLimitedCopiedRow') ?? false;
      _isBlurred = prefs.getBool('isBlurred') ?? false;
      _showDropOffLine = prefs.getBool('showDropOffLine') ?? false;
      _fadePreviousText = prefs.getBool('fadePreviousText') ?? false;
      _showLimitedPreviousText = prefs.getBool('showLimitedPreviousText') ?? false;
      _deliveryConfirmed = prefs.getBool('deliveryConfirmed') ?? false;
      _isEnabled = prefs.getBool('isEnabled') ?? true;
      _fadeOrderShipped = prefs.getBool('fadeOrderShipped') ?? false;
      _showLimitedOrderShipped = prefs.getBool('showLimitedOrderShipped') ?? false;
    });
  }

  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hideCallRiderButton', _hideCallRiderButton);
    await prefs.setBool('showCopiedRow', _showCopiedRow);
    await prefs.setBool('fadePreviousRow', _fadePreviousRow);
    await prefs.setBool('hideButtons', _hideButtons);
    await prefs.setBool('callSuccess', _callSuccess);
    await prefs.setBool('callFailed', _callFailed);
    await prefs.setBool('fadeCallRider', _fadeCallRider);
    await prefs.setBool('showLimitedCopiedRow', _showLimitedCopiedRow);
    await prefs.setBool('isBlurred', _isBlurred);
    await prefs.setBool('showDropOffLine', _showDropOffLine);
    await prefs.setBool('fadePreviousText', _fadePreviousText);
    await prefs.setBool('showLimitedPreviousText', _showLimitedPreviousText);
    await prefs.setBool('deliveryConfirmed', _deliveryConfirmed);
    await prefs.setBool('isEnabled', _isEnabled);
    await prefs.setBool('fadeOrderShipped', _fadeOrderShipped);
    await prefs.setBool('showLimitedOrderShipped', _showLimitedOrderShipped);
  }

  void _onPickFromMePressed() {
    setState(() {
      _fadePreviousText = true;
      _hideButtons = true;
      _showLimitedPreviousText = true;
    });
    _saveState();
    
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _showCopiedRow = true;
        _saveState();
      });
    });
  }

  void _onDropItOffPressed() {
    setState(() {
      _isBlurred = true;
      _saveState();
    });
    _showDropOffDialog();
  }

  void _showDropOffDialog() async {
  setState(() {
    _isBlurred = true;
    _saveState();
  });

  final result = await showModalBottomSheet<Map<String, String>>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DropOffSelectionDialog(
          onLocationSelected: (shopName, location) {
            return {'shopName': shopName, 'location': location};
          },
        ),
      );
    },
  );

  setState(() {
    _isBlurred = false;
    if (result != null) {
      _selectedShopName = result['shopName'];
      _selectedShopLocation = result['location'];
      _showDropOffLine = true;
      _fadePreviousText = true;
      _deliveryConfirmed = true;
      _hideButtons = true;
    }
    _saveState();
  });

  if (result != null) {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _showLimitedPreviousText = true;
        _saveState();
      });
    });
  }
}
  
  void _onCallRiderPressed() async {
    // First update the UI state
    setState(() {
      _fadeCallRider = true;
      _hideCallRiderButton = true;
      _showLimitedPreviousText = true;
    });
    _saveState();

    // Replace this with the actual rider's phone number
    const phoneNumber = '+254721515912'; 
    final url = 'tel:$phoneNumber';

    try {
      // Check if the device can make phone calls
      if (await canLaunch(url)) {
        // Attempt to make the call
        await launch(url);
        
        // If we reach here, the call was initiated successfully
        setState(() {
          _callSuccess = true;
          _callFailed = false;
          _showLimitedCopiedRow = true;
        });
      } else {
        // Could not launch the URL (phone call)
        setState(() {
          _callSuccess = false;
          _callFailed = true;
          _showLimitedCopiedRow = true;
        });
      }
    } catch (e) {
      // Handle any errors that occur during the call attempt
      setState(() {
        _callSuccess = false;
        _callFailed = true;
        _showLimitedCopiedRow = true;
      });
    }

    // Save the final state
    _saveState();
  }

  Future<void> _resetState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      // Reset all state variables to their initial values
      _hideCallRiderButton = false;
      _showCopiedRow = false;
      _fadePreviousRow = false;
      _hideButtons = false;
      _callSuccess = false;
      _callFailed = false;
      _fadeCallRider = false;
      _showLimitedCopiedRow = false;
      _isBlurred = false;
      _showDropOffLine = false;
      _fadePreviousText = false;
      _showLimitedPreviousText = false;
      _deliveryConfirmed = false;
      _isEnabled = true;
      _fadeOrderShipped = false;
      _showLimitedOrderShipped = false;
    });
  }
  
  void _onCallStorePressed() async {
    const phoneNumber = '+254721515912'; // Replace with actual store number
    final url = 'tel:$phoneNumber';
    
    if (await canLaunch(url)) {
        // Attempt to make the call
        await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch phone app')),
      );
    }
  }
  
  void _onViewDirectionsPressed() async {
    if (_selectedShopLocation == null) return;
    
    final query = Uri.encodeComponent(_selectedShopLocation!);
    final url = 'https://www.google.com/maps/search/?api=1&query=$query';
    
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch Google Maps')),
      );
    }
  }
  
  Future<void> _messageCustomer(String phoneNumber) async {
  // Get phone number from order model
  // final phoneNumber = order.toJson()['phone_number'] ?? '';
  
  if (phoneNumber.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Customer phone number not available')),
    );
    return;
  }

  // Rest of the method remains the same...
  final formattedNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  final whatsappUrl = 'https://wa.me/$formattedNumber?text=${Uri.encodeComponent('Hello, Just received your order!')}';
  
  try {
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      await _callCustomer(formattedNumber);
    }
  } catch (e) {
    await _callCustomer(formattedNumber);
  }
}

	Future<void> _callCustomer(String phoneNumber) async {
	  final callUrl = 'tel:$phoneNumber';
	  if (await canLaunch(callUrl)) {
	    await launch(callUrl);
	  } else {
	    ScaffoldMessenger.of(context).showSnackBar(
	      const SnackBar(content: Text('Could not launch phone app')),
	    );
	  }
	}

  @override
  Widget build(BuildContext context) {
    final orderData = order.toJson(); // Convert to map when needed
    
    // Extract order data
    final Timestamp? createdAtTimestamp = orderData['createdAt'] as Timestamp?;
    final DateTime? createdAt = createdAtTimestamp?.toDate();
    final String orderName = orderData['name'] ?? '';
    final String orderId = orderData['orderId'] ?? '';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: LuhkuAppBar(
          backAction: const DefaultBackButton(),
          appBarType: AppBarType.other,
          enableShadow: true,
          height: 70,
          color: Theme.of(context).colorScheme.onPrimary,
          title: Text(
            'Order Details',
            style: TextStyle(
              color: Theme.of(context).colorScheme.scrim,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: DefaultCallBtn(),
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          OrderTileCard(orderData: orderData), 
                          const SizedBox(height: 20),
                          AnimatedOpacity(
                            opacity: _fadePreviousText ? 0.5 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: Row(
                              children: [
                                // Icon(Icons.local_shipping,
                                //     color: _fadePreviousText
                                //         ? Colors.grey
                                //         : Colors.orange),
                                CircleAvatar(
                                  backgroundColor: _fadePreviousText
                                      ? Colors.grey
                                      : Colors
                                          .orange, // The color of the circle background
                                  radius:
                                      15, // Adjust the radius to control the size of the circle
                                  child: const Icon(
                                    Icons.local_shipping,
                                    color:
                                        Colors.white, // The color of the icon
                                    size:
                                        15, // Adjust the size to control the size of the icon
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'Your order has been confirmed! ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: createdAt != null
						    ? DateFormat('EEE d MMM, h:mm a').format(createdAt)
						    : 'Today',
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      AnimatedOpacity(
                                        opacity: _fadePreviousText ? 0.5 : 1.0,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: Text(
                                          '${orderData['name'] ?? ''} has just ordered an item from your store. Would you prefer us to pick the item from you or would you prefer dropping it at our drop-off points?',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                          maxLines: _showLimitedPreviousText
                                              ? 2
                                              : null,
                                          overflow: _showLimitedPreviousText
                                              ? TextOverflow.ellipsis
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (!_hideButtons)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: _onPickFromMePressed,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: StyleColors.lukhuBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text('Pick from me',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                OutlinedButton(
                                  onPressed: _onDropItOffPressed,
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color.fromARGB(255, 0, 60, 255)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text('I\'ll drop it off',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 60, 255),
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          const SizedBox(height: 20),
                          if (_showCopiedRow) ...[
                            const FractionallySizedBox(
                              widthFactor:
                                  0.85, // specify the width of the divider here
                              child: Divider(),
                            ),
                            const SizedBox(height: 20),
                            AnimatedOpacity(
                              opacity: _fadeCallRider ? 0.5 : 1.0,
                              duration: const Duration(milliseconds: 300),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: _fadeCallRider
                                        ? Colors.grey
                                        : Colors
                                            .orange, // The color of the circle background
                                    radius:
                                        15, // Adjust the radius to control the size of the circle
                                    child: const Icon(
                                      Icons.local_shipping,
                                      color:
                                          Colors.white, // The color of the icon
                                      size:
                                          15, // Adjust the size to control the size of the icon
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                'Our rider is on their way to you! ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                            children: [
                                              // TextSpan(
                                              //   text: 'Today',
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.normal,
                                              //     color: Theme.of(context)
                                              //         .colorScheme
                                              //         .onBackground,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        AnimatedOpacity(
                                          opacity: _fadeCallRider ? 0.5 : 1.0,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: Text(
                                            'Rider is on his way to pick the item for delivery and will contact you for planning purposes',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                            maxLines: _showLimitedCopiedRow
                                                ? 2
                                                : null,
                                            overflow: _showLimitedCopiedRow
                                                ? TextOverflow.ellipsis
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (!_hideCallRiderButton)
                              Center(
                                child: AnimatedOpacity(
                                  opacity: _fadeCallRider ? 0.0 : 1.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: OutlinedButton(
                                    onPressed: _onCallRiderPressed,
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 6, 91, 219)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 96,
                                        vertical: 12,
                                      ),
                                    ),
                                    child: const Text('Call Rider',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 6, 91, 219))),
                                  ),
                                ),
                              ),
                          ],
                          if (_callSuccess) ...[
                            const FractionallySizedBox(
                              widthFactor:
                                  0.85, // specify the width of the divider here
                              child: Divider(),
                            ),
                            const SizedBox(height: 20),
                            AnimatedOpacity(
                              opacity: _fadeOrderShipped ? 0.5 : 1.0,
                              duration: const Duration(milliseconds: 300),
                              child: Row(
                                children: [
                                  // Icon(Icons.local_shipping,
                                  //     color: _fadePreviousText
                                  //         ? Colors.grey
                                  //         : Colors.orange),
                                  CircleAvatar(
                                    backgroundColor: _fadeOrderShipped
                                        ? Colors.grey
                                        : Colors
                                            .green, // The color of the circle background
                                    radius:
                                        15, // Adjust the radius to control the size of the circle
                                    child: const Icon(
                                      Icons.local_shipping,
                                      color:
                                          Colors.white, // The color of the icon
                                      size:
                                          15, // Adjust the size to control the size of the icon
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                'Your order has been shipped ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                            children: [
                                              // TextSpan(
                                              //   text: 'Today',
                                              //   style: TextStyle(
                                              //     fontWeight: FontWeight.normal,
                                              //     color: Theme.of(context)
                                              //         .colorScheme
                                              //         .onBackground,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        AnimatedOpacity(
                                          opacity:
                                              _fadeOrderShipped ? 0.5 : 1.0,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: Text(
                                            'Hang on as our delivery agents get your item to your customer as fast as they can. Track it below',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                            maxLines: _showLimitedOrderShipped
                                                ? 2
                                                : null,
                                            overflow: _showLimitedOrderShipped
                                                ? TextOverflow.ellipsis
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Center(
                            //   child: OutlinedButton(
                            //     onPressed: () {},
                            //     style: OutlinedButton.styleFrom(
                            //       side: const BorderSide(
                            //           color: Color.fromARGB(255, 6, 91, 219)),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(8),
                            //       ),
                            //       padding: const EdgeInsets.symmetric(
                            //         horizontal: 96,
                            //         vertical: 12,
                            //       ),
                            //     ),
                            //     child: const Text('Track Order',
                            //         style: TextStyle(
                            //             color: Color.fromARGB(255, 6, 91, 219),
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ],
                          if (_callFailed) ...[
                            const FractionallySizedBox(
                              widthFactor:
                                  0.85, // specify the width of the divider here
                              child: Divider(),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(Icons.error_outline,
                                    color: Colors.red),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'The rider was unable to reach you. ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                          if (_showDropOffLine) ...[
                            const FractionallySizedBox(
                              widthFactor:
                                  0.85, // specify the width of the divider here
                              child: Divider(),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Icon(Icons.check_circle_outline,
                                    color: Colors.orange),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              'Kindly drop off your item! ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                          children: [
                                            // TextSpan(
                                            //   text: 'Today',
                                            //   style: TextStyle(
                                            //     fontWeight: FontWeight.normal,
                                            //     color: Theme.of(context)
                                            //         .colorScheme
                                            //         .onBackground,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'To ensure prompt delivery to your customer, ensure this item has been dropped off at the selected drop-off point.',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                        maxLines:
                                            _showLimitedCopiedRow ? 2 : null,
                                        overflow: _showLimitedCopiedRow
                                            ? TextOverflow.ellipsis
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 270,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1.0, // thin border
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        10.0), // border radius
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width:
                                              10), // Add space between the text and the border
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Shop name',
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                              height:
                                                  5), // Add space between the texts
                                          Text(
                                            _selectedShopName ?? 'Not selected',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                              height:
                                                  5), // Add space between the texts
                                          Text(
                                            _selectedShopLocation ?? 'Not selected',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: _onViewDirectionsPressed,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: StyleColors.lukhuBlue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text('View Directions',
                                      style: TextStyle(color: Colors.white)),
                                ),
                                OutlinedButton(
                                  onPressed: _onCallStorePressed,
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Color.fromARGB(255, 0, 60, 255)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text('Call Store',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 60, 255))),
                                ),
                              ],
                            ), // Draw the horizontal line
                          ],
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: StyleColors.lukhuDividerColor,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 27,
                          bottom: 70,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
				  final orderData = order.toJson();
				  _messageCustomer(orderData['phone_number'] ?? '');
				},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 60, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            child: const Text('Message Customer',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_isBlurred)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DropOffSelectionDialog extends StatefulWidget {
  final Function(String, String)? onLocationSelected;
  
  const DropOffSelectionDialog({Key? key, this.onLocationSelected}) : super(key: key);

  @override
  _DropOffSelectionDialogState createState() => _DropOffSelectionDialogState();
}

class _DropOffSelectionDialogState extends State<DropOffSelectionDialog> {
  String? selectedCity = 'Nairobi';
  String? selectedRoad;
  String? selectedDropOffPoint;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    bool isSubmitDisabled() {
      return selectedCity == null ||
          selectedRoad == null ||
          selectedDropOffPoint == null;
    }

    Widget buildCheckmarkListTile(String title, String subtitle, String value) {
      bool isSelected = selectedDropOffPoint == value;
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : StyleColors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          leading: SizedBox(
            width: 40.0,
            height: 40.0,
            child: Icon(
		  Icons.location_on,
		  size: 24.0, // adjust size as needed
		  color: Colors.red, // adjust color as needed
		),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
          trailing: isSelected
              ? Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.0,
                  ),
                )
              : null,
          onTap: () {
            setState(() {
              selectedDropOffPoint = value;
            });
          },
        ),
      );
    }

    return Dialog(
      backgroundColor: StyleColors.lukhuWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Center(
                child: Text(
                  'Select Drop-off Point',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 207, 200, 200)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedCity,
                  items: <String>['Nairobi'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    hintText: 'City or Town',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 207, 200, 200)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(8.0),
                  value: selectedRoad,
                  items: <String>[
                    'Waiyaki Way',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRoad = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    hintText: 'Main Road',
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (selectedRoad != null) ...[
                const SizedBox(height: 16.0),
                Column(
                  children: [
                    buildCheckmarkListTile(
                      "Pickup Mtaani",
                      "Upper hill towers",
                      "Pickup Mtaani",
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 16.0),
              Row(
                children: [
                  SizedBox(
                    width: size.width - 112,
                    child: DefaultButton(
                      label: 'Submit',
                      onTap: isSubmitDisabled()
                          ? null
                          : () {
                              final locationName = selectedDropOffPoint == "Pickup Mtaani" 
                                  ? "Upper hill towers"
                                  : "Ihenya, 7th Floor, Bihi Towers, Moi Avenue";
                              Navigator.of(context).pop({
                                'shopName': selectedDropOffPoint!,
                                'location': locationName,
                              });
                            },
                      color: StyleColors.lukhuBlue,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  SizedBox(
                    width: size.width - 112,
                    child: DefaultButton(
                      label: 'Cancel',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      boarderColor: StyleColors.lukhuDividerColor,
                      textColor: Theme.of(context).colorScheme.scrim,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
