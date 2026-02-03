import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import '../../../utils/date/date_utils.dart';
import '../fields.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletModel with _$WalletModel {
  @JsonSerializable(explicitToJson: true)
  factory WalletModel({
    @JsonKey(name: WalletFields.id) String? id,
    @JsonKey(name: WalletFields.currency) String? currency,
    @JsonKey(name: WalletFields.walletType) String? walletType,
    @JsonKey(
        name: WalletFields.createdAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? createdAt,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}
