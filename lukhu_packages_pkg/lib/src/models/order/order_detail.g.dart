// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailModelImpl _$$OrderDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailModelImpl(
      productId: json['productId'] as String?,
      sellerId: json['sellerId'] as String?,
      size: json['size'] as String?,
      color: json['color'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      orderImages: (json['orderImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      updatedAt: DateUtils.timestampToDateTime(json['updatedAt'] as Timestamp?),
    );

Map<String, dynamic> _$$OrderDetailModelImplToJson(
        _$OrderDetailModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'sellerId': instance.sellerId,
      'size': instance.size,
      'color': instance.color,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'orderImages': instance.orderImages,
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': DateUtils.dateTimeToTimestamp(instance.updatedAt),
    };
