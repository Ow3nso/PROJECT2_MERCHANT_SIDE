import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import '../../utils/date/date_utils.dart';
import 'fields.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review, DateUtils {
  @JsonSerializable(explicitToJson: true)
  factory Review({
    String? id,
    @JsonKey(name: ReviewFields.createdAt, fromJson: DateUtils.timestampToDateTime, toJson: DateUtils.dateTimeToTimestamp)
        DateTime? createdAt,
    @JsonKey(name: ReviewFields.imageUrl) String? imageUrl,
    @JsonKey(name: ReviewFields.reviewRating) double? reviewRating,
    @JsonKey(name: ReviewFields.name) String? name,
    @JsonKey(name: ReviewFields.description) String? description,
    @JsonKey(name: ReviewFields.shopId) String? shopId,
    @JsonKey(name: ReviewFields.userId) String? userId,
    @JsonKey(name: ReviewFields.productId) String? productId,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  factory Review.fromDS(String id, Map<String, dynamic> json) =>
      Review.fromJson(json);

  factory Review.empty() => Review(
        createdAt: DateTime.now(),
        imageUrl: '',
        reviewRating: 0,
        name: '',
        description: '',
        shopId: '',
        productId: '',
        userId: '',
      );
}
