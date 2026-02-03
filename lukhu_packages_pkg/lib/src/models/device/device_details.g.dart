// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceDetailsImpl _$$DeviceDetailsImplFromJson(Map<String, dynamic> json) =>
    _$DeviceDetailsImpl(
      device: json['device'] as String?,
      model: json['model'] as String?,
      osVersion: json['os_version'] as String?,
      platform: json['platform'] as String?,
    );

Map<String, dynamic> _$$DeviceDetailsImplToJson(_$DeviceDetailsImpl instance) =>
    <String, dynamic>{
      'device': instance.device,
      'model': instance.model,
      'os_version': instance.osVersion,
      'platform': instance.platform,
    };
