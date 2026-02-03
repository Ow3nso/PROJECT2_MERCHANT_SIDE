import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CartController,
        FirebaseFirestore,
        Helpers,
        InvoiceModel,
        MpesaModel,
        NavigationService,
        ReadContext,
        ShortMessages,
        StringExtension,
        Transaction,
        UserRepository;
import 'package:lukhu_pay/util/app_util.dart';
import 'package:http/http.dart' as http;
import '../services/transactions/api_config.dart';

class TransactionController extends ChangeNotifier {
  final db = FirebaseFirestore.instance;

  Map<String, Transaction> _transactions = {};
  Map<String, Transaction> get transactions => _transactions;
  set transactions(Map<String, Transaction> value) {
    _transactions = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> filterTransactions = AppUtil.filterTransactions;

  Set<String> selectedFilterTransactions = {};

  TransactionController() {
    init();
  }

  MpesaModel? _mpesaModel;
  MpesaModel? get mpesaModel => _mpesaModel;
  set mpesaModel(MpesaModel? value) {
    _mpesaModel = value;
    notifyListeners();
  }

  InvoiceModel? _invoice;
  InvoiceModel? get invoice => _invoice;
  set invoice(InvoiceModel? value) {
    _invoice = value;
    notifyListeners();
  }

  bool _showTransactions = true;
  bool get showTransactions => _showTransactions;

  set showTransactions(bool value) {
    _showTransactions= value;
    notifyListeners();
  }

  late TextEditingController missingNameontroller;
  late TextEditingController missingPhoneController;
  late GlobalKey<FormState> missingDetailsFormKey;

  void init() {
    missingDetailsFormKey = GlobalKey();
    missingPhoneController = TextEditingController();
    missingNameontroller = TextEditingController();
    mpesaModel = null;
    isPaymentComplete = false;
    isVerified = false;
    invoiceID = null;
  }

  Future<void> updateMissingDetails() async {
    if (missingDetailsFormKey.currentState!.validate()) {
      BuildContext? context = NavigationService.navigatorKey.currentContext;
      if (context == null) return;

      var order = context.read<CartController>().order;

      order = order!.copyWith(
        name: missingNameontroller.text.trim(),
        phoneNumber: missingPhoneController.text.trim().toLukhuNumber().trim(),
      );

      Navigator.pop(context, true);
      ShortMessages.showShortMessage(message: 'Details updated successfully!.');
    }
  }

  Map<String, Transaction> _shopTransaction = {};
  Map<String, Transaction> get shopTransaction => _shopTransaction;
  set shopTransaction(Map<String, Transaction> value) {
    _shopTransaction = value;
    notifyListeners();
  }

  Map<String, Map<String, Transaction>> similarTransactions = {};

  Future<bool> getTransactions({
  bool isRefreshMode = false,
  int limit = 10,
}) async {
  BuildContext? context = NavigationService.navigatorKey.currentContext;
  if (context == null) return false;
  
  try {
    final userId = context.read<UserRepository>().fbUser?.uid;
    final walletId = context
          .read<UserRepository>()
          .wallet
          ?.shopId;
    if (userId == null) return false;

    // Firestore query with optional limit
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    Query query = _firestore
        .collection('mytransactions')
        .where('walletId', isEqualTo: walletId);

    if (limit > 0) {
      query = query.limit(limit);
    }

    final querySnapshot = await query.get();

    if (querySnapshot.docs.isEmpty) return false;

    // Update the shopTransaction map
    shopTransaction = {
      for (var doc in querySnapshot.docs)
        doc.id: Transaction.fromJson(doc.data() as Map<String, dynamic>)
    };

    return true;
  } catch (e) {
    debugPrint('Error fetching transactions: $e');
    return false;
  }
}

  Transaction? _transaction;
  Transaction? get transaction => _transaction;
  set transaction(Transaction? value) {
    _transaction = value;
    notifyListeners();
  }

  /// It takes an index, and then it checks if the index is checked, if it is, it adds it to the
  /// selectedFilterTransactions list, if it isn't, it removes it from the list
  ///
  /// Args:
  ///   index (int): The index of the item in the list.
  void chooseOption(
    int index,
  ) {
    filterTransactions[index]['isChecked'] =
        !filterTransactions[index]['isChecked'];
    if (filterTransactions[index]['isChecked']) {
      selectedFilterTransactions.add(filterTransactions[index]['name']);
    } else {
      selectedFilterTransactions.remove(filterTransactions[index]['name']);
    }
    log('[SELECTED]=$selectedFilterTransactions');
    notifyListeners();
  }

  String? _invoiceID;
  String? get invoiceID => _invoiceID;
  set invoiceID(String? value) {
    _invoiceID = value;
    notifyListeners();
  }

  bool _isPaymentComplete = false;
  bool get isPaymentComplete => _isPaymentComplete;
  set isPaymentComplete(bool value) {
    _isPaymentComplete = value;
    notifyListeners();
  }

  bool _isVerified = false;
  bool get isVerified => _isVerified;
  set isVerified(bool value) {
    _isVerified = value;
    notifyListeners();
  }
}
