


// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fields.dart';

part 'device_details.freezed.dart';
part 'device_details.g.dart';


@freezed
class DeviceDetails with _$DeviceDetails {
  factory DeviceDetails({
    @JsonKey(name: DeviceDetailsFields.device) String? device,
    @JsonKey(name: DeviceDetailsFields.model) String? model,
    @JsonKey(name: DeviceDetailsFields.osVersion) String? osVersion,
    @JsonKey(name: DeviceDetailsFields.platform) String? platform,
  }) = _DeviceDetails;
  factory DeviceDetails.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailsFromJson(json);
}
