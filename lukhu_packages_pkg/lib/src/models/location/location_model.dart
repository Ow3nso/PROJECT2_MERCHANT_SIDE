import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;
import 'package:lukhu_packages_pkg/src/utils/date/date_utils.dart';

import 'fields.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel, DateUtils {
  @JsonSerializable(explicitToJson: true)
  factory LocationModel({
    String? id,
    @JsonKey(name: LocationFields.createdAt, fromJson: DateUtils.timestampToDateTime, toJson: DateUtils.dateTimeToTimestamp)
        DateTime? createdAt,
    @JsonKey(name: LocationFields.userId) String? userId,
    @JsonKey(name: LocationFields.locationType) String? locationType,
    @JsonKey(name: LocationFields.buildingHouse) String? buildingHouse,
    @JsonKey(name: LocationFields.location) String? location,
    @JsonKey(name: LocationFields.isSelected) bool? isSelected,
    @JsonKey(name: LocationFields.phoneNumber) String? phoneNumber,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  factory LocationModel.fromDS(Map<String, Map<String, dynamic>> json) =>
      LocationModel.fromJson(json);

  factory LocationModel.empty() => LocationModel(
        id: '',
        createdAt: DateTime.now(),
        location: '',
        locationType: '',
        userId: '',
        buildingHouse: '',
        isSelected: false,
        phoneNumber: '',
      );
}
