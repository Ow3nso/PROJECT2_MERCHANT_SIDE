import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import '../../utils/date/date_utils.dart';
import 'device_details.dart';
import 'fields.dart';

part 'device.freezed.dart';
part 'device.g.dart';
@freezed
class Device with _$Device, DateUtils {
  @JsonSerializable(explicitToJson: true)
  factory Device({
    String? id,
    @JsonKey(name: DeviceFields.createdAt, fromJson: DateUtils.timestampToDateTime, toJson: DateUtils.dateTimeToTimestamp)
        DateTime? createdAt,
    @JsonKey(name: DeviceFields.expired) bool? expired,
    @JsonKey(name: DeviceFields.uninstalled) bool? uninstalled,
    @JsonKey(name: DeviceFields.lastUpdatedAt) int? lastUpdatedAt,
    @JsonKey(name: DeviceFields.deviceInfo) DeviceDetails? deviceInfo,
    @JsonKey(name: DeviceFields.token) String? token,
  }) = _Device;
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  factory Device.fromDS(String id, Map<String, dynamic> json) =>
      Device.fromJson(json);
}
