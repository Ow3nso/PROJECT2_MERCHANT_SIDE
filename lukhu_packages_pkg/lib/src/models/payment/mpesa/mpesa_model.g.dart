// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpesa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MpesaModelImpl _$$MpesaModelImplFromJson(Map<String, dynamic> json) =>
    _$MpesaModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MpesaData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MpesaModelImplToJson(_$MpesaModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
