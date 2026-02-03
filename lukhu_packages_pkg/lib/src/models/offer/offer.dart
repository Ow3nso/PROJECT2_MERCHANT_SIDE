import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DeliveryStatus, Timestamp;
import 'package:lukhu_packages_pkg/src/models/offer/fields.dart';

import '../../utils/date/date_utils.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

@freezed
class Offer with _$Offer, DateUtils {
  @JsonSerializable(explicitToJson: true)
  factory Offer({
    String?id ,
    @JsonKey(name: OfferFields.createdAt, fromJson: DateUtils.timestampToDateTime, toJson: DateUtils.dateTimeToTimestamp)
        DateTime? createdAt,
    @JsonKey(name: OfferFields.userId) String? userId,
    @JsonKey(name: OfferFields.sellerId) String? sellerId,
    @JsonKey(name: OfferFields.productId) String? productId,
    @JsonKey(name: OfferFields.offerPrice) double? offerPrice,
    @JsonKey(name: OfferFields.images) List<String>? images,
    @JsonKey(name: OfferFields.price) double? price,
    @JsonKey(name: OfferFields.offerType) DeliveryStatus? offerType,
    @JsonKey(name: OfferFields.decription) String? description,
    @JsonKey(name: OfferFields.startTime) int? startTime,
    @JsonKey(name: OfferFields.endTime) int? endTime,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  factory Offer.empty() => Offer(
        createdAt: DateTime.now(),
        productId: '',
        id: '',
        userId: '',
        sellerId: '',
        offerPrice: 0,
        price: 0,
        images: const [],
        offerType: DeliveryStatus.none,
        description: '',
        startTime: 0,
        endTime: 0,
      );

  factory Offer.fromDS(String id, Map<String, dynamic> json) =>
      Offer.fromJson(json);
}
