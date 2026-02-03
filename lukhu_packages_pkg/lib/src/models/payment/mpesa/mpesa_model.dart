import 'package:freezed_annotation/freezed_annotation.dart';
import 'fields.dart';
import 'mpesa_data.dart';

part 'mpesa_model.freezed.dart';
part 'mpesa_model.g.dart';

@freezed
class MpesaModel with _$MpesaModel {
  @JsonSerializable(explicitToJson: true)
  factory MpesaModel({
    @JsonKey(name: MpesaFields.status) String? status,
    @JsonKey(name: MpesaFields.message) String? message,
    @JsonKey(name: MpesaFields.data) MpesaData? data,
  }) = _MpesaModel;

  factory MpesaModel.fromJson(Map<String, dynamic> json) =>
      _$MpesaModelFromJson(json);

  factory MpesaModel.empty() => MpesaModel(
        status: '',
        message: '',
        data: MpesaData.empty(),
      );
}
