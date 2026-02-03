// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Shop _$ShopFromJson(Map<String, dynamic> json) {
  return _Shop.fromJson(json);
}

/// @nodoc
mixin _$Shop {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      name: ShopFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.imageUrl)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.coverImage)
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.address)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.city)
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.userId)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.earnedBadges)
  List<String>? get earnedBadges => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.isVerified)
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.shopRating)
  double? get shopRating => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.followers)
  List<String>? get followers => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.following)
  List<String>? get following => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.transactions)
  List<String>? get transactions => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.views)
  int? get views => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.webDomain)
  String? get webDomain => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.requestFreeDomain)
  bool? get requestFreeDomain => throw _privateConstructorUsedError;
  @JsonKey(name: ShopFields.socialMedia)
  SocialMedia? get socialMedia => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCopyWith<Shop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCopyWith<$Res> {
  factory $ShopCopyWith(Shop value, $Res Function(Shop) then) =
      _$ShopCopyWithImpl<$Res, Shop>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: ShopFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ShopFields.shopId) String? shopId,
      @JsonKey(name: ShopFields.name) String? name,
      @JsonKey(name: ShopFields.description) String? description,
      @JsonKey(name: ShopFields.imageUrl) String? imageUrl,
      @JsonKey(name: ShopFields.coverImage) String? coverImage,
      @JsonKey(name: ShopFields.address) String? address,
      @JsonKey(name: ShopFields.city) String? city,
      @JsonKey(name: ShopFields.userId) String? userId,
      @JsonKey(name: ShopFields.earnedBadges) List<String>? earnedBadges,
      @JsonKey(name: ShopFields.isVerified) bool? isVerified,
      @JsonKey(name: ShopFields.shopRating) double? shopRating,
      @JsonKey(name: ShopFields.followers) List<String>? followers,
      @JsonKey(name: ShopFields.following) List<String>? following,
      @JsonKey(name: ShopFields.transactions) List<String>? transactions,
      @JsonKey(name: ShopFields.views) int? views,
      @JsonKey(name: ShopFields.webDomain) String? webDomain,
      @JsonKey(name: ShopFields.requestFreeDomain) bool? requestFreeDomain,
      @JsonKey(name: ShopFields.socialMedia) SocialMedia? socialMedia});

  $SocialMediaCopyWith<$Res>? get socialMedia;
}

/// @nodoc
class _$ShopCopyWithImpl<$Res, $Val extends Shop>
    implements $ShopCopyWith<$Res> {
  _$ShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? shopId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? coverImage = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? userId = freezed,
    Object? earnedBadges = freezed,
    Object? isVerified = freezed,
    Object? shopRating = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? transactions = freezed,
    Object? views = freezed,
    Object? webDomain = freezed,
    Object? requestFreeDomain = freezed,
    Object? socialMedia = freezed,
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
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      earnedBadges: freezed == earnedBadges
          ? _value.earnedBadges
          : earnedBadges // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      shopRating: freezed == shopRating
          ? _value.shopRating
          : shopRating // ignore: cast_nullable_to_non_nullable
              as double?,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      following: freezed == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      webDomain: freezed == webDomain
          ? _value.webDomain
          : webDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      requestFreeDomain: freezed == requestFreeDomain
          ? _value.requestFreeDomain
          : requestFreeDomain // ignore: cast_nullable_to_non_nullable
              as bool?,
      socialMedia: freezed == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as SocialMedia?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SocialMediaCopyWith<$Res>? get socialMedia {
    if (_value.socialMedia == null) {
      return null;
    }

    return $SocialMediaCopyWith<$Res>(_value.socialMedia!, (value) {
      return _then(_value.copyWith(socialMedia: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShopImplCopyWith<$Res> implements $ShopCopyWith<$Res> {
  factory _$$ShopImplCopyWith(
          _$ShopImpl value, $Res Function(_$ShopImpl) then) =
      __$$ShopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(
          name: ShopFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ShopFields.shopId) String? shopId,
      @JsonKey(name: ShopFields.name) String? name,
      @JsonKey(name: ShopFields.description) String? description,
      @JsonKey(name: ShopFields.imageUrl) String? imageUrl,
      @JsonKey(name: ShopFields.coverImage) String? coverImage,
      @JsonKey(name: ShopFields.address) String? address,
      @JsonKey(name: ShopFields.city) String? city,
      @JsonKey(name: ShopFields.userId) String? userId,
      @JsonKey(name: ShopFields.earnedBadges) List<String>? earnedBadges,
      @JsonKey(name: ShopFields.isVerified) bool? isVerified,
      @JsonKey(name: ShopFields.shopRating) double? shopRating,
      @JsonKey(name: ShopFields.followers) List<String>? followers,
      @JsonKey(name: ShopFields.following) List<String>? following,
      @JsonKey(name: ShopFields.transactions) List<String>? transactions,
      @JsonKey(name: ShopFields.views) int? views,
      @JsonKey(name: ShopFields.webDomain) String? webDomain,
      @JsonKey(name: ShopFields.requestFreeDomain) bool? requestFreeDomain,
      @JsonKey(name: ShopFields.socialMedia) SocialMedia? socialMedia});

  @override
  $SocialMediaCopyWith<$Res>? get socialMedia;
}

/// @nodoc
class __$$ShopImplCopyWithImpl<$Res>
    extends _$ShopCopyWithImpl<$Res, _$ShopImpl>
    implements _$$ShopImplCopyWith<$Res> {
  __$$ShopImplCopyWithImpl(_$ShopImpl _value, $Res Function(_$ShopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? shopId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? coverImage = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? userId = freezed,
    Object? earnedBadges = freezed,
    Object? isVerified = freezed,
    Object? shopRating = freezed,
    Object? followers = freezed,
    Object? following = freezed,
    Object? transactions = freezed,
    Object? views = freezed,
    Object? webDomain = freezed,
    Object? requestFreeDomain = freezed,
    Object? socialMedia = freezed,
  }) {
    return _then(_$ShopImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      earnedBadges: freezed == earnedBadges
          ? _value._earnedBadges
          : earnedBadges // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      shopRating: freezed == shopRating
          ? _value.shopRating
          : shopRating // ignore: cast_nullable_to_non_nullable
              as double?,
      followers: freezed == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      following: freezed == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      webDomain: freezed == webDomain
          ? _value.webDomain
          : webDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      requestFreeDomain: freezed == requestFreeDomain
          ? _value.requestFreeDomain
          : requestFreeDomain // ignore: cast_nullable_to_non_nullable
              as bool?,
      socialMedia: freezed == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as SocialMedia?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShopImpl implements _Shop {
  _$ShopImpl(
      {this.id,
      @JsonKey(
          name: ShopFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: ShopFields.shopId) this.shopId,
      @JsonKey(name: ShopFields.name) this.name,
      @JsonKey(name: ShopFields.description) this.description,
      @JsonKey(name: ShopFields.imageUrl) this.imageUrl,
      @JsonKey(name: ShopFields.coverImage) this.coverImage,
      @JsonKey(name: ShopFields.address) this.address,
      @JsonKey(name: ShopFields.city) this.city,
      @JsonKey(name: ShopFields.userId) this.userId,
      @JsonKey(name: ShopFields.earnedBadges) final List<String>? earnedBadges,
      @JsonKey(name: ShopFields.isVerified) this.isVerified,
      @JsonKey(name: ShopFields.shopRating) this.shopRating,
      @JsonKey(name: ShopFields.followers) final List<String>? followers,
      @JsonKey(name: ShopFields.following) final List<String>? following,
      @JsonKey(name: ShopFields.transactions) final List<String>? transactions,
      @JsonKey(name: ShopFields.views) this.views,
      @JsonKey(name: ShopFields.webDomain) this.webDomain,
      @JsonKey(name: ShopFields.requestFreeDomain) this.requestFreeDomain,
      @JsonKey(name: ShopFields.socialMedia) this.socialMedia})
      : _earnedBadges = earnedBadges,
        _followers = followers,
        _following = following,
        _transactions = transactions;

  factory _$ShopImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(
      name: ShopFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: ShopFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: ShopFields.name)
  final String? name;
  @override
  @JsonKey(name: ShopFields.description)
  final String? description;
  @override
  @JsonKey(name: ShopFields.imageUrl)
  final String? imageUrl;
  @override
  @JsonKey(name: ShopFields.coverImage)
  final String? coverImage;
  @override
  @JsonKey(name: ShopFields.address)
  final String? address;
  @override
  @JsonKey(name: ShopFields.city)
  final String? city;
  @override
  @JsonKey(name: ShopFields.userId)
  final String? userId;
  final List<String>? _earnedBadges;
  @override
  @JsonKey(name: ShopFields.earnedBadges)
  List<String>? get earnedBadges {
    final value = _earnedBadges;
    if (value == null) return null;
    if (_earnedBadges is EqualUnmodifiableListView) return _earnedBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: ShopFields.isVerified)
  final bool? isVerified;
  @override
  @JsonKey(name: ShopFields.shopRating)
  final double? shopRating;
  final List<String>? _followers;
  @override
  @JsonKey(name: ShopFields.followers)
  List<String>? get followers {
    final value = _followers;
    if (value == null) return null;
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _following;
  @override
  @JsonKey(name: ShopFields.following)
  List<String>? get following {
    final value = _following;
    if (value == null) return null;
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _transactions;
  @override
  @JsonKey(name: ShopFields.transactions)
  List<String>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: ShopFields.views)
  final int? views;
  @override
  @JsonKey(name: ShopFields.webDomain)
  final String? webDomain;
  @override
  @JsonKey(name: ShopFields.requestFreeDomain)
  final bool? requestFreeDomain;
  @override
  @JsonKey(name: ShopFields.socialMedia)
  final SocialMedia? socialMedia;

  @override
  String toString() {
    return 'Shop(id: $id, createdAt: $createdAt, shopId: $shopId, name: $name, description: $description, imageUrl: $imageUrl, coverImage: $coverImage, address: $address, city: $city, userId: $userId, earnedBadges: $earnedBadges, isVerified: $isVerified, shopRating: $shopRating, followers: $followers, following: $following, transactions: $transactions, views: $views, webDomain: $webDomain, requestFreeDomain: $requestFreeDomain, socialMedia: $socialMedia)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._earnedBadges, _earnedBadges) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.shopRating, shopRating) ||
                other.shopRating == shopRating) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.webDomain, webDomain) ||
                other.webDomain == webDomain) &&
            (identical(other.requestFreeDomain, requestFreeDomain) ||
                other.requestFreeDomain == requestFreeDomain) &&
            (identical(other.socialMedia, socialMedia) ||
                other.socialMedia == socialMedia));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        shopId,
        name,
        description,
        imageUrl,
        coverImage,
        address,
        city,
        userId,
        const DeepCollectionEquality().hash(_earnedBadges),
        isVerified,
        shopRating,
        const DeepCollectionEquality().hash(_followers),
        const DeepCollectionEquality().hash(_following),
        const DeepCollectionEquality().hash(_transactions),
        views,
        webDomain,
        requestFreeDomain,
        socialMedia
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopImplCopyWith<_$ShopImpl> get copyWith =>
      __$$ShopImplCopyWithImpl<_$ShopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopImplToJson(
      this,
    );
  }
}

abstract class _Shop implements Shop {
  factory _Shop(
      {final String? id,
      @JsonKey(
          name: ShopFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(name: ShopFields.shopId) final String? shopId,
      @JsonKey(name: ShopFields.name) final String? name,
      @JsonKey(name: ShopFields.description) final String? description,
      @JsonKey(name: ShopFields.imageUrl) final String? imageUrl,
      @JsonKey(name: ShopFields.coverImage) final String? coverImage,
      @JsonKey(name: ShopFields.address) final String? address,
      @JsonKey(name: ShopFields.city) final String? city,
      @JsonKey(name: ShopFields.userId) final String? userId,
      @JsonKey(name: ShopFields.earnedBadges) final List<String>? earnedBadges,
      @JsonKey(name: ShopFields.isVerified) final bool? isVerified,
      @JsonKey(name: ShopFields.shopRating) final double? shopRating,
      @JsonKey(name: ShopFields.followers) final List<String>? followers,
      @JsonKey(name: ShopFields.following) final List<String>? following,
      @JsonKey(name: ShopFields.transactions) final List<String>? transactions,
      @JsonKey(name: ShopFields.views) final int? views,
      @JsonKey(name: ShopFields.webDomain) final String? webDomain,
      @JsonKey(name: ShopFields.requestFreeDomain)
      final bool? requestFreeDomain,
      @JsonKey(name: ShopFields.socialMedia)
      final SocialMedia? socialMedia}) = _$ShopImpl;

  factory _Shop.fromJson(Map<String, dynamic> json) = _$ShopImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(
      name: ShopFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: ShopFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: ShopFields.name)
  String? get name;
  @override
  @JsonKey(name: ShopFields.description)
  String? get description;
  @override
  @JsonKey(name: ShopFields.imageUrl)
  String? get imageUrl;
  @override
  @JsonKey(name: ShopFields.coverImage)
  String? get coverImage;
  @override
  @JsonKey(name: ShopFields.address)
  String? get address;
  @override
  @JsonKey(name: ShopFields.city)
  String? get city;
  @override
  @JsonKey(name: ShopFields.userId)
  String? get userId;
  @override
  @JsonKey(name: ShopFields.earnedBadges)
  List<String>? get earnedBadges;
  @override
  @JsonKey(name: ShopFields.isVerified)
  bool? get isVerified;
  @override
  @JsonKey(name: ShopFields.shopRating)
  double? get shopRating;
  @override
  @JsonKey(name: ShopFields.followers)
  List<String>? get followers;
  @override
  @JsonKey(name: ShopFields.following)
  List<String>? get following;
  @override
  @JsonKey(name: ShopFields.transactions)
  List<String>? get transactions;
  @override
  @JsonKey(name: ShopFields.views)
  int? get views;
  @override
  @JsonKey(name: ShopFields.webDomain)
  String? get webDomain;
  @override
  @JsonKey(name: ShopFields.requestFreeDomain)
  bool? get requestFreeDomain;
  @override
  @JsonKey(name: ShopFields.socialMedia)
  SocialMedia? get socialMedia;
  @override
  @JsonKey(ignore: true)
  _$$ShopImplCopyWith<_$ShopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
