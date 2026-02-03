// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpesa_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MpesaDataImpl _$$MpesaDataImplFromJson(Map<String, dynamic> json) =>
    _$MpesaDataImpl(
      invoice: json['invoice'] == null
          ? null
          : InvoiceModel.fromJson(json['invoice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MpesaDataImplToJson(_$MpesaDataImpl instance) =>
    <String, dynamic>{
      'invoice': instance.invoice?.toJson(),
    };
