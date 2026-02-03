// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceDetails _$DeviceDetailsFromJson(Map<String, dynamic> json) {
  return _DeviceDetails.fromJson(json);
}

/// @nodoc
mixin _$DeviceDetails {
  @JsonKey(name: DeviceDetailsFields.device)
  String? get device => throw _privateConstructorUsedError;
  @JsonKey(name: DeviceDetailsFields.model)
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: DeviceDetailsFields.osVersion)
  String? get osVersion => throw _privateConstructorUsedError;
  @JsonKey(name: DeviceDetailsFields.platform)
  String? get platform => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceDetailsCopyWith<DeviceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDetailsCopyWith<$Res> {
  factory $DeviceDetailsCopyWith(
          DeviceDetails value, $Res Function(DeviceDetails) then) =
      _$DeviceDetailsCopyWithImpl<$Res, DeviceDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: DeviceDetailsFields.device) String? device,
      @JsonKey(name: DeviceDetailsFields.model) String? model,
      @JsonKey(name: DeviceDetailsFields.osVersion) String? osVersion,
      @JsonKey(name: DeviceDetailsFields.platform) String? platform});
}

/// @nodoc
class _$DeviceDetailsCopyWithImpl<$Res, $Val extends DeviceDetails>
    implements $DeviceDetailsCopyWith<$Res> {
  _$DeviceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
    Object? model = freezed,
    Object? osVersion = freezed,
    Object? platform = freezed,
  }) {
    return _then(_value.copyWith(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceDetailsImplCopyWith<$Res>
    implements $DeviceDetailsCopyWith<$Res> {
  factory _$$DeviceDetailsImplCopyWith(
          _$DeviceDetailsImpl value, $Res Function(_$DeviceDetailsImpl) then) =
      __$$DeviceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: DeviceDetailsFields.device) String? device,
      @JsonKey(name: DeviceDetailsFields.model) String? model,
      @JsonKey(name: DeviceDetailsFields.osVersion) String? osVersion,
      @JsonKey(name: DeviceDetailsFields.platform) String? platform});
}

/// @nodoc
class __$$DeviceDetailsImplCopyWithImpl<$Res>
    extends _$DeviceDetailsCopyWithImpl<$Res, _$DeviceDetailsImpl>
    implements _$$DeviceDetailsImplCopyWith<$Res> {
  __$$DeviceDetailsImplCopyWithImpl(
      _$DeviceDetailsImpl _value, $Res Function(_$DeviceDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
    Object? model = freezed,
    Object? osVersion = freezed,
    Object? platform = freezed,
  }) {
    return _then(_$DeviceDetailsImpl(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: freezed == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceDetailsImpl implements _DeviceDetails {
  _$DeviceDetailsImpl(
      {@JsonKey(name: DeviceDetailsFields.device) this.device,
      @JsonKey(name: DeviceDetailsFields.model) this.model,
      @JsonKey(name: DeviceDetailsFields.osVersion) this.osVersion,
      @JsonKey(name: DeviceDetailsFields.platform) this.platform});

  factory _$DeviceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceDetailsImplFromJson(json);

  @override
  @JsonKey(name: DeviceDetailsFields.device)
  final String? device;
  @override
  @JsonKey(name: DeviceDetailsFields.model)
  final String? model;
  @override
  @JsonKey(name: DeviceDetailsFields.osVersion)
  final String? osVersion;
  @override
  @JsonKey(name: DeviceDetailsFields.platform)
  final String? platform;

  @override
  String toString() {
    return 'DeviceDetails(device: $device, model: $model, osVersion: $osVersion, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDetailsImpl &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, device, model, osVersion, platform);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDetailsImplCopyWith<_$DeviceDetailsImpl> get copyWith =>
      __$$DeviceDetailsImplCopyWithImpl<_$DeviceDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceDetailsImplToJson(
      this,
    );
  }
}

abstract class _DeviceDetails implements DeviceDetails {
  factory _DeviceDetails(
      {@JsonKey(name: DeviceDetailsFields.device) final String? device,
      @JsonKey(name: DeviceDetailsFields.model) final String? model,
      @JsonKey(name: DeviceDetailsFields.osVersion) final String? osVersion,
      @JsonKey(name: DeviceDetailsFields.platform)
      final String? platform}) = _$DeviceDetailsImpl;

  factory _DeviceDetails.fromJson(Map<String, dynamic> json) =
      _$DeviceDetailsImpl.fromJson;

  @override
  @JsonKey(name: DeviceDetailsFields.device)
  String? get device;
  @override
  @JsonKey(name: DeviceDetailsFields.model)
  String? get model;
  @override
  @JsonKey(name: DeviceDetailsFields.osVersion)
  String? get osVersion;
  @override
  @JsonKey(name: DeviceDetailsFields.platform)
  String? get platform;
  @override
  @JsonKey(ignore: true)
  _$$DeviceDetailsImplCopyWith<_$DeviceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
