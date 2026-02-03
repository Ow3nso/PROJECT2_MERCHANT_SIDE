// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
// import 'package:auth_plugin/src/pages/otp_page.dart';

// class AuthController extends GetxController {
//   SignUpFlowController get signUpFlowController => signUpFlowController;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   String verificationId = Get.arguments[0]; // Make this nullable to prevent errors
//   String? currentText;

//   Future<void> signInWithPhoneNumber(String phoneNumber) async {
//     FirebaseAuth auth = FirebaseAuth.instance;

//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential);
//         // authentication successful, do something
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         // authentication failed, do something
//       },
//       codeSent: (String verificationId, int? resendToken) async {
//         // code sent to phone number, save verificationId for later use
//         String smsCode = ''; // get sms code from user
//         PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId,
//           smsCode: smsCode,
//         );
//         Get.to(OtpPage(), arguments: [verificationId]);
//         await auth.signInWithCredential(credential);
//         // authentication successful, do something
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

//   void _userLogin() async {
//     signInWithPhoneNumber('+254707394018');
//   }
// }
