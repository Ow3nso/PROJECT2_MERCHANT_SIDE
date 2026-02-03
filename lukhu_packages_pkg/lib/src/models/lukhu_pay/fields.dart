class WalletFields {
  static const List<String> values = [
    id,
    name,
    balance,
    currency,
    createdAt,
    updatedAt,
    availableBalance,
    pendingBalance,
    userId,
  ];

  static const String id = '_id';
  static const String shopId = 'shopId';
  static const String name = 'name';
  static const String balance = 'balance';
  static const String currency = 'currency';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String availableBalance = 'availableBalance';
  static const String pendingBalance = 'pendingBalance';
  static const String userId = 'userId';
  static const String status = 'status';
  static const String message = 'message';
  static const String walletType = 'wallet_type';
  static const String walletData = 'data';
}

class TransactionFields {
  static const List<String> values = [
    id,
    amount,
    currency,
    type,
    status,
    createdAt,
    updatedAt,
    walletId,
    userId,
    description,
    reference,
    newBalance,
  ];

  static const String id = '_id';
  static const String amount = 'amount';
  static const String currency = 'currency';
  static const String transactionId = 'transactionId';
  static const String type = 'type';
  static const String status = 'status';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String walletId = 'walletId';
  static const String userId = 'userId';
  static const String description = 'description';
  static const String reference = 'reference';
  static const String newBalance = 'newBalance';
  static const String imageUrl = 'imageUrl';
  static const String metadata = 'metadata';
  static const String shopId = 'shopId';
}

class TransactionTypes {
  static const List<String> values = [
    topUps,
    withdrawal,
    pendingOders,
    shippingOders,
    deliveredOders,
    cancelledOders,
  ];
  static const String topUps = 'Top-Up';
  static const String withdrawal = 'Withdrawal';
  static const String pendingOders = 'Pending Orders';
  static const String shippingOders = 'Shipping Orders';
  static const String deliveredOders = 'Delivered Orders';
  static const String cancelledOders = 'Cancelled Orders';
  static const String payment = 'payment';
  static const String refund = 'refund';
  static const String fee = 'fee';
  static const String topup = 'topup';
  static const String payout = 'payout';
  static const String reversal = 'reversal';
  static const String dispute = 'dispute';
  static const String chargeback = 'chargeback';
  static const String adjustment = 'adjustment';
  static const String other = 'other';
}
