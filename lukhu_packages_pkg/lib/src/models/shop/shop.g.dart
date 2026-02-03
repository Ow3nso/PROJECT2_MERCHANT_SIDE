// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopImpl _$$ShopImplFromJson(Map<String, dynamic> json) => _$ShopImpl(
      id: json['id'] as String?,
      createdAt: DateUtils.timestampToDateTime(json['createdAt'] as Timestamp?),
      shopId: json['shopId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      coverImage: json['coverImage'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      userId: json['userId'] as String?,
      earnedBadges: (json['earnedBadges'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isVerified: json['isVerified'] as bool?,
      shopRating: (json['shopRating'] as num?)?.toDouble(),
      followers: (json['followers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      following: (json['following'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      views: (json['views'] as num?)?.toInt(),
      webDomain: json['webDomain'] as String?,
      requestFreeDomain: json['requestFreeDomain'] as bool?,
      socialMedia: json['socialMedia'] == null
          ? null
          : SocialMedia.fromJson(json['socialMedia'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ShopImplToJson(_$ShopImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': DateUtils.dateTimeToTimestamp(instance.createdAt),
      'shopId': instance.shopId,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'coverImage': instance.coverImage,
      'address': instance.address,
      'city': instance.city,
      'userId': instance.userId,
      'earnedBadges': instance.earnedBadges,
      'isVerified': instance.isVerified,
      'shopRating': instance.shopRating,
      'followers': instance.followers,
      'following': instance.following,
      'transactions': instance.transactions,
      'views': instance.views,
      'webDomain': instance.webDomain,
      'requestFreeDomain': instance.requestFreeDomain,
      'socialMedia': instance.socialMedia?.toJson(),
    };
