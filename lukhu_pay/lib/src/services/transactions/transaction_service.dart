// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
// import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
//     show Transaction, ReadContext, UserRepository;

// import '../../services/transactions/api_config.dart';

// // API Service
// class TransactionService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<Transaction>> fetchTransactions(BuildContext context) async {
//     try {
//       // Get the authenticated user's ID
//       final userId = context.read<UserRepository>().fbUser?.uid;
//       if (userId == null) {
//         print('Error: User not authenticated');
//         throw Exception('User not authenticated');
//       }

//       print('Fetching transactions for user: $userId');

//       // Query Firestore for transactions belonging to the specific user
//       QuerySnapshot querySnapshot = await _firestore
//           .collection('mytransactions')
//           .where('userId', isEqualTo: userId) // Filter by user ID
//           .get();

//       if (querySnapshot.docs.isEmpty) {
//         print('No transactions found for user: $userId');
//         return [];
//       }

//       // Debugging: Print retrieved documents
//       print('Fetched ${querySnapshot.docs.length} transactions');
//       for (var doc in querySnapshot.docs) {
//         print('Transaction: ${doc.data()}');
//       }

//       // Convert documents to Transaction objects
//       List<Transaction> transactions = querySnapshot.docs
//           .map((doc) => Transaction.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();

//       return transactions;
//     } catch (e) {
//       print('Error fetching transactions: $e');
//       throw Exception('Error fetching transactions');
//     }
//   }
// }









import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Transaction, ReadContext, UserRepository;

// Firestore Service
class TransactionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Transaction>> fetchTransactions(BuildContext context) async {
    try {
      // Get the authenticated user's ID
      final userId = context.read<UserRepository>().fbUser?.uid;
      final walletId = context
          .read<UserRepository>()
          .wallet
          ?.shopId;
      if (userId == null) {
        print('Error: User not authenticated');
        throw Exception('User not authenticated');
      }

      print('Fetching transactions for user: $userId');

      // Query Firestore for transactions
      final querySnapshot = await _firestore
          .collection('mytransactions')
          .where('walletId', isEqualTo: walletId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('No transactions found for user: $userId');
        return [];
      }

      // Debugging: Print number of transactions retrieved
      print('Fetched ${querySnapshot.docs.length} transactions');

      // Convert Firestore documents to Transaction objects
      List<Transaction> transactions = querySnapshot.docs
          .map((doc) => Transaction.fromJson(doc.data()))
          .toList();

      return transactions;
    } catch (e) {
      print('Error fetching transactions: $e');
      throw Exception('Error fetching transactions');
    }
  }

  // Optional: Add real-time updates listener
  Stream<List<Transaction>> getTransactionsStream(BuildContext context) {
    final userId = context.read<UserRepository>().fbUser?.uid;
    final walletId = context
          .read<UserRepository>()
          .wallet
          ?.shopId;
    if (userId == null) {
      return Stream.error('User not authenticated');
    }

    return _firestore
        .collection('mytransactions')
        .where('walletId', isEqualTo: walletId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Transaction.fromJson(doc.data()))
            .toList());
  }
}


