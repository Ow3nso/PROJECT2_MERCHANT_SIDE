// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      userId: json['userId'] as String?,
      shopId: json['shopId'] as String?,
      customerId: json['customerId'] as String?,
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : LocationModel.fromJson(json['address'] as Map<String, dynamic>),
      userName: json['userName'] as String?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      description: json['description'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'userId': instance.userId,
      'shopId': instance.shopId,
      'customerId': instance.customerId,
      'name': instance.name,
      'address': instance.address?.toJson(),
      'userName': instance.userName,
      'gender': _$GenderEnumMap[instance.gender],
      'dob': instance.dob?.toIso8601String(),
      'description': instance.description,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.other: 'other',
  Gender.none: 'none',
};
