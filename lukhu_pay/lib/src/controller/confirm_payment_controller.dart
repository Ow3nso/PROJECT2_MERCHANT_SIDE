// // import packages
// import 'dart:developer';
// import 'dart:convert';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// // import 'package:intasend_flutter/intasend_flutter.dart';
// import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
//     show
//     AppBarType,
//     BlurDialogBody,
//     DefaultBackButton,
//     Helpers,
//     LuhkuAppBar,
//     MpesaFields,
//     NavigationService,
//     ReadContext,
//     ShortMessageType,
//     ShortMessages,
//     StyleColors,
//     WatchContext,
//     Uuid;
// import 'package:lukhu_pay/lukhu_pay.dart';
// import 'package:lukhu_pay/src/widgets/billing/billing_card.dart';
// import 'package:lukhu_pay/src/widgets/default_key_pad.dart';
//
// import '../controller/keypad_controller.dart';
// import '../controller/poll_payment_status.dart';
// import '../controller/payment_controller.dart';
// import '../widgets/billing/billing_amount.dart';
// import '../widgets/billing/error_card.dart';
// import '../widgets/billing/success_card.dart';
//
// Future<void> confirmPayment(BuildContext context) async {
//   // Retrieve the selected payment method from the AccountsController
//   var payMethod =
//       context.read<AccountsController>().selectedMethod.values.first;
//
//   // Set the isLoading property to true
//   context.read<PaymentController>().isLoading = true;
//
//   // Prepare the payment details
//   final amount = context.read<KeypadController>().keyPadCode;
//   final phoneNumber = payMethod.account ?? '';
//
//   try {
//     // Initiate the STK push using IntaSend API
//     final response = await http.post(
//       Uri.parse('http://192.168.139.130:8000/api/payments/deposit'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode({
//         'amount': amount,
//         'phone_number': phoneNumber
//       }),
//     );
//
//     // Log the result
//     Helpers.debugLog('Response: ${response.body}');
//
//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);
//       Helpers.debugLog('RESULT: $result');
//
//       // Extract transaction ID from the response
//       final transactionId = result['transaction_id'];
//       Helpers.debugLog('Transaction ID: $transactionId');
//
//       // Set transactionId in PaymentController
//       context.read<PaymentController>().transactionId = transactionId;
//
//       // Navigate to the loading view
//       Navigator.of(context).pushNamed(LoadingView.routeName);
//
//       // Start polling for payment status using the transaction ID
//       await pollPaymentStatus(context, transactionId);
//
//       return;
//     }
//
//     // Show an error message if something went wrong
//     ShortMessages.showShortMessage(
//       message: 'Something went wrong!. Please try again.',
//       type: ShortMessageType.error,
//     );
//
//     // Pop the current screen off the navigation stack
//     Navigator.of(context).pop();
//   } catch (e) {
//     // Log the error
//     Helpers.debugLog('Error: $e');
//
//     // Handle errors by showing an error message
//     ShortMessages.showShortMessage(message: 'Something went wrong!');
//   } finally {
//     context.read<PaymentController>().isLoading = false;
//   }
// }