import 'dart:developer';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AccountType,
        AccountsController,
        AppBarType,
        BlurDialogBody,
        BottomCard,
        ConfirmationCard,
        DefaultBackButton,
        DefaultInputField,
        DefaultTextBtn,
        Helpers,
        LuhkuAppBar,
        MpesaFields,
        PaymentCommand,
        PaymentController,
        ReadContext,
        ShortMessageType,
        ShortMessages,
        StyleColors,
        Uuid,
        UserRepository,
        WatchContext;
import 'package:product_listing_pkg/product_listing_pkg.dart';
import 'package:lukhu_pay/src/controller/accounts_controller.dart';
import 'package:lukhu_pay/src/controller/poll_payment_status.dart';
import 'package:lukhu_pay/src/services/intasend/intasend_payment_service.dart';
import 'package:lukhu_pay/src/services/intasend/intasend_webview.dart';
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/payment/cart_images_display.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/payment/payment_display.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/payment/order_detail.dart.dart';
import 'package:product_listing_pkg/src/pages/bag/pages/payment_order_view.dart';
// import 'package:lukhu_pay/src/services/transactions/process_order_payment.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

import '../widgets/cart_message.dart';
import 'package:lukhu_pay/src/services/transactions/api_config.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});
  static const routeName = 'checkout_view';

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late PaymentCommand _paymentCommand;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _paymentCommand = PaymentCommand(context);
    });
  }

  @override
  void dispose() {
    _paymentCommand.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var order = context.watch<CartController>().order;
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: LuhkuAppBar(
              color: Theme.of(context).colorScheme.onPrimary,
              enableShadow: true,
              backAction: const DefaultBackButton(),
              appBarType: AppBarType.other,
              centerTitle: true,
              title: Expanded(
                child: Text(
                  "Payment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: StyleColors.lukhuDark1,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.18,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DefaultTextBtn(
                    onTap: () {
                      _shareBag(context);
                    },
                    child: Text(
                      "Send Bag",
                      style: TextStyle(
                        color: StyleColors.lukhuBlue,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: context.watch<CartController>().cart.isNotEmpty
                  ? ListView(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 10, right: 16, left: 16),
                          child: CartDisplay(),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: PaymentDisplay(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 16, left: 16, bottom: 30),
                          child: DefaultInputField(
                            label: "Discount Code",
                            onChange: (value) =>
                                context.read<CheckoutController>().setState(),
                            controller: context
                                .read<CheckoutController>()
                                .discountController,
                            suffix:
                                context.watch<CheckoutController>().hasDiscount
                                    ? DefaultTextBtn(
                                        onTap: () {},
                                        child: Text(
                                          'Apply',
                                          style: TextStyle(
                                            color: StyleColors.lukhuBlue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ))
                                    : null,
                            hintText: 'Enter discount code here',
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (p0) {},
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  : const CartMessage(),
            ),
            bottomSheet: MediaQuery.of(context).viewInsets.bottom > 0
                ? null
                : BottomCard(
                    label: "Process Payment",
                    onTap: context
                                .watch<AccountsController>()
                                .selectedMethod
                                .keys
                                .isNotEmpty &&
                            context.watch<CartController>().cart.keys.isNotEmpty ||
                             context.watch<AccountsController>().isChecked
                        ? () {
                            context.read<CartController>().initPayment = true;
                            // _initOrderProcess(context);

                            _processOrderPayment(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => PaymentOrderView()),
                            // );

                          }
                        : null,
                  ),
          ),
          if (context.watch<CartController>().initPayment)
            const Positioned(
              child: LoaderCard(
                title:
                    'You’re almost there! We are processing your order payment',
              ),
            ),
        ],
      ),
    );
  }

  void _processOrderPayment(BuildContext context) async {
    // Retrieve the selected payment method from the AccountsController
    final selectedMethods = context
        .read<AccountsController>()
        .selectedMethod
        .values;

    // If Debit / Credit card option is selected"
    if (selectedMethods.isEmpty) {
      // Set the isLoading property of PaymentController to true
      context
          .read<PaymentController>()
          .isLoading = true;

      // Get User data
      // Get User Data
      double cartTotal = Provider.of<CartController>(context, listen: false)
          .cartTotal;
      final userId = context
          .read<UserRepository>()
          .fbUser
          ?.uid;
      final shopId = context
          .read<UserRepository>()
          .shop
          ?.shopId;
      final walletId = context
          .read<UserRepository>()
          .wallet
          ?.shopId;
      final amount = cartTotal;
      print(amount);

      String apiUrl = ApiConfig.baseUrl + "/card_deposit";

      // Initiate Card Payment
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ISSecretKey_test_83ebc4a2-d751-4f35-96b9-772ed489d596',
          // Replace with your API key
        },
        body: jsonEncode({
          "method": "CARD-PAYMENT",
          "currency": "KES",
          "amount": amount,
          "type": "CARD",
          "description": "Top Up",
          "userId": userId,
          "shopId": shopId,
          "walletId": walletId,
          "metadata": {
            "transaction": "topup"
          }
        }),
      );

      // Sucessful payment Initiation
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final checkoutUrl = data['url'];
        if (checkoutUrl != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IntasendWebView(url: checkoutUrl),
            ),
          );
        }
      } else {
        print('Failed to initiate payment: ${response.body}');
        return null;
      }
      return;
    }

    var payMethod = selectedMethods.first;

    // Function if payment method is Mpesa
    if (payMethod.type == AccountType.mpesa) {
      // Set the isLoading property of PaymentController to true
      context
          .read<PaymentController>()
          .isLoading = true;

      // Get User Data
      final cartController = Provider.of<CartController>(context, listen: false);
  double cartTotal = cartController.cartTotal;
  final cartItems = cartController.cart.values.toList(); // Get cart items as List<Product>
  final cartQuantity = cartController.cartQuantity; // Get quantities map
  final customerName = Provider.of<CartController>(context, listen: false).customerName;

      final userId = context
          .read<UserRepository>()
          .fbUser
          ?.uid;
      final shopId = context
          .read<UserRepository>()
          .shop
          ?.shopId;
      final walletId = context
          .read<UserRepository>()
          .wallet
          ?.shopId;
      final amount = cartTotal;
      final phoneNumber = payMethod.account ?? '';
      String depositApiUrl = "${ApiConfig.baseUrl}/process_order_payment";
      String? idToken = await getFirebaseIdToken(context);
      
       // Prepare items data from cart
  List<Map<String, dynamic>> itemsData = cartItems.map((product) {
    return {
      "amount": product.price,
      "colour": cartController.cartColors[product.productId] ?? '', // Get color from cartColors
      "productId": product.productId,
      "quantity": cartQuantity[product.productId] ?? 1, // Get quantity from cartQuantity
      "sellerId": product.sellerId,
      "size": cartController.cartSizes[product.productId] ?? '', // Get size from cartSizes
      "orderImages": (product.images?.isNotEmpty ?? false) 
          ? [product.images!.first] 
          : []
    };
  }).toList();


      try {
        // Initiate the STK push using IntaSend API
        final response = await http.post(
          Uri.parse(depositApiUrl),
          headers: <String, String>{
            'Authorization': 'Bearer $idToken',
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "name": cartController.customerName.text,
            "statuType": "pending",
            "userId": userId,
            "shopId": shopId,
            "walletId": walletId,
            "amount": amount,
            "phone_number": phoneNumber,
            "currency": "KES",
            "description": "Bought Item",
            "type": "M-PESA",
            "metadata": {
              "type": "pending"
            },
            "items": itemsData
          }),
        );


        if (response.statusCode == 200) {
          final result = json.decode(response.body);
          final transactionId = result["id"];

          // Start polling for payment status
          await pollPaymentStatus(context, transactionId);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentOrderView()),
          );

          return;
        } else {
          print('Failed to initiate payment: ${response.body}');
          return null;
        }

        // Show an error message if something went wrong
        ShortMessages.showShortMessage(
          message: 'Something  wrong! Please try again.',
          type: ShortMessageType.error,
        );
        // Pop the current screen off the navigation stack
        Navigator.of(context).pop();
      } catch (e) {
        // Log the error
        Helpers.debugLog('Error: $e');

        // Handle errors by showing an error message
        ShortMessages.showShortMessage(message: 'Something went wrong!');
      } finally {
        context
            .read<PaymentController>()
            .isLoading = false;
      }
    } else {
      // Function if payment method is Debit / Credit Card
      print('Debit/Credit Card payment method selected.');
    }
  }

  void _initOrderProcess(BuildContext context) {
    var payMethod =
        context.read<AccountsController>().selectedMethod.values.first;
    context.read<CartController>().initPayment = true;
    try {
      context.read<CartController>().countOrderDocuments().then((orderCount) {
        context.read<CartController>().orderCount = orderCount;
        context.read<PaymentController>().initiatePayment(
          post: {
            MpesaFields.amount:
                '${context.watch<CartController>().cartTotal.toInt()}',
            MpesaFields.phoneNumber: payMethod.account ?? '',
            MpesaFields.reference: const Uuid().v4(),
          },
          type: payMethod.type!,
        ).then((value) {
          Future.delayed(const Duration(milliseconds: 3500));
          if (value || context.read<PaymentController>().isPaymentComplete) {
            _paymentCommand.execute(true);
            return;
          }
          context.read<CartController>().initPayment = false;
          ShortMessages.showShortMessage(
            message: 'Something went wrong!. Please try again.',
            type: ShortMessageType.error,
          );
        });
      });
    } catch (e) {
      context.read<CartController>().initPayment = false;
      Helpers.debugLog('An error occurred: $e');
    }
  }

  void _shareBag(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return BlurDialogBody(
          bottomDistance: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ConfirmationCard(
              title: "Scan to order",
              assetImage: AppUtil.shareBag,
              packageName: AppUtil.packageName,
              color: StyleColors.lukhuBlue0,
              colorShadeSecond: StyleColors.lukhuBlue10,
              description:
                  "Ask the customer to scan this code or share the Bag link with them to order",
              height: 650,
              primaryLabel: "Share Link",
              secondaryLabel: "Cancel",
              descriptionChild: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
                  height: 340,
                  decoration: BoxDecoration(
                    color: StyleColors.shadeColor1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(),
                ),
              ),
              onPrimaryTap: () {},
              onSecondaryTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
