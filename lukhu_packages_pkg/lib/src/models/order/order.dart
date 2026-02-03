import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AccountType, DeliveryStatus, Timestamp;
import '../../utils/date/date_utils.dart';

import 'fields.dart';
import 'order_detail.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderModel with _$OrderModel, DateUtils {
  @JsonSerializable(explicitToJson: true)
  factory OrderModel(
      {String? id,
      @JsonKey(
          name: OrderFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: OrderFields.orderId) String? orderId,
      @JsonKey(name: OrderFields.userId) String? userId,
      @JsonKey(name: OrderFields.statusType) DeliveryStatus? statusType,
      @JsonKey(name: OrderFields.name) String? name,
      @JsonKey(name: OrderFields.description) String? description,
      @JsonKey(name: OrderFields.paymentType) AccountType? paymentType,
      @JsonKey(name: OrderFields.account) String? account,
      @JsonKey(name: OrderFields.shopId) String? shopId,
      @JsonKey(name: OrderFields.status) bool? status,
      @JsonKey(name: OrderFields.customerId) String? customerId,
      @JsonKey(name: OrderFields.price) double? price,
      @JsonKey(name: OrderFields.phoneNumber) String? phoneNumber,
      @JsonKey(name: OrderFields.items) List<OrderDetailModel>? items,
      }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  factory OrderModel.fromDs(String id, Map<String, dynamic> json) =>
      OrderModel.fromJson(json);

  factory OrderModel.empty() => OrderModel(
      createdAt: DateTime.now(),
      id: '',
      price: 0,
      userId: '',
      items: const [],
      account: '',
      statusType: DeliveryStatus.none,
      paymentType: AccountType.none,
      customerId: '',
      name: '',
      shopId: '',
      description: '',
      phoneNumber: '',
      status: false,
      orderId: '');
}
