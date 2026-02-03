import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext, UserRepository;

// Payments api config
class ApiConfig {
  // Base Url
  static const String baseUrl = "https://37fda4d64192.ngrok-free.app/api/v1/payments";
}

Future<String?> getFirebaseIdToken(BuildContext context) async {
    final firebaseUser = context.read<UserRepository>().fbUser;
    if (firebaseUser != null) {
      
      String? idToken = await firebaseUser.getIdToken(true);
      return idToken;
    }
    return null;
  }
