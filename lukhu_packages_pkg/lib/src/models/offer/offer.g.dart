// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      id: json['id'] as String?,
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      userId: json['userId'] as String?,
      sellerId: json['sellerId'] as String?,
      productId: json['productId'] as String?,
      offerPrice: (json['offerPrice'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toDouble(),
      offerType:
          $enumDecodeNullable(_$DeliveryStatusEnumMap, json['offerType']),
      description: json['decription'] as String?,
      startTime: (json['startTime'] as num?)?.toInt(),
      endTime: (json['endTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'userId': instance.userId,
      'sellerId': instance.sellerId,
      'productId': instance.productId,
      'offerPrice': instance.offerPrice,
      'images': instance.images,
      'price': instance.price,
      'offerType': _$DeliveryStatusEnumMap[instance.offerType],
      'decription': instance.description,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
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
