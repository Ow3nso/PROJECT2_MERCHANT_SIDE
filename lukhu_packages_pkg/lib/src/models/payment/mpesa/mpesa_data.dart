import 'package:freezed_annotation/freezed_annotation.dart';
import 'fields.dart';
import 'invoice_model.dart';

part 'mpesa_data.freezed.dart';
part 'mpesa_data.g.dart';

@freezed
class MpesaData with _$MpesaData {
  @JsonSerializable(explicitToJson: true)
  factory MpesaData({
    @JsonKey(name: MpesaFields.invoice) InvoiceModel? invoice,
  }) = _MpesaData;

  factory MpesaData.fromJson(Map<String, dynamic> json) =>
      _$MpesaDataFromJson(json);

  factory MpesaData.empty() => MpesaData(invoice: InvoiceModel.empty());
}
