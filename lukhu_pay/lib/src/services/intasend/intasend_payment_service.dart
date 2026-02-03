import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
    AppBarType,
    BlurDialogBody,
    DefaultBackButton,
    Helpers,
    LuhkuAppBar,
    MpesaFields,
    UserRepository,
    NavigationService,
    ReadContext,
    ShortMessageType,
    ShortMessages,
    StyleColors,
    WatchContext,
    Uuid;
import '../../controller/keypad_controller.dart';
import '../transactions/api_config.dart';

Future<String?> initiatePayment(BuildContext context) async {
  final userId = context.read<UserRepository>().fbUser?.uid;
  final shopId = context.read<UserRepository>().shop?.shopId;
  final walletId = context.read<UserRepository>().wallet?.shopId;
  final amount = context.read<KeypadController>().keyPadCode;
  String apiUrl = ApiConfig.baseUrl + "/card_deposit";

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ISSecretKey_test_83ebc4a2-d751-4f35-96b9-772ed489d596', // Replace with your API key
    },
    body: jsonEncode({
      "method": "CARD-PAYMENT",
      "currency": "KES",
      "amount":amount,
      "type":"CARD",
      "description":"Top Up",
      "userId": userId,
      "shopId": shopId,
      "walletId": walletId,
      "metadata":{
        "transaction": "topup"
      }
    }),
  );

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return data['url']; // Replace with actual response field
  } else {
    print('Failed to initiate payment: ${response.body}');
    return null;
  }
}
