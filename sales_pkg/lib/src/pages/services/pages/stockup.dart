import 'package:flutter/material.dart';
import 'dart:ui';

// import 'package:sales_pkg/src/pages/services/pages/stockup/header.dart';
import '';
import 'package:sales_pkg/src/pages/services/widgets/stockup/header.dart';
import 'package:sales_pkg/src/pages/services/widgets/stockup/categories.dart';
import 'package:sales_pkg/src/pages/services/widgets/stockup/filters.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        LuhkuAppBar;

class StockUp extends StatefulWidget {
  const StockUp({super.key});

  @override
  _StockUpState createState() => _StockUpState();
}

class _StockUpState extends State<StockUp> {
  @override
  void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.transparent, // Make the modal background transparent
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50), // Increase bottom padding to 50px
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white, // White background for the modal
              borderRadius: BorderRadius.circular(8.0), // Rounded corners for the modal
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xff003CFF), // Green background for the icon
                  radius: 24, // Size of the icon container
                  child: Icon(
                    Icons.timer, // Checkmark icon
                    color: Colors.white, // White color for the icon
                    size: 32, // Size of the icon
                  ),
                ),
                const SizedBox(height: 16), // Space between the icon and the title
                const Text(
                  'StockUp with Dukastax',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
                const SizedBox(height: 16),
                const Text(
                  'We are working on a better way to source for your stock. Tap the button below to be notified when we launch this service',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity, // Set width to double.infinity
                  height: 50, // Set height to 50
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent, // Make the modal background transparent
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 50), // Increase bottom padding to 50px
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white, // White background for the modal
                                borderRadius: BorderRadius.circular(8.0), // Rounded corners for the modal
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircleAvatar(
                                    backgroundColor: Color.fromARGB(255, 152, 214, 154), // Green background for the icon
                                    radius: 24, // Size of the icon container
                                    child: Icon(
                                      Icons.check, // Checkmark icon
                                      color: Colors.white, // White color for the icon
                                      size: 32, // Size of the icon
                                    ),
                                  ),
                                  const SizedBox(height: 16), // Space between the icon and the title
                                  const Text(
                                    'Awesome',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center, // Center the text
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'You will be notified onc this service is available via app, SMS and Email.',
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center, // Center the text
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity, // Set width to double.infinity
                                    height: 50, // Set height to 50
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/service');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff003CFF), // Set button color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0), // Button border radius
                                        ),
                                      ),
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff003CFF), // Set button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Button border radius
                      ),
                    ),
                    child: const Text(
                      'I am interested',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        enableShadow: true,
        color: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          'StockUp',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: const Column(
              children: [
                SizedBox(height: 16),
                HeaderCard(),
                SizedBox(height: 16),
                CategoriesCard(),
                SizedBox(height: 16),
                FiltersCard(),
              ],
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}