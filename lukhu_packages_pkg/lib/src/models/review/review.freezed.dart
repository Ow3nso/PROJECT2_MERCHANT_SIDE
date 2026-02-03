// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: ReviewFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: ReviewFields.imageUrl)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: ReviewFields.reviewRating)
  double? get reviewRating => throw _privateConstructorUsedError;
  @JsonKey(name: ReviewFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: ReviewFields.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: ReviewFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: ReviewFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: ReviewFields.productId)
  String? get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: ReviewFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ReviewFields.imageUrl) String? imageUrl,
      @JsonKey(name: ReviewFields.reviewRating) double? reviewRating,
      @JsonKey(name: ReviewFields.name) String? name,
      @JsonKey(name: ReviewFields.description) String? description,
      @JsonKey(name: ReviewFields.shopId) String? shopId,
      @JsonKey(name: ReviewFields.userId) String? userId,
      @JsonKey(name: ReviewFields.productId) String? productId});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? imageUrl = freezed,
    Object? reviewRating = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
    Object? productId = freezed,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewRating: freezed == reviewRating
          ? _value.reviewRating
          : reviewRating // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: ReviewFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ReviewFields.imageUrl) String? imageUrl,
      @JsonKey(name: ReviewFields.reviewRating) double? reviewRating,
      @JsonKey(name: ReviewFields.name) String? name,
      @JsonKey(name: ReviewFields.description) String? description,
      @JsonKey(name: ReviewFields.shopId) String? shopId,
      @JsonKey(name: ReviewFields.userId) String? userId,
      @JsonKey(name: ReviewFields.productId) String? productId});
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? imageUrl = freezed,
    Object? reviewRating = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? shopId = freezed,
    Object? userId = freezed,
    Object? productId = freezed,
  }) {
    return _then(_$ReviewImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewRating: freezed == reviewRating
          ? _value.reviewRating
          : reviewRating // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ReviewImpl implements _Review {
  _$ReviewImpl(
      {this.id,
      @JsonKey(
          name: ReviewFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: ReviewFields.imageUrl) this.imageUrl,
      @JsonKey(name: ReviewFields.reviewRating) this.reviewRating,
      @JsonKey(name: ReviewFields.name) this.name,
      @JsonKey(name: ReviewFields.description) this.description,
      @JsonKey(name: ReviewFields.shopId) this.shopId,
      @JsonKey(name: ReviewFields.userId) this.userId,
      @JsonKey(name: ReviewFields.productId) this.productId});

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(
      name: ReviewFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: ReviewFields.imageUrl)
  final String? imageUrl;
  @override
  @JsonKey(name: ReviewFields.reviewRating)
  final double? reviewRating;
  @override
  @JsonKey(name: ReviewFields.name)
  final String? name;
  @override
  @JsonKey(name: ReviewFields.description)
  final String? description;
  @override
  @JsonKey(name: ReviewFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: ReviewFields.userId)
  final String? userId;
  @override
  @JsonKey(name: ReviewFields.productId)
  final String? productId;

  @override
  String toString() {
    return 'Review(id: $id, createdAt: $createdAt, imageUrl: $imageUrl, reviewRating: $reviewRating, name: $name, description: $description, shopId: $shopId, userId: $userId, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.reviewRating, reviewRating) ||
                other.reviewRating == reviewRating) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, imageUrl,
      reviewRating, name, description, shopId, userId, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  factory _Review(
          {final String? id,
          @JsonKey(
              name: ReviewFields.createdAt,
              fromJson: DateUtils.timestampToDateTime,
              toJson: DateUtils.dateTimeToTimestamp)
          final DateTime? createdAt,
          @JsonKey(name: ReviewFields.imageUrl) final String? imageUrl,
          @JsonKey(name: ReviewFields.reviewRating) final double? reviewRating,
          @JsonKey(name: ReviewFields.name) final String? name,
          @JsonKey(name: ReviewFields.description) final String? description,
          @JsonKey(name: ReviewFields.shopId) final String? shopId,
          @JsonKey(name: ReviewFields.userId) final String? userId,
          @JsonKey(name: ReviewFields.productId) final String? productId}) =
      _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(
      name: ReviewFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: ReviewFields.imageUrl)
  String? get imageUrl;
  @override
  @JsonKey(name: ReviewFields.reviewRating)
  double? get reviewRating;
  @override
  @JsonKey(name: ReviewFields.name)
  String? get name;
  @override
  @JsonKey(name: ReviewFields.description)
  String? get description;
  @override
  @JsonKey(name: ReviewFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: ReviewFields.userId)
  String? get userId;
  @override
  @JsonKey(name: ReviewFields.productId)
  String? get productId;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
