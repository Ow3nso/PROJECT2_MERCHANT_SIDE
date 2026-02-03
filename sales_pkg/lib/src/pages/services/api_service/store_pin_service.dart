import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sales_pkg/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  AuthController authController = Get.find();

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        // authentication successful, do something
      },
      verificationFailed: (FirebaseAuthException e) {
        // authentication failed, do something
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Save verificationId to the controller
        authController.setVerificationId(verificationId);
        // Now you can prompt the user for the SMS code
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<bool> verifyOtp(String userOtp) async {
    String verificationId = authController.verificationId.value;
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
        verificationId: verificationId, 
        smsCode: userOtp
      );
      User? user = (await auth.signInWithCredential(creds)).user;

      if (user != null) {
        // Authentication successful, return true
        return true;
      } else {
        // Authentication failed, return false
        return false;
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.message.toString(),
        "Failed",
        colorText: Colors.white,
      );
      // If there's an error, return false
      return false;
    }
  }

}
