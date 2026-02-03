// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailModel {
  @JsonKey(name: OrderFields.productId)
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.sellerId)
  String? get sellerId => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.size)
  String? get size => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.color)
  String? get color => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.quantity)
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.amount)
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: OrderFields.orderImages)
  List<String>? get orderImages => throw _privateConstructorUsedError;
  @JsonKey(
      name: OrderFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
      name: OrderFields.updatedAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailModelCopyWith<OrderDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailModelCopyWith<$Res> {
  factory $OrderDetailModelCopyWith(
          OrderDetailModel value, $Res Function(OrderDetailModel) then) =
      _$OrderDetailModelCopyWithImpl<$Res, OrderDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: OrderFields.productId) String? productId,
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
      DateTime? updatedAt});
}

/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res, $Val extends OrderDetailModel>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? sellerId = freezed,
    Object? size = freezed,
    Object? color = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? orderImages = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderImages: freezed == orderImages
          ? _value.orderImages
          : orderImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailModelImplCopyWith<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  factory _$$OrderDetailModelImplCopyWith(_$OrderDetailModelImpl value,
          $Res Function(_$OrderDetailModelImpl) then) =
      __$$OrderDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: OrderFields.productId) String? productId,
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
      DateTime? updatedAt});
}

/// @nodoc
class __$$OrderDetailModelImplCopyWithImpl<$Res>
    extends _$OrderDetailModelCopyWithImpl<$Res, _$OrderDetailModelImpl>
    implements _$$OrderDetailModelImplCopyWith<$Res> {
  __$$OrderDetailModelImplCopyWithImpl(_$OrderDetailModelImpl _value,
      $Res Function(_$OrderDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? sellerId = freezed,
    Object? size = freezed,
    Object? color = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? orderImages = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderDetailModelImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      orderImages: freezed == orderImages
          ? _value._orderImages
          : orderImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderDetailModelImpl implements _OrderDetailModel {
  _$OrderDetailModelImpl(
      {@JsonKey(name: OrderFields.productId) this.productId,
      @JsonKey(name: OrderFields.sellerId) this.sellerId,
      @JsonKey(name: OrderFields.size) this.size,
      @JsonKey(name: OrderFields.color) this.color,
      @JsonKey(name: OrderFields.quantity) this.quantity,
      @JsonKey(name: OrderFields.amount) this.amount,
      @JsonKey(name: OrderFields.orderImages) final List<String>? orderImages,
      @JsonKey(
          name: OrderFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(
          name: OrderFields.updatedAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.updatedAt})
      : _orderImages = orderImages;

  factory _$OrderDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailModelImplFromJson(json);

  @override
  @JsonKey(name: OrderFields.productId)
  final String? productId;
  @override
  @JsonKey(name: OrderFields.sellerId)
  final String? sellerId;
  @override
  @JsonKey(name: OrderFields.size)
  final String? size;
  @override
  @JsonKey(name: OrderFields.color)
  final String? color;
  @override
  @JsonKey(name: OrderFields.quantity)
  final int? quantity;
  @override
  @JsonKey(name: OrderFields.amount)
  final double? amount;
  final List<String>? _orderImages;
  @override
  @JsonKey(name: OrderFields.orderImages)
  List<String>? get orderImages {
    final value = _orderImages;
    if (value == null) return null;
    if (_orderImages is EqualUnmodifiableListView) return _orderImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(
      name: OrderFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(
      name: OrderFields.updatedAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'OrderDetailModel(productId: $productId, sellerId: $sellerId, size: $size, color: $color, quantity: $quantity, amount: $amount, orderImages: $orderImages, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailModelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other._orderImages, _orderImages) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      sellerId,
      size,
      color,
      quantity,
      amount,
      const DeepCollectionEquality().hash(_orderImages),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      __$$OrderDetailModelImplCopyWithImpl<_$OrderDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailModelImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailModel implements OrderDetailModel {
  factory _OrderDetailModel(
      {@JsonKey(name: OrderFields.productId) final String? productId,
      @JsonKey(name: OrderFields.sellerId) final String? sellerId,
      @JsonKey(name: OrderFields.size) final String? size,
      @JsonKey(name: OrderFields.color) final String? color,
      @JsonKey(name: OrderFields.quantity) final int? quantity,
      @JsonKey(name: OrderFields.amount) final double? amount,
      @JsonKey(name: OrderFields.orderImages) final List<String>? orderImages,
      @JsonKey(
          name: OrderFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(
          name: OrderFields.updatedAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? updatedAt}) = _$OrderDetailModelImpl;

  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) =
      _$OrderDetailModelImpl.fromJson;

  @override
  @JsonKey(name: OrderFields.productId)
  String? get productId;
  @override
  @JsonKey(name: OrderFields.sellerId)
  String? get sellerId;
  @override
  @JsonKey(name: OrderFields.size)
  String? get size;
  @override
  @JsonKey(name: OrderFields.color)
  String? get color;
  @override
  @JsonKey(name: OrderFields.quantity)
  int? get quantity;
  @override
  @JsonKey(name: OrderFields.amount)
  double? get amount;
  @override
  @JsonKey(name: OrderFields.orderImages)
  List<String>? get orderImages;
  @override
  @JsonKey(
      name: OrderFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(
      name: OrderFields.updatedAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderDetailModelImplCopyWith<_$OrderDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
