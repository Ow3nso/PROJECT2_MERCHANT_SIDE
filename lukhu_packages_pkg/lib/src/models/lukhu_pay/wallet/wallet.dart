import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import '../../../utils/date/date_utils.dart';
import '../index.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class Wallet with _$Wallet {
  @JsonSerializable(explicitToJson: true)
  factory Wallet({
    @JsonKey(
        name: WalletFields.createdAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(name: WalletFields.id) String? id,
    @JsonKey(name: WalletFields.balance) double? balance,
    @JsonKey(name: WalletFields.updatedAt) int? updatedAt,
    @JsonKey(name: WalletFields.availableBalance) double? availableBalance,
    @JsonKey(name: WalletFields.pendingBalance) double? pendingBalance,
    @JsonKey(name: WalletFields.currency) String? currency,
    @JsonKey(name: WalletFields.name) String? name,
    @JsonKey(name: WalletFields.shopId) String? shopId,
    @JsonKey(name: WalletFields.userId) String? userId,
  }) = _Wallet;
  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
  factory Wallet.fromDS(String id, Map<String, dynamic> json) =>
      Wallet.fromJson(json);

  factory Wallet.empty() => Wallet(
        createdAt: DateTime.now(),
        id: '',
        balance: 0,
        updatedAt: null,
        availableBalance: 0,
        pendingBalance: 0,
        currency: 'KES',
        name: '',
        shopId: '',
        userId: '',
      );
}
