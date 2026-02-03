// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return _Offer.fromJson(json);
}

/// @nodoc
mixin _$Offer {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: OfferFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.sellerId)
  String? get sellerId => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.productId)
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.offerPrice)
  double? get offerPrice => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.images)
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.price)
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.offerType)
  DeliveryStatus? get offerType => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.decription)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.startTime)
  int? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: OfferFields.endTime)
  int? get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferCopyWith<Offer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) then) =
      _$OfferCopyWithImpl<$Res, Offer>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: OfferFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: OfferFields.userId) String? userId,
      @JsonKey(name: OfferFields.sellerId) String? sellerId,
      @JsonKey(name: OfferFields.productId) String? productId,
      @JsonKey(name: OfferFields.offerPrice) double? offerPrice,
      @JsonKey(name: OfferFields.images) List<String>? images,
      @JsonKey(name: OfferFields.price) double? price,
      @JsonKey(name: OfferFields.offerType) DeliveryStatus? offerType,
      @JsonKey(name: OfferFields.decription) String? description,
      @JsonKey(name: OfferFields.startTime) int? startTime,
      @JsonKey(name: OfferFields.endTime) int? endTime});
}

/// @nodoc
class _$OfferCopyWithImpl<$Res, $Val extends Offer>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._value, this._then);

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
    Object? sellerId = freezed,
    Object? productId = freezed,
    Object? offerPrice = freezed,
    Object? images = freezed,
    Object? price = freezed,
    Object? offerType = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
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
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      offerPrice: freezed == offerPrice
          ? _value.offerPrice
          : offerPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      offerType: freezed == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferImplCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$$OfferImplCopyWith(
          _$OfferImpl value, $Res Function(_$OfferImpl) then) =
      __$$OfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: OfferFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: OfferFields.userId) String? userId,
      @JsonKey(name: OfferFields.sellerId) String? sellerId,
      @JsonKey(name: OfferFields.productId) String? productId,
      @JsonKey(name: OfferFields.offerPrice) double? offerPrice,
      @JsonKey(name: OfferFields.images) List<String>? images,
      @JsonKey(name: OfferFields.price) double? price,
      @JsonKey(name: OfferFields.offerType) DeliveryStatus? offerType,
      @JsonKey(name: OfferFields.decription) String? description,
      @JsonKey(name: OfferFields.startTime) int? startTime,
      @JsonKey(name: OfferFields.endTime) int? endTime});
}

/// @nodoc
class __$$OfferImplCopyWithImpl<$Res>
    extends _$OfferCopyWithImpl<$Res, _$OfferImpl>
    implements _$$OfferImplCopyWith<$Res> {
  __$$OfferImplCopyWithImpl(
      _$OfferImpl _value, $Res Function(_$OfferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
    Object? sellerId = freezed,
    Object? productId = freezed,
    Object? offerPrice = freezed,
    Object? images = freezed,
    Object? price = freezed,
    Object? offerType = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$OfferImpl(
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
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      offerPrice: freezed == offerPrice
          ? _value.offerPrice
          : offerPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      offerType: freezed == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OfferImpl implements _Offer {
  _$OfferImpl(
      {this.id,
      @JsonKey(
          name: OfferFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: OfferFields.userId) this.userId,
      @JsonKey(name: OfferFields.sellerId) this.sellerId,
      @JsonKey(name: OfferFields.productId) this.productId,
      @JsonKey(name: OfferFields.offerPrice) this.offerPrice,
      @JsonKey(name: OfferFields.images) final List<String>? images,
      @JsonKey(name: OfferFields.price) this.price,
      @JsonKey(name: OfferFields.offerType) this.offerType,
      @JsonKey(name: OfferFields.decription) this.description,
      @JsonKey(name: OfferFields.startTime) this.startTime,
      @JsonKey(name: OfferFields.endTime) this.endTime})
      : _images = images;

  factory _$OfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(
      name: OfferFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: OfferFields.userId)
  final String? userId;
  @override
  @JsonKey(name: OfferFields.sellerId)
  final String? sellerId;
  @override
  @JsonKey(name: OfferFields.productId)
  final String? productId;
  @override
  @JsonKey(name: OfferFields.offerPrice)
  final double? offerPrice;
  final List<String>? _images;
  @override
  @JsonKey(name: OfferFields.images)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: OfferFields.price)
  final double? price;
  @override
  @JsonKey(name: OfferFields.offerType)
  final DeliveryStatus? offerType;
  @override
  @JsonKey(name: OfferFields.decription)
  final String? description;
  @override
  @JsonKey(name: OfferFields.startTime)
  final int? startTime;
  @override
  @JsonKey(name: OfferFields.endTime)
  final int? endTime;

  @override
  String toString() {
    return 'Offer(id: $id, createdAt: $createdAt, userId: $userId, sellerId: $sellerId, productId: $productId, offerPrice: $offerPrice, images: $images, price: $price, offerType: $offerType, description: $description, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.offerPrice, offerPrice) ||
                other.offerPrice == offerPrice) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.offerType, offerType) ||
                other.offerType == offerType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      userId,
      sellerId,
      productId,
      offerPrice,
      const DeepCollectionEquality().hash(_images),
      price,
      offerType,
      description,
      startTime,
      endTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      __$$OfferImplCopyWithImpl<_$OfferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferImplToJson(
      this,
    );
  }
}

abstract class _Offer implements Offer {
  factory _Offer(
      {final String? id,
      @JsonKey(
          name: OfferFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(name: OfferFields.userId) final String? userId,
      @JsonKey(name: OfferFields.sellerId) final String? sellerId,
      @JsonKey(name: OfferFields.productId) final String? productId,
      @JsonKey(name: OfferFields.offerPrice) final double? offerPrice,
      @JsonKey(name: OfferFields.images) final List<String>? images,
      @JsonKey(name: OfferFields.price) final double? price,
      @JsonKey(name: OfferFields.offerType) final DeliveryStatus? offerType,
      @JsonKey(name: OfferFields.decription) final String? description,
      @JsonKey(name: OfferFields.startTime) final int? startTime,
      @JsonKey(name: OfferFields.endTime) final int? endTime}) = _$OfferImpl;

  factory _Offer.fromJson(Map<String, dynamic> json) = _$OfferImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(
      name: OfferFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: OfferFields.userId)
  String? get userId;
  @override
  @JsonKey(name: OfferFields.sellerId)
  String? get sellerId;
  @override
  @JsonKey(name: OfferFields.productId)
  String? get productId;
  @override
  @JsonKey(name: OfferFields.offerPrice)
  double? get offerPrice;
  @override
  @JsonKey(name: OfferFields.images)
  List<String>? get images;
  @override
  @JsonKey(name: OfferFields.price)
  double? get price;
  @override
  @JsonKey(name: OfferFields.offerType)
  DeliveryStatus? get offerType;
  @override
  @JsonKey(name: OfferFields.decription)
  String? get description;
  @override
  @JsonKey(name: OfferFields.startTime)
  int? get startTime;
  @override
  @JsonKey(name: OfferFields.endTime)
  int? get endTime;
  @override
  @JsonKey(ignore: true)
  _$$OfferImplCopyWith<_$OfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
