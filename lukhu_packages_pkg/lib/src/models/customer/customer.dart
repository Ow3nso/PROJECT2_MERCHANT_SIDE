import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/src/models/customer/fields.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Gender, Timestamp;

import '../../utils/date/date_utils.dart';
import '../location/location_model.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  @JsonSerializable(explicitToJson: true)
  factory Customer({
    @JsonKey(
      name: CustomerFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp,
    )
    DateTime? createdAt,
    @JsonKey(name: CustomerFields.userId) String? userId,
    @JsonKey(name: CustomerFields.shopId) String? shopId,
    @JsonKey(name: CustomerFields.customerId) String? customerId,
    @JsonKey(name: CustomerFields.name) String? name,
    @JsonKey(name: CustomerFields.address) LocationModel? address,
    @JsonKey(name: CustomerFields.userName) String? userName,
    @JsonKey(name: CustomerFields.gender) Gender? gender,
    @JsonKey(name: CustomerFields.dob) DateTime? dob,
    @JsonKey(name: CustomerFields.description) String? description,
    @JsonKey(name: CustomerFields.updatedAt) DateTime? updatedAt,
    @JsonKey(name: CustomerFields.phoneNumber) String? phoneNumber,
    @JsonKey(name: CustomerFields.status) bool? status,
    
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  factory Customer.empty() => Customer(
        createdAt: DateTime.now(),
        customerId: "",
        name: "",
        address:  LocationModel.empty(),
        shopId: "",
        userName: "",
        gender: Gender.none,
        dob: DateTime.now(),
        description: "",
        updatedAt: DateTime.now(),
        phoneNumber: "",
        status: false,
      );

  factory Customer.fromDS(String id, Map<String, dynamic> json) =>
      Customer.fromJson(json);
}
