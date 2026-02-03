// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopCollectionImpl _$$ShopCollectionImplFromJson(Map<String, dynamic> json) =>
    _$ShopCollectionImpl(
      id: json['id'] as String?,
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      shopId: json['shopId'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
      docId: json['docId'] as String?,
      productIds: (json['productIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isPublic: json['isPublic'] as bool?,
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      views: (json['views'] as num?)?.toInt(),
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$ShopCollectionImplToJson(
        _$ShopCollectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'shopId': instance.shopId,
      'name': instance.name,
      'userId': instance.userId,
      'docId': instance.docId,
      'productIds': instance.productIds,
      'isPublic': instance.isPublic,
      'updatedAt': instance.updatedAt,
      'views': instance.views,
      'link': instance.link,
    };
