import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<String?> getFirebaseIdToken() async {
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     String? idToken = await user.getIdToken(true); // Force token refresh
//     return idToken;
//   }
//   return null;
// }

class PaymentService {
  static Future<bool> processPayment(Map<String, dynamic> paymentData) async {
    final String paymentMethod = paymentData['type'];

    if (paymentMethod == 'M-PESA') {
      return _processMpesaPayment(paymentData);
    } else if (paymentMethod == 'Credit/Debit Card') {
      return _processCardPayment(paymentData);
    } else {
      throw Exception('Unsupported payment method');
    }
  }

  static Future<bool> _processMpesaPayment(Map<String, dynamic> paymentData) async {
    const String mpesaEndpoint = 'https://dukastaxbackendapi-production.up.railway.app/api/v1/payments/process_order_payment';

    try {
      final response = await http.post(
        Uri.parse(mpesaEndpoint),
        headers: <String, String>{
          // 'Authorization': 'Bearer $idToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(paymentData),
      );

      if (response.statusCode == 200) {
        return true; // Payment successful
      } else {
        return false; // Payment failed
      }
    } catch (e) {
      print('Error processing payment: $e');
      return false; // Payment failed due to an error
    }
  }

  static Future<bool> _processCardPayment(Map<String, dynamic> paymentData) async {
    const String cardEndpoint = 'https://dukastaxbackendapi-production.up.railway.app/api/v1/payments/process_order_payment';

    try {
      final response = await http.post(
        Uri.parse(cardEndpoint),
        headers: <String, String>{
          // 'Authorization': 'Bearer $idToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(paymentData),
      );

      if (response.statusCode == 200) {
        return true; // Payment successful
      } else {
        return false; // Payment failed
      }
    } catch (e) {
      print('Error processing payment: $e');
      return false; // Payment failed due to an error
    }
  }
}
