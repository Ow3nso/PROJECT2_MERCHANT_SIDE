import 'package:get/get.dart';

class AuthController extends GetxController {
  var verificationId = ''.obs;

  void setVerificationId(String id) {
    verificationId.value = id;
  }
}
