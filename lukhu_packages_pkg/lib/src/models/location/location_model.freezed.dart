// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: LocationFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: LocationFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: LocationFields.locationType)
  String? get locationType => throw _privateConstructorUsedError;
  @JsonKey(name: LocationFields.buildingHouse)
  String? get buildingHouse => throw _privateConstructorUsedError;
  @JsonKey(name: LocationFields.location)
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: LocationFields.isSelected)
  bool? get isSelected => throw _privateConstructorUsedError;
  @JsonKey(name: LocationFields.phoneNumber)
  String? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: LocationFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: LocationFields.userId) String? userId,
      @JsonKey(name: LocationFields.locationType) String? locationType,
      @JsonKey(name: LocationFields.buildingHouse) String? buildingHouse,
      @JsonKey(name: LocationFields.location) String? location,
      @JsonKey(name: LocationFields.isSelected) bool? isSelected,
      @JsonKey(name: LocationFields.phoneNumber) String? phoneNumber});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? locationType = freezed,
    Object? buildingHouse = freezed,
    Object? location = freezed,
    Object? isSelected = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingHouse: freezed == buildingHouse
          ? _value.buildingHouse
          : buildingHouse // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: LocationFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: LocationFields.userId) String? userId,
      @JsonKey(name: LocationFields.locationType) String? locationType,
      @JsonKey(name: LocationFields.buildingHouse) String? buildingHouse,
      @JsonKey(name: LocationFields.location) String? location,
      @JsonKey(name: LocationFields.isSelected) bool? isSelected,
      @JsonKey(name: LocationFields.phoneNumber) String? phoneNumber});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? locationType = freezed,
    Object? buildingHouse = freezed,
    Object? location = freezed,
    Object? isSelected = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$LocationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingHouse: freezed == buildingHouse
          ? _value.buildingHouse
          : buildingHouse // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationModelImpl implements _LocationModel {
  _$LocationModelImpl(
      {this.id,
      @JsonKey(
          name: LocationFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: LocationFields.userId) this.userId,
      @JsonKey(name: LocationFields.locationType) this.locationType,
      @JsonKey(name: LocationFields.buildingHouse) this.buildingHouse,
      @JsonKey(name: LocationFields.location) this.location,
      @JsonKey(name: LocationFields.isSelected) this.isSelected,
      @JsonKey(name: LocationFields.phoneNumber) this.phoneNumber});

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(
      name: LocationFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: LocationFields.userId)
  final String? userId;
  @override
  @JsonKey(name: LocationFields.locationType)
  final String? locationType;
  @override
  @JsonKey(name: LocationFields.buildingHouse)
  final String? buildingHouse;
  @override
  @JsonKey(name: LocationFields.location)
  final String? location;
  @override
  @JsonKey(name: LocationFields.isSelected)
  final bool? isSelected;
  @override
  @JsonKey(name: LocationFields.phoneNumber)
  final String? phoneNumber;

  @override
  String toString() {
    return 'LocationModel(id: $id, createdAt: $createdAt, userId: $userId, locationType: $locationType, buildingHouse: $buildingHouse, location: $location, isSelected: $isSelected, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.locationType, locationType) ||
                other.locationType == locationType) &&
            (identical(other.buildingHouse, buildingHouse) ||
                other.buildingHouse == buildingHouse) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, userId,
      locationType, buildingHouse, location, isSelected, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  factory _LocationModel(
      {final String? id,
      @JsonKey(
          name: LocationFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(name: LocationFields.userId) final String? userId,
      @JsonKey(name: LocationFields.locationType) final String? locationType,
      @JsonKey(name: LocationFields.buildingHouse) final String? buildingHouse,
      @JsonKey(name: LocationFields.location) final String? location,
      @JsonKey(name: LocationFields.isSelected) final bool? isSelected,
      @JsonKey(name: LocationFields.phoneNumber)
      final String? phoneNumber}) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(
      name: LocationFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: LocationFields.userId)
  String? get userId;
  @override
  @JsonKey(name: LocationFields.locationType)
  String? get locationType;
  @override
  @JsonKey(name: LocationFields.buildingHouse)
  String? get buildingHouse;
  @override
  @JsonKey(name: LocationFields.location)
  String? get location;
  @override
  @JsonKey(name: LocationFields.isSelected)
  bool? get isSelected;
  @override
  @JsonKey(name: LocationFields.phoneNumber)
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
