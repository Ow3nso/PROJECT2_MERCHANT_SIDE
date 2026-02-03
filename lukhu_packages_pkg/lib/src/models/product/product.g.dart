// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      productId: json['productId'] as String?,
      sellerId: json['sellerId'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      category: json['category'] as String?,
      subCategory: json['subCategory'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isAvailable: json['isAvailable'] as bool?,
      isFeatured: json['isFeatured'] as bool?,
      isPopular: json['isPopular'] as bool?,
      isOnSale: json['isOnSale'] as bool?,
      isOnDiscount: json['isOnDiscount'] as bool?,
      isOnNew: json['isOnNew'] as bool?,
      isOnBestSeller: json['isOnBestSeller'] as bool?,
      isOnTopRated: json['isOnTopRated'] as bool?,
      isOnFeatured: json['isOnFeatured'] as bool?,
      isOnPopular: json['isOnPopular'] as bool?,
      isOnTrending: json['isOnTrending'] as bool?,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      views:
          (json['views'] as List<dynamic>?)?.map((e) => e as String).toList(),
      shares: (json['shares'] as num?)?.toInt(),
      isVerified: json['isVerified'] as bool?,
      isApproved: json['isApproved'] as bool?,
      isSoldOut: json['isSoldOut'] as bool?,
      stock: (json['stock'] as num?)?.toInt(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      discountStartDate: (json['discountStartDate'] as num?)?.toInt(),
      discountEndDate: (json['discountEndDate'] as num?)?.toInt(),
      availableColors: (json['availableColors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      availableSizes: (json['availableSizes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      shopId: json['shopId'] as String?,
      mediaPath: json['mediaPath'] as String?,
      lastUpdatedAt: (json['lastUpdatedAt'] as num?)?.toInt(),
      hasBeenIndexed: json['hasBeenIndexed'] as bool?,
      heroImage: json['heroImage'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'productId': instance.productId,
      'sellerId': instance.sellerId,
      'label': instance.label,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'category': instance.category,
      'subCategory': instance.subCategory,
      'images': instance.images,
      'isAvailable': instance.isAvailable,
      'isFeatured': instance.isFeatured,
      'isPopular': instance.isPopular,
      'isOnSale': instance.isOnSale,
      'isOnDiscount': instance.isOnDiscount,
      'isOnNew': instance.isOnNew,
      'isOnBestSeller': instance.isOnBestSeller,
      'isOnTopRated': instance.isOnTopRated,
      'isOnFeatured': instance.isOnFeatured,
      'isOnPopular': instance.isOnPopular,
      'isOnTrending': instance.isOnTrending,
      'likes': instance.likes,
      'views': instance.views,
      'shares': instance.shares,
      'isVerified': instance.isVerified,
      'isApproved': instance.isApproved,
      'isSoldOut': instance.isSoldOut,
      'stock': instance.stock,
      'discountPercentage': instance.discountPercentage,
      'discountAmount': instance.discountAmount,
      'discountStartDate': instance.discountStartDate,
      'discountEndDate': instance.discountEndDate,
      'availableColors': instance.availableColors,
      'availableSizes': instance.availableSizes,
      'shopId': instance.shopId,
      'mediaPath': instance.mediaPath,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'hasBeenIndexed': instance.hasBeenIndexed,
      'heroImage': instance.heroImage,
    };
