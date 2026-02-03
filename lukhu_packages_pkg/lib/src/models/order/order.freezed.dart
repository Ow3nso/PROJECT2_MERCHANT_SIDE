// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: OrderFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.orderId)
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.statusType)
  DeliveryStatus? get statusType => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.paymentType)
  AccountType? get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.account)
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.status)
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.customerId)
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.price)
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.phoneNumber)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.items)
  List<OrderDetailModel>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
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
      @JsonKey(name: OrderFields.items) List<OrderDetailModel>? items});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? orderId = freezed,
    Object? userId = freezed,
    Object? statusType = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? paymentType = freezed,
    Object? account = freezed,
    Object? shopId = freezed,
    Object? status = freezed,
    Object? customerId = freezed,
    Object? price = freezed,
    Object? phoneNumber = freezed,
    Object? items = freezed,
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
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusType: freezed == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
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
      @JsonKey(name: OrderFields.items) List<OrderDetailModel>? items});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? orderId = freezed,
    Object? userId = freezed,
    Object? statusType = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? paymentType = freezed,
    Object? account = freezed,
    Object? shopId = freezed,
    Object? status = freezed,
    Object? customerId = freezed,
    Object? price = freezed,
    Object? phoneNumber = freezed,
    Object? items = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      statusType: freezed == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {this.id,
      @JsonKey(
          name: OrderFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: OrderFields.orderId) this.orderId,
      @JsonKey(name: OrderFields.userId) this.userId,
      @JsonKey(name: OrderFields.statusType) this.statusType,
      @JsonKey(name: OrderFields.name) this.name,
      @JsonKey(name: OrderFields.description) this.description,
      @JsonKey(name: OrderFields.paymentType) this.paymentType,
      @JsonKey(name: OrderFields.account) this.account,
      @JsonKey(name: OrderFields.shopId) this.shopId,
      @JsonKey(name: OrderFields.status) this.status,
      @JsonKey(name: OrderFields.customerId) this.customerId,
      @JsonKey(name: OrderFields.price) this.price,
      @JsonKey(name: OrderFields.phoneNumber) this.phoneNumber,
      @JsonKey(name: OrderFields.items) final List<OrderDetailModel>? items})
      : _items = items;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(
      name: OrderFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: OrderFields.orderId)
  final String? orderId;
  @override
  @JsonKey(name: OrderFields.userId)
  final String? userId;
  @override
  @JsonKey(name: OrderFields.statusType)
  final DeliveryStatus? statusType;
  @override
  @JsonKey(name: OrderFields.name)
  final String? name;
  @override
  @JsonKey(name: OrderFields.description)
  final String? description;
  @override
  @JsonKey(name: OrderFields.paymentType)
  final AccountType? paymentType;
  @override
  @JsonKey(name: OrderFields.account)
  final String? account;
  @override
  @JsonKey(name: OrderFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: OrderFields.status)
  final bool? status;
  @override
  @JsonKey(name: OrderFields.customerId)
  final String? customerId;
  @override
  @JsonKey(name: OrderFields.price)
  final double? price;
  @override
  @JsonKey(name: OrderFields.phoneNumber)
  final String? phoneNumber;
  final List<OrderDetailModel>? _items;
  @override
  @JsonKey(name: OrderFields.items)
  List<OrderDetailModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, createdAt: $createdAt, orderId: $orderId, userId: $userId, statusType: $statusType, name: $name, description: $description, paymentType: $paymentType, account: $account, shopId: $shopId, status: $status, customerId: $customerId, price: $price, phoneNumber: $phoneNumber, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.statusType, statusType) ||
                other.statusType == statusType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      orderId,
      userId,
      statusType,
      name,
      description,
      paymentType,
      account,
      shopId,
      status,
      customerId,
      price,
      phoneNumber,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {final String? id,
      @JsonKey(
          name: OrderFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(name: OrderFields.orderId) final String? orderId,
      @JsonKey(name: OrderFields.userId) final String? userId,
      @JsonKey(name: OrderFields.statusType) final DeliveryStatus? statusType,
      @JsonKey(name: OrderFields.name) final String? name,
      @JsonKey(name: OrderFields.description) final String? description,
      @JsonKey(name: OrderFields.paymentType) final AccountType? paymentType,
      @JsonKey(name: OrderFields.account) final String? account,
      @JsonKey(name: OrderFields.shopId) final String? shopId,
      @JsonKey(name: OrderFields.status) final bool? status,
      @JsonKey(name: OrderFields.customerId) final String? customerId,
      @JsonKey(name: OrderFields.price) final double? price,
      @JsonKey(name: OrderFields.phoneNumber) final String? phoneNumber,
      @JsonKey(name: OrderFields.items)
      final List<OrderDetailModel>? items}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(
      name: OrderFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: OrderFields.orderId)
  String? get orderId;
  @override
  @JsonKey(name: OrderFields.userId)
  String? get userId;
  @override
  @JsonKey(name: OrderFields.statusType)
  DeliveryStatus? get statusType;
  @override
  @JsonKey(name: OrderFields.name)
  String? get name;
  @override
  @JsonKey(name: OrderFields.description)
  String? get description;
  @override
  @JsonKey(name: OrderFields.paymentType)
  AccountType? get paymentType;
  @override
  @JsonKey(name: OrderFields.account)
  String? get account;
  @override
  @JsonKey(name: OrderFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: OrderFields.status)
  bool? get status;
  @override
  @JsonKey(name: OrderFields.customerId)
  String? get customerId;
  @override
  @JsonKey(name: OrderFields.price)
  double? get price;
  @override
  @JsonKey(name: OrderFields.phoneNumber)
  String? get phoneNumber;
  @override
  @JsonKey(name: OrderFields.items)
  List<OrderDetailModel>? get items;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
