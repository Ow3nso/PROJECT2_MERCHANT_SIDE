// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String?,
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      orderId: json['orderId'] as String?,
      userId: json['userId'] as String?,
      statusType:
          $enumDecodeNullable(_$DeliveryStatusEnumMap, json['statusType']),
      name: json['name'] as String?,
      description: json['description'] as String?,
      paymentType:
          $enumDecodeNullable(_$AccountTypeEnumMap, json['paymentType']),
      account: json['account'] as String?,
      shopId: json['shopId'] as String?,
      status: json['status'] as bool?,
      customerId: json['customerId'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      phoneNumber: json['phoneNumber'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'orderId': instance.orderId,
      'userId': instance.userId,
      'statusType': _$DeliveryStatusEnumMap[instance.statusType],
      'name': instance.name,
      'description': instance.description,
      'paymentType': _$AccountTypeEnumMap[instance.paymentType],
      'account': instance.account,
      'shopId': instance.shopId,
      'status': instance.status,
      'customerId': instance.customerId,
      'price': instance.price,
      'phoneNumber': instance.phoneNumber,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.pending: 'pending',
  DeliveryStatus.shipping: 'shipping',
  DeliveryStatus.delivered: 'delivered',
  DeliveryStatus.cancelled: 'cancelled',
  DeliveryStatus.none: 'none',
  DeliveryStatus.soon: 'soon',
  DeliveryStatus.approved: 'approved',
  DeliveryStatus.marketPlace: 'marketPlace',
  DeliveryStatus.website: 'website',
  DeliveryStatus.pos: 'pos',
  DeliveryStatus.deliveryOnly: 'deliveryOnly',
  DeliveryStatus.returned: 'returned',
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
