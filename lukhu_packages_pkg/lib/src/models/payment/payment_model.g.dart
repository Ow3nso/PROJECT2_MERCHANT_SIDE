// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: json['id'] as String?,
      shopId: json['shopId'] as String?,
      userId: json['userId'] as String?,
      account: json['account'] as String?,
      type: $enumDecodeNullable(_$AccountTypeEnumMap, json['type']),
      name: json['name'] as String?,
      isChecked: json['isChecked'] as bool?,
      expiryDate: json['expiryDate'] as String?,
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      cvv: json['cvv'] as String?,
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopId': instance.shopId,
      'userId': instance.userId,
      'account': instance.account,
      'type': _$AccountTypeEnumMap[instance.type],
      'name': instance.name,
      'isChecked': instance.isChecked,
      'expiryDate': instance.expiryDate,
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'cvv': instance.cvv,
    };

const _$AccountTypeEnumMap = {
  AccountType.mpesa: 'mpesa',
  AccountType.visa: 'visa',
  AccountType.debit: 'debit',
  AccountType.mastercard: 'mastercard',
  AccountType.none: 'none',
  AccountType.lukhu: 'lukhu',
  AccountType.card: 'card',
};
