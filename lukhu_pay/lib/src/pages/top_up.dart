import 'dart:developer';
// import 'dart:convert';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:intasend_flutter/intasend_flutter.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        // AccountType,
        AppBarType,
        BlurDialogBody,
        DefaultBackButton,
        // Helpers,
        LuhkuAppBar,
        // MpesaFields,
        // UserRepository,
        // NavigationService,
        ReadContext,
        // ShortMessageType,
        ShortMessages,
        StyleColors,
        WatchContext;
        // Uuid;
import 'package:lukhu_pay/lukhu_pay.dart';
import 'package:lukhu_pay/src/widgets/billing/billing_card.dart';
import 'package:lukhu_pay/src/widgets/default_key_pad.dart';

import '../controller/keypad_controller.dart';
import '../controller/accounts_controller.dart';
// import '../controller/poll_payment_status.dart';
import '../widgets/billing/billing_amount.dart';
import '../widgets/billing/error_card.dart';
import '../widgets/billing/success_card.dart';

import '../services/transactions/topup_confirm_payment.dart';
// import '../services/intasend/intasend_payment_service.dart';
// import '../services/intasend/intasend_webview.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});
  static const routeName = 'top_up';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        context.read<KeypadController>().keyPadCode = '';
        context.read<AccountsController>().isError = false;
        context.read<AccountsController>().isSuccess = false;
        context.read<AccountsController>().showGlow = false;
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              appBar: LuhkuAppBar(
                appBarType: AppBarType.other,
                backAction: DefaultBackButton(
                  onTap: () {
                    context.read<KeypadController>().keyPadCode = '';
                    context.read<AccountsController>().isError = false;
                    context.read<AccountsController>().isSuccess = false;
                    context.read<AccountsController>().showGlow = false;
                    Navigator.of(context).pop();
                  },
                ),
                centerTitle: true,
                title: Text(
                  'Top-Up',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Top-up Amount',
                            style: TextStyle(
                                color: StyleColors.lukhuGrey70,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          BillingAmount(
                            amount: context
                                    .watch<KeypadController>()
                                    .keyPadCode
                                    .isEmpty
                                ? '0'
                                : context.watch<KeypadController>().keyPadCode,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    DefaultKeyPad(
                      label: 'Top-Up Wallet',
                      onDelete: () {
                        context.read<KeypadController>().deleteCode();
                      },
                      onConfirm:
                          context.read<KeypadController>().keyPadCode.isNotEmpty
                              ? () {
                                  context.read<AccountsController>().reset();
                                  show(context);
                                }
                              : null,
                      onTap: (value) {
                        context.read<KeypadController>().createCode(value);
                        log('[VALUE]$value');
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (context.watch<AccountsController>().isSuccess)
              Positioned(
                child: SuccessCard(
                  onTap: () {
                    context.read<AccountsController>().reset();

                    Navigator.of(context).pop();
                  },
                  title: 'Top-up Successful',
                  description:
                      'Your wallet top-up request was successful. You can find the details below for your reference.',
                  subTitle: 'Top-up Details',
                ),
              ),
            if (context.watch<AccountsController>().isError)
              Positioned(
                child: ErrorCard(
                  title: 'Top-up Failed',
                  description:
                      'We were unable to complete your wallet top-up request. Tap below to retry',
                  onTap: () {
                    context.read<AccountsController>().reset();
                    context.read<AccountsController>().startTimer(() {});
                  },
                ),
              )
          ],
        ),
      ),
    );
  }

  void show(BuildContext context) {
    if (context.read<KeypadController>().keyPadCode.isEmpty) {
      ShortMessages.showShortMessage(
          message: "To proceed, add a valid amount!.");
      return;
    }
    if (context.read<KeypadController>().keyPadCode == '0') {
      ShortMessages.showShortMessage(
          message: "To proceed, amount must be greater than zero!.");
      return;
    }
    showDialog(
      context: context,
      builder: (context) => BlurDialogBody(
        child: BillingCard(
          label: 'Confirm',
          title: 'Top-up your wallet',
          // isConfirmEnabled: context.watch<AccountsController>().selectedMethod.keys.isNotEmpty,
          onConfirm: () async {
            confirmPayment(context);
          },
        ),
      ),
    );
  }

  // Future<void> _confirmPayment(BuildContext context) async {
  //   // Retrieve the selected payment method from the AccountsController
  //   final selectedMethods = context.read<AccountsController>().selectedMethod.values;
  //
  //   // If Debit / Credit card option is selected"
  //   if (selectedMethods.isEmpty) {
  //     // Set the isLoading property of PaymentController to true
  //     context.read<PaymentController>().isLoading = true;
  //
  //     // Get User data
  //     final userId = context.read<UserRepository>().fbUser?.uid;
  //     final shopId = context.read<UserRepository>().shop?.shopId;
  //     final walletId = context.read<UserRepository>().wallet?.shopId;
  //     final amount = context.read<KeypadController>().keyPadCode;
  //     final url = 'http://192.168.113.130:8000/api/payments/card_deposit'; // Replace with actual endpoint
  //
  //     // Initiate Card Payment
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer ISSecretKey_test_83ebc4a2-d751-4f35-96b9-772ed489d596', // Replace with your API key
  //       },
  //       body: jsonEncode({
  //         "method": "CARD-PAYMENT",
  //         "currency": "KES",
  //         "amount":amount,
  //         "type":"CARD",
  //         "description":"Top Up",
  //         "userId": userId,
  //         "shopId": shopId,
  //         "walletId": walletId,
  //         "metadata":{
  //           "transaction": "topup"
  //         }
  //       }),
  //     );
  //
  //     // Sucessful payment Initiation
  //     if (response.statusCode == 201) {
  //       final data = jsonDecode(response.body);
  //       final checkoutUrl = data['url'];
  //       if (checkoutUrl != null) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => IntasendWebView(url: checkoutUrl),
  //           ),
  //         );
  //       }
  //     } else {
  //       print('Failed to initiate payment: ${response.body}');
  //       return null;
  //     }
  //     return;
  //   }
  //
  //   var payMethod = selectedMethods.first;
  //
  //   // Function if payment method is Mpesa
  //   if (payMethod.type == AccountType.mpesa) {
  //
  //     // Set the isLoading property of PaymentController to true
  //     context.read<PaymentController>().isLoading = true;
  //
  //     // Get User Data
  //     final userId = context.read<UserRepository>().fbUser?.uid;
  //     final shopId = context.read<UserRepository>().shop?.shopId;
  //     final walletId = context.read<UserRepository>().wallet?.shopId;
  //     final amount = context.read<KeypadController>().keyPadCode;
  //     final phoneNumber = payMethod.account ?? '';
  //     final url = 'http://192.168.113.130:8000/api/payments/deposit';
  //
  //     try {
  //       // Initiate the STK push using IntaSend API
  //       final response = await http.post(
  //         Uri.parse(url),
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //         body: json.encode({
  //           'amount': amount,
  //           'phone_number': phoneNumber,
  //           'currency': "KES",
  //           'type': "M-PESA",
  //           'description': "Top Up",
  //           'userId': userId,
  //           'shopId': shopId,
  //           'walletId': walletId,
  //           "metadata": {
  //             "transaction": "topup"
  //           }
  //         }),
  //       );
  //
  //       if (response.statusCode == 200) {
  //         final result = json.decode(response.body);
  //         final transactionId = result["id"];
  //
  //         // Start polling for payment status
  //         await pollPaymentStatus(context, transactionId);
  //
  //         return;
  //       }
  //
  //       // Show an error message if something went wrong
  //       ShortMessages.showShortMessage(
  //         message: 'Something went wrong! Please try again.',
  //         type: ShortMessageType.error,
  //       );
  //
  //       // Pop the current screen off the navigation stack
  //       Navigator.of(context).pop();
  //     } catch (e) {
  //       // Log the error
  //       Helpers.debugLog('Error: $e');
  //
  //       // Handle errors by showing an error message
  //       ShortMessages.showShortMessage(message: 'Something went wrong!');
  //     } finally {
  //       context.read<PaymentController>().isLoading = false;
  //     }
  //   } else {
  //     // Function if payment method is Debit / Credit Card
  //     print('Debit/Credit Card payment method selected.');
  //   }
  // }
}
