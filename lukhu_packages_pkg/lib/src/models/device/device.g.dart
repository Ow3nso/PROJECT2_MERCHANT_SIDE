// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      id: json['id'] as String?,
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      expired: json['expired'] as bool?,
      uninstalled: json['uninstalled'] as bool?,
      lastUpdatedAt: (json['lastUpdatedAt'] as num?)?.toInt(),
      deviceInfo: json['deviceInfo'] == null
          ? null
          : DeviceDetails.fromJson(json['deviceInfo'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'expired': instance.expired,
      'uninstalled': instance.uninstalled,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'deviceInfo': instance.deviceInfo?.toJson(),
      'token': instance.token,
    };
