import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/date/date_utils.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import 'fields.dart';
import '../user/social_media.dart';

part 'shop.freezed.dart';
part 'shop.g.dart';

@freezed
class Shop with _$Shop, DateUtils {
  @JsonSerializable(explicitToJson: true)
  factory Shop({
    String? id,
    @JsonKey(
        name: ShopFields.createdAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(name: ShopFields.shopId) String? shopId,
    @JsonKey(name: ShopFields.name) String? name,
    @JsonKey(name: ShopFields.description) String? description,
    @JsonKey(name: ShopFields.imageUrl) String? imageUrl,
    @JsonKey(name: ShopFields.coverImage) String? coverImage,
    @JsonKey(name: ShopFields.address) String? address,
    @JsonKey(name: ShopFields.city) String? city,
    @JsonKey(name: ShopFields.userId) String? userId,
    @JsonKey(name: ShopFields.earnedBadges) List<String>? earnedBadges,
    @JsonKey(name: ShopFields.isVerified) bool? isVerified,
    @JsonKey(name: ShopFields.shopRating) double? shopRating,
    @JsonKey(name: ShopFields.followers) List<String>? followers,
    @JsonKey(name: ShopFields.following) List<String>? following,
    @JsonKey(name: ShopFields.transactions) List<String>? transactions,
    @JsonKey(name: ShopFields.views) int? views,
    @JsonKey(name: ShopFields.webDomain) String? webDomain,
    @JsonKey(name: ShopFields.requestFreeDomain) bool? requestFreeDomain,
    @JsonKey(name: ShopFields.socialMedia) SocialMedia? socialMedia,
  }) = _Shop;

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);
  factory Shop.fromDS(String id, Map<String, dynamic> json) =>
      Shop.fromJson(json);

  factory Shop.empty() => Shop(
        id: '',
        createdAt: DateTime.now(),
        shopId: '',
        name: '',
        description: '',
        imageUrl: '',
        coverImage: '',
        address: '',
        city: '',
        requestFreeDomain: false,
        userId: '',
        earnedBadges: [],
        isVerified: false,
        shopRating: 0.0,
        followers: [],
        following: [],
        transactions: [],
        socialMedia: SocialMedia.empty(),
        views: 0,
        webDomain: '',
      );
}
