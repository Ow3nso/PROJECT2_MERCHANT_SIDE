import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utils/date/date_utils.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import 'fields.dart';

part 'order_detail.freezed.dart';
part 'order_detail.g.dart';

@freezed
class OrderDetailModel with _$OrderDetailModel {
  @JsonSerializable(explicitToJson: true)
  factory OrderDetailModel({
    @JsonKey(name: OrderFields.productId) String? productId,
    @JsonKey(name: OrderFields.sellerId) String? sellerId,
    @JsonKey(name: OrderFields.size) String? size,
    @JsonKey(name: OrderFields.color) String? color,
    @JsonKey(name: OrderFields.quantity) int? quantity,
    @JsonKey(name: OrderFields.amount) double? amount,
    @JsonKey(name: OrderFields.orderImages) List<String>? orderImages,
    @JsonKey(
        name: OrderFields.createdAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? createdAt,
    @JsonKey(
        name: OrderFields.updatedAt,
        fromJson: DateUtils.timestampToDateTime,
        toJson: DateUtils.dateTimeToTimestamp)
    DateTime? updatedAt,
  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);
}
