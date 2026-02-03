import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show AppBarType, DiscountCard, Helpers, LuhkuAppBar, NotificationIcon, ReadContext, StyleColors, UserRepository, WatchContext;
import 'package:sales_pkg/src/controllers/customer_controller.dart';
import 'package:sales_pkg/src/controllers/merchant_controller.dart';
import 'package:sales_pkg/src/pages/seller/widgets/action_view_card.dart';
import 'package:sales_pkg/src/pages/seller/widgets/resource_section.dart';
import 'package:sales_pkg/src/widgets/dialogue.dart';

import 'package:auth_plugin/src/widgets/blur_dialog_body.dart';
import 'package:auth_plugin/src/widgets/account/user_image.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/add_profile_photo_view.dart';
import '../../utils/styles/app_util.dart';
import '../../widgets/user_avatar.dart';

import 'widgets/share_store.dart';
import 'widgets/category_card.dart';
import 'widgets/stats_section.dart';
import 'widgets/pin_card.dart'; // Import the new PinCard widget

class SellerPage extends StatefulWidget {
  const SellerPage({super.key});
  static const routeName = 'sell_page';

  @override
  State<SellerPage> createState() => _SellerPageState();
}

class _SellerPageState extends State<SellerPage> {
  bool _isSetPinCardVisible = false;
  bool _isPinCardVisible = false; // State variable to control the visibility of the PinCard
  bool _isCreatePinVisible = false; // State variable for CreatePinCard visibility
  bool _isCheckingPin = true;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomerController>().shopId =
          context.read<UserRepository>().fbUser?.uid ?? "";
      if (!context.read<MerchantController>().showBackButton) {
        return;
      }
      Helpers.debugLog(
          '[USER-ID]${context.read<UserRepository>().fbUser?.uid}');
      context.read<MerchantController>().showBackButton = false;

      // Check if the user needs to set a PIN first
      setState(() {
        _isCreatePinVisible = true;
      });

      // Show CreatePinCard if no PIN exists, otherwise show PinCard
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
        builder: (BuildContext context) {
          return _isCreatePinVisible
              ? const SetPinCard()
              : const PinCard();
        },
      ).then((_) {
        setState(() {
          _isCreatePinVisible = false;
          _isPinCardVisible = false;
        });
      });
    });
  }

  void show(BuildContext context, Widget child) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
            bottomDistance: 80,
            child: WillPopScope(
              onWillPop: () async => false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: child,
              ),
            ),
          );
        });
  }

  // Firebase initialization method
  Future<void> _initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      print('Firebase Initialized');
      _checkPinStatus();
    } catch (e) {
      print('Firebase initialization error: $e');
    }
  }

  Future<void> _checkPinStatus() async {
    final userId = context.read<UserRepository>().fbUser?.uid ?? "";

    // Make the API call to check if PIN exists
    final url = Uri.parse('https://dukastaxbackendapi-production.up.railway.app/api/v1/user/check-pin/$userId/'); // Replace with your API URL
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          _isSetPinCardVisible = !(data['pin_exists'] ?? false);
          _isPinCardVisible = true;
          _isCreatePinVisible = !(data['pin_exists'] ?? false); // Show CreatePinCard only if pin_exists is false
          _isCheckingPin = false; // API check complete
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error checking PIN status: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: _buildAppBar(),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: ListView.builder(
              itemCount: _views.length,
              itemBuilder: (context, index) => _views[index],
            ),
          ),
          if (_isPinCardVisible || _isCreatePinVisible) ...[
            // ModalBarrier(dismissible: false, color: Colors.black.withOpacity(0.5)),
            // Container(
            //   color: Colors.black.withOpacity(0), // Transparent container
            // ),
          ],
        ],
      ),
    );
  }

  LuhkuAppBar _buildAppBar() {
    return LuhkuAppBar(
      bottomHeight: 1,
      color: StyleColors.sellPageAppBarColor,
      appBarType: AppBarType.other,
      backAction: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ProfileImage(
                  onTap: () {
                    // show(
                    //   context,
                    //   const AddProfilePhotoView(
                    //     label: 'Cancel',
                    //   ),
                    // );
                  },
                  image: context.watch<UserRepository>().user?.imageUrl,
                ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.read<UserRepository>().shop?.name ?? '',
                style: TextStyle(
                  color: StyleColors.gray90,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                context.read<UserRepository>().shop?.webDomain ?? '',
                style: TextStyle(
                  color: StyleColors.gray90,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 16),
          child: DiscountCard(
            color: StyleColors.lukhuBlue,
            iconImage: AppUtil.sendIcon,
            imageColor: StyleColors.lukhuWhite,
            description: 'Share store',
            style: TextStyle(
              color: StyleColors.lukhuWhite,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            packageName: AppUtil.packageName,
              onTap: () {
                Dialogue.blurredDialogue(
                context: context,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ShareQrCard()));
            },
          ),
        ),
        const NotificationIcon(),
      ],
    );
  }

  List<Widget> get _views => [
    const StatsSection(),
    const SizedBox(height: 0),
    const ActionViewCard(),
    const CategoryCard(),
    const ResourceSection()
  ];

  double padding(bool isLast, double spacing) => isLast ? spacing : 5;
}
