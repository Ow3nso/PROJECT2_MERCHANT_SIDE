import '../../../utils/date/date_utils.dart';
import '../index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  @JsonSerializable(explicitToJson: true)
  factory Transaction({
    // @JsonKey(
    //     name: TransactionFields.createdAt,
    //     fromJson: DateUtils.timestampToDateTime,
    //     toJson: DateUtils.dateTimeToTimestamp)
    // DateTime? createdAt,
    @JsonKey(name: TransactionFields.createdAt) String? createdAt,
    @JsonKey(name: TransactionFields.id) String? id,
    @JsonKey(name: TransactionFields.amount, fromJson: _stringToDouble) double? amount,
    @JsonKey(name: TransactionFields.currency) String? currency,
    @JsonKey(name: TransactionFields.description) String? description,
    @JsonKey(name: TransactionFields.status) String? status,
    @JsonKey(name: TransactionFields.type) String? type,
    @JsonKey(name: TransactionFields.updatedAt) int? updatedAt,
    @JsonKey(name: TransactionFields.walletId) String? walletId,
    @JsonKey(name: TransactionFields.transactionId) String? transactionId,
    @JsonKey(name: TransactionFields.userId) String? userId,
    @JsonKey(name: TransactionFields.metadata) Map<String, dynamic>? metadata,
    @JsonKey(name: TransactionFields.imageUrl) String? imageUrl,
    @JsonKey(name: TransactionFields.shopId) String? shopId,
    @JsonKey(name: TransactionFields.newBalance) String? newBalance,
    @JsonKey(name: TransactionFields.reference, fromJson: _stringToDouble) double? reference,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
  factory Transaction.fromDS(String id, Map<String, dynamic> json) => Transaction.fromJson(json);

  factory Transaction.empty() => Transaction(
    createdAt: '',
    id: '',
    amount: 0,
    currency: 'KES',
    description: '',
    status: '',
    type: '',
    updatedAt: DateTime.now().millisecondsSinceEpoch,
    walletId: '',
    userId: '',
    imageUrl: null,
    transactionId: '',
    shopId: '',
    newBalance: '0',
    reference: 0,
    metadata: {},
  );
}

double? _stringToDouble(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is String) {
    return double.tryParse(value);
  } else if (value is num) {
    return value.toDouble();
  } else {
    throw Exception('Invalid type for double: ${value.runtimeType}');
  }
}
