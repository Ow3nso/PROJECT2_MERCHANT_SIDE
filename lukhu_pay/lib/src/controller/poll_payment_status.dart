//import packages
// import 'dart:developer';
import 'dart:convert';
// import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'package:intasend_flutter/intasend_flutter.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
    // AppBarType,
    // BlurDialogBody,
    // DefaultBackButton,
    Helpers,
    // LuhkuAppBar,
    // MpesaFields,
    NavigationService,
    ReadContext,
    ShortMessageType,
    ShortMessages;
    // StyleColors,
    // WatchContext,
    // Uuid;
import 'package:lukhu_pay/lukhu_pay.dart';
// import 'package:lukhu_pay/src/widgets/billing/billing_card.dart';
// import 'package:lukhu_pay/src/widgets/default_key_pad.dart';

// import '../controller/keypad_controller.dart';
// import '../widgets/billing/billing_amount.dart';
// import '../widgets/billing/error_card.dart';
// import '../widgets/billing/success_card.dart';
import '../services/transactions/api_config.dart';

Future<void> pollPaymentStatus(BuildContext context, String? transactionId) async {
  const int maxRetries = 30;
  const int delayMs = 1000; // 3 seconds delay between polls
  String apiUrl = "${ApiConfig.baseUrl}/transaction/$transactionId";
  String? idToken = await getFirebaseIdToken(context);

  for (int attempt = 0; attempt < maxRetries; attempt++) {
    try {
      final statusResponse = await http.get(
        Uri.parse(apiUrl),
        headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $idToken',
        // Replace with your API key
      },
      );

      if (statusResponse.statusCode == 200) {
        final statusResult = json.decode(statusResponse.body);
        Helpers.debugLog('Status check result: $statusResult');

        if (statusResult['status'] == 'COMPLETE') {
          Helpers.debugLog('Payment success, navigating to wallet');
          context.read<PaymentController>().isTopUp = true;

          // Navigate to the wallet route
          NavigationService.navigate(context, LoadingView.routeName);
          return;
        }
      }
    } catch (e) {
      Helpers.debugLog('Error checking payment status: $e');
    }

    // Wait before the next poll
    await Future.delayed(const Duration(milliseconds: delayMs));
  }

  // If max retries reached without success
  ShortMessages.showShortMessage(
    message: 'Payment confirmation timeout. Please check your payment status.',
    type: ShortMessageType.error,
  );

  // Pop the current screen off the navigation stack
  Navigator.of(context).pop();
}