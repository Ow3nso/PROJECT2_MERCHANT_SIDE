import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';
import 'package:http/http.dart' as http; 

Future<void> savePin(BuildContext context, String pin) async {
  // final url = Uri.parse('https://lukhu-backend-api.onrender.com/api/payments/save-pin/');
  final url = Uri.parse('https://lukhu-backend-api.onrender.com/api/v1/user/save-pin/');
  final userId = context
      .read<UserRepository>()
      .fbUser
      ?.uid;

  print('Saving PIN to $url');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token', // Include token for authentication
    },
    body: json.encode({
      'pin': pin,
      'user_id':userId
    }),
  );

  if (response.statusCode == 200) {
    // Handle successful response
    print('PIN saved successfully');
  } else {
    // Handle error response
    print('Failed to save PIN: ${response.body}');
  }
}

Future<bool> confirmPin(BuildContext context, String pin) async {
  final url = Uri.parse('https://lukhu-backend-api.onrender.com/api/v1/user/confirm-pin/');

  final userId = context
      .read<UserRepository>()
      .fbUser
      ?.uid;

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $token', // Include token for authentication
    },
    body: json.encode({
      'pin': pin,
      'user_id':userId
    }),
  );

  if (response.statusCode == 200) {
    // Handle successful response
    print('PIN confirmed. Access granted.');
    return true;
  } else {
    // Handle error response
    print('Failed to confirm PIN: ${response.body}');
    return false;
  }
}
