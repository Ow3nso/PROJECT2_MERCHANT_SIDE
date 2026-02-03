import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import '../../../utils/date/date_utils.dart';

import 'fields.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@freezed
class InvoiceModel with _$InvoiceModel {
  @JsonSerializable(explicitToJson: true)
  factory InvoiceModel({
    @JsonKey(name: MpesaFields.id) String? id,
    @JsonKey(name: MpesaFields.shopId) String? shopId,
    @JsonKey(name: MpesaFields.orderId) String? orderId,
    @JsonKey(name: MpesaFields.invoiceId) String? invoiceId,
    @JsonKey(name: MpesaFields.state) String? state,
    @JsonKey(
        name: MpesaFields.createdAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(name: MpesaFields.provider) String? provider,
    @JsonKey(name: MpesaFields.netAmount, defaultValue: 0) double? netAmount,
    @JsonKey(name: MpesaFields.amount, defaultValue: 0) double? amount,
    @JsonKey(name: MpesaFields.currency, defaultValue: 'KES') String? currency,
    @JsonKey(name: MpesaFields.mpesaReference) String? mpesaReference,
    @JsonKey(name: MpesaFields.failedCode) String? failedCode,
    @JsonKey(
      name: MpesaFields.failedReason,
    )
    String? failedReason,
    @JsonKey(name: MpesaFields.updatedAt) int? updatedAt,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);

  factory InvoiceModel.empty() => InvoiceModel(
        id: '',
        shopId: '',
        orderId: '',
        invoiceId: '',
        createdAt: DateTime.now(),
        state: '',
        provider: '',
        netAmount: 0,
        amount: 0,
        currency: 'KES',
        mpesaReference: '',
        failedCode: '',
        failedReason: '',
        updatedAt: DateTime.now().millisecondsSinceEpoch,
      );
}
