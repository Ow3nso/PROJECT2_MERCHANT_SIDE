import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AccountType, Timestamp;
import 'package:lukhu_packages_pkg/src/models/payment/fields.dart';

import '../../utils/date/date_utils.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel, DateUtils {
  @JsonSerializable(explicitToJson: true)
  factory PaymentModel({
    String? id,
    @JsonKey(name: PaymentFields.shopId) String? shopId,
    @JsonKey(name: PaymentFields.userId) String? userId,
    @JsonKey(name: PaymentFields.account) String? account,
    @JsonKey(name: PaymentFields.type) AccountType? type,
    @JsonKey(name: PaymentFields.name) String? name,
    @JsonKey(name: PaymentFields.isChecked) bool? isChecked,
    @JsonKey(name: PaymentFields.expiryDate) String? expiryDate,
    @JsonKey(
        name: PaymentFields.createdAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(name: PaymentFields.updatedAt) DateTime? updatedAt,
    @JsonKey(name: PaymentFields.cvv) String? cvv,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  factory PaymentModel.empty() => PaymentModel(
        id: "",
        shopId: "",
        userId: "",
        account: "",
        name: "",
        type: AccountType.none,
        expiryDate: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isChecked: false,
        cvv: "",
      );
}
