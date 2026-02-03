import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
  show
      UserRepository,
      ReadContext,
      WatchContext;

import '../../services/transactions/api_config.dart';

class WithdrawalService {
  Future<void> makeWithdrawal(BuildContext context, String account, double amount) async {
    // user variables
    final userId = context.read<UserRepository>().fbUser?.uid;
    final shopId = context.read<UserRepository>().shop?.shopId;
    final walletId = context.read<UserRepository>().wallet?.shopId;
    // api url
    String apiUrl = "${ApiConfig.baseUrl}/withdraw";
    // Debug
    print('userId: $userId');
    print('shoId: $shopId');
    print('walletId: $walletId');
    print('Making withdrawal request to $apiUrl');
    print('Request body: ${json.encode({'amount': amount.toString(), 'account': account})}');

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'amount': amount.toString(),
          'account': account,
          'currency': "KES",
          'status': 'PENDING',
          'type': "M-PESA",
          'description': "Withdrawal",
          // 'imageUrl': imageUrl,
          // 'reference': reference,
          'userId': userId,
          'shopId': shopId,
          'walletId': walletId,
          "metadata":{
            "transaction":"withdraw"
          }
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        // Handle success
        print('Withdrawal successful: ${response.body}');
      } else {
        // Handle error
        print('Withdrawal failed: ${response.body}');
        throw Exception('Withdrawal failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('RequestException: $e');
      throw e; // Rethrow to be handled by the caller
    }
  }
}