// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  @JsonKey(
      name: CustomerFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.customerId)
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.address)
  LocationModel? get address => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.userName)
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.gender)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.dob)
  DateTime? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.updatedAt)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.phoneNumber)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: CustomerFields.status)
  bool? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {@JsonKey(
          name: CustomerFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
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
      @JsonKey(name: CustomerFields.status) bool? status});

  $LocationModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? shopId = freezed,
    Object? customerId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? userName = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? description = freezed,
    Object? updatedAt = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: CustomerFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
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
      @JsonKey(name: CustomerFields.status) bool? status});

  @override
  $LocationModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? shopId = freezed,
    Object? customerId = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? userName = freezed,
    Object? gender = freezed,
    Object? dob = freezed,
    Object? description = freezed,
    Object? updatedAt = freezed,
    Object? phoneNumber = freezed,
    Object? status = freezed,
  }) {
    return _then(_$CustomerImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dob: freezed == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CustomerImpl implements _Customer {
  _$CustomerImpl(
      {@JsonKey(
          name: CustomerFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: CustomerFields.userId) this.userId,
      @JsonKey(name: CustomerFields.shopId) this.shopId,
      @JsonKey(name: CustomerFields.customerId) this.customerId,
      @JsonKey(name: CustomerFields.name) this.name,
      @JsonKey(name: CustomerFields.address) this.address,
      @JsonKey(name: CustomerFields.userName) this.userName,
      @JsonKey(name: CustomerFields.gender) this.gender,
      @JsonKey(name: CustomerFields.dob) this.dob,
      @JsonKey(name: CustomerFields.description) this.description,
      @JsonKey(name: CustomerFields.updatedAt) this.updatedAt,
      @JsonKey(name: CustomerFields.phoneNumber) this.phoneNumber,
      @JsonKey(name: CustomerFields.status) this.status});

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  @JsonKey(
      name: CustomerFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: CustomerFields.userId)
  final String? userId;
  @override
  @JsonKey(name: CustomerFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: CustomerFields.customerId)
  final String? customerId;
  @override
  @JsonKey(name: CustomerFields.name)
  final String? name;
  @override
  @JsonKey(name: CustomerFields.address)
  final LocationModel? address;
  @override
  @JsonKey(name: CustomerFields.userName)
  final String? userName;
  @override
  @JsonKey(name: CustomerFields.gender)
  final Gender? gender;
  @override
  @JsonKey(name: CustomerFields.dob)
  final DateTime? dob;
  @override
  @JsonKey(name: CustomerFields.description)
  final String? description;
  @override
  @JsonKey(name: CustomerFields.updatedAt)
  final DateTime? updatedAt;
  @override
  @JsonKey(name: CustomerFields.phoneNumber)
  final String? phoneNumber;
  @override
  @JsonKey(name: CustomerFields.status)
  final bool? status;

  @override
  String toString() {
    return 'Customer(createdAt: $createdAt, userId: $userId, shopId: $shopId, customerId: $customerId, name: $name, address: $address, userName: $userName, gender: $gender, dob: $dob, description: $description, updatedAt: $updatedAt, phoneNumber: $phoneNumber, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      userId,
      shopId,
      customerId,
      name,
      address,
      userName,
      gender,
      dob,
      description,
      updatedAt,
      phoneNumber,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer implements Customer {
  factory _Customer(
          {@JsonKey(
              name: CustomerFields.createdAt,
              fromJson: DateUtils.timestampToDateTime,
              toJson: DateUtils.dateTimeToTimestamp)
          final DateTime? createdAt,
          @JsonKey(name: CustomerFields.userId) final String? userId,
          @JsonKey(name: CustomerFields.shopId) final String? shopId,
          @JsonKey(name: CustomerFields.customerId) final String? customerId,
          @JsonKey(name: CustomerFields.name) final String? name,
          @JsonKey(name: CustomerFields.address) final LocationModel? address,
          @JsonKey(name: CustomerFields.userName) final String? userName,
          @JsonKey(name: CustomerFields.gender) final Gender? gender,
          @JsonKey(name: CustomerFields.dob) final DateTime? dob,
          @JsonKey(name: CustomerFields.description) final String? description,
          @JsonKey(name: CustomerFields.updatedAt) final DateTime? updatedAt,
          @JsonKey(name: CustomerFields.phoneNumber) final String? phoneNumber,
          @JsonKey(name: CustomerFields.status) final bool? status}) =
      _$CustomerImpl;

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  @JsonKey(
      name: CustomerFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: CustomerFields.userId)
  String? get userId;
  @override
  @JsonKey(name: CustomerFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: CustomerFields.customerId)
  String? get customerId;
  @override
  @JsonKey(name: CustomerFields.name)
  String? get name;
  @override
  @JsonKey(name: CustomerFields.address)
  LocationModel? get address;
  @override
  @JsonKey(name: CustomerFields.userName)
  String? get userName;
  @override
  @JsonKey(name: CustomerFields.gender)
  Gender? get gender;
  @override
  @JsonKey(name: CustomerFields.dob)
  DateTime? get dob;
  @override
  @JsonKey(name: CustomerFields.description)
  String? get description;
  @override
  @JsonKey(name: CustomerFields.updatedAt)
  DateTime? get updatedAt;
  @override
  @JsonKey(name: CustomerFields.phoneNumber)
  String? get phoneNumber;
  @override
  @JsonKey(name: CustomerFields.status)
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
