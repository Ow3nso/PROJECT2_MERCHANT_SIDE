// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(
      name: ProductFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.productId)
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.sellerId)
  String? get sellerId => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.label)
  String? get label => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.price)
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.currency)
  String? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.category)
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.subCategory)
  String? get subCategory => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.images)
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isAvailable)
  bool? get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isFeatured)
  bool? get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isPopular)
  bool? get isPopular => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnSale)
  bool? get isOnSale => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnDiscount)
  bool? get isOnDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnNew)
  bool? get isOnNew => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnBestSeller)
  bool? get isOnBestSeller => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnTopRated)
  bool? get isOnTopRated => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnFeatured)
  bool? get isOnFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnPopular)
  bool? get isOnPopular => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isOnTrending)
  bool? get isOnTrending => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.likes)
  List<String>? get likes => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.views)
  List<String>? get views => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.shares)
  int? get shares => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isVerified)
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isApproved)
  bool? get isApproved => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.isSoldOut)
  bool? get isSoldOut => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.stock)
  int? get stock => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.discountPercentage)
  double? get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.discountAmount)
  double? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.discountStartDate)
  int? get discountStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.discountEndDate)
  int? get discountEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.availableColors)
  List<String>? get availableColors => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.availableSizes)
  List<String>? get availableSizes => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.shopId)
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.mediaPath)
  String? get mediaPath => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.lastUpdatedAt)
  int? get lastUpdatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.hasBeenIndexed)
  bool? get hasBeenIndexed => throw _privateConstructorUsedError;
  @JsonKey(name: ProductFields.heroImage)
  String? get heroImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(
          name: ProductFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ProductFields.productId) String? productId,
      @JsonKey(name: ProductFields.sellerId) String? sellerId,
      @JsonKey(name: ProductFields.label) String? label,
      @JsonKey(name: ProductFields.description) String? description,
      @JsonKey(name: ProductFields.price) double? price,
      @JsonKey(name: ProductFields.currency) String? currency,
      @JsonKey(name: ProductFields.category) String? category,
      @JsonKey(name: ProductFields.subCategory) String? subCategory,
      @JsonKey(name: ProductFields.images) List<String>? images,
      @JsonKey(name: ProductFields.isAvailable) bool? isAvailable,
      @JsonKey(name: ProductFields.isFeatured) bool? isFeatured,
      @JsonKey(name: ProductFields.isPopular) bool? isPopular,
      @JsonKey(name: ProductFields.isOnSale) bool? isOnSale,
      @JsonKey(name: ProductFields.isOnDiscount) bool? isOnDiscount,
      @JsonKey(name: ProductFields.isOnNew) bool? isOnNew,
      @JsonKey(name: ProductFields.isOnBestSeller) bool? isOnBestSeller,
      @JsonKey(name: ProductFields.isOnTopRated) bool? isOnTopRated,
      @JsonKey(name: ProductFields.isOnFeatured) bool? isOnFeatured,
      @JsonKey(name: ProductFields.isOnPopular) bool? isOnPopular,
      @JsonKey(name: ProductFields.isOnTrending) bool? isOnTrending,
      @JsonKey(name: ProductFields.likes) List<String>? likes,
      @JsonKey(name: ProductFields.views) List<String>? views,
      @JsonKey(name: ProductFields.shares) int? shares,
      @JsonKey(name: ProductFields.isVerified) bool? isVerified,
      @JsonKey(name: ProductFields.isApproved) bool? isApproved,
      @JsonKey(name: ProductFields.isSoldOut) bool? isSoldOut,
      @JsonKey(name: ProductFields.stock) int? stock,
      @JsonKey(name: ProductFields.discountPercentage)
      double? discountPercentage,
      @JsonKey(name: ProductFields.discountAmount) double? discountAmount,
      @JsonKey(name: ProductFields.discountStartDate) int? discountStartDate,
      @JsonKey(name: ProductFields.discountEndDate) int? discountEndDate,
      @JsonKey(name: ProductFields.availableColors)
      List<String>? availableColors,
      @JsonKey(name: ProductFields.availableSizes) List<String>? availableSizes,
      @JsonKey(name: ProductFields.shopId) String? shopId,
      @JsonKey(name: ProductFields.mediaPath) String? mediaPath,
      @JsonKey(name: ProductFields.lastUpdatedAt) int? lastUpdatedAt,
      @JsonKey(name: ProductFields.hasBeenIndexed) bool? hasBeenIndexed,
      @JsonKey(name: ProductFields.heroImage) String? heroImage});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? productId = freezed,
    Object? sellerId = freezed,
    Object? label = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? images = freezed,
    Object? isAvailable = freezed,
    Object? isFeatured = freezed,
    Object? isPopular = freezed,
    Object? isOnSale = freezed,
    Object? isOnDiscount = freezed,
    Object? isOnNew = freezed,
    Object? isOnBestSeller = freezed,
    Object? isOnTopRated = freezed,
    Object? isOnFeatured = freezed,
    Object? isOnPopular = freezed,
    Object? isOnTrending = freezed,
    Object? likes = freezed,
    Object? views = freezed,
    Object? shares = freezed,
    Object? isVerified = freezed,
    Object? isApproved = freezed,
    Object? isSoldOut = freezed,
    Object? stock = freezed,
    Object? discountPercentage = freezed,
    Object? discountAmount = freezed,
    Object? discountStartDate = freezed,
    Object? discountEndDate = freezed,
    Object? availableColors = freezed,
    Object? availableSizes = freezed,
    Object? shopId = freezed,
    Object? mediaPath = freezed,
    Object? lastUpdatedAt = freezed,
    Object? hasBeenIndexed = freezed,
    Object? heroImage = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPopular: freezed == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnSale: freezed == isOnSale
          ? _value.isOnSale
          : isOnSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnDiscount: freezed == isOnDiscount
          ? _value.isOnDiscount
          : isOnDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnNew: freezed == isOnNew
          ? _value.isOnNew
          : isOnNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnBestSeller: freezed == isOnBestSeller
          ? _value.isOnBestSeller
          : isOnBestSeller // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnTopRated: freezed == isOnTopRated
          ? _value.isOnTopRated
          : isOnTopRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnFeatured: freezed == isOnFeatured
          ? _value.isOnFeatured
          : isOnFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnPopular: freezed == isOnPopular
          ? _value.isOnPopular
          : isOnPopular // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnTrending: freezed == isOnTrending
          ? _value.isOnTrending
          : isOnTrending // ignore: cast_nullable_to_non_nullable
              as bool?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      shares: freezed == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSoldOut: freezed == isSoldOut
          ? _value.isSoldOut
          : isSoldOut // ignore: cast_nullable_to_non_nullable
              as bool?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountStartDate: freezed == discountStartDate
          ? _value.discountStartDate
          : discountStartDate // ignore: cast_nullable_to_non_nullable
              as int?,
      discountEndDate: freezed == discountEndDate
          ? _value.discountEndDate
          : discountEndDate // ignore: cast_nullable_to_non_nullable
              as int?,
      availableColors: freezed == availableColors
          ? _value.availableColors
          : availableColors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      availableSizes: freezed == availableSizes
          ? _value.availableSizes
          : availableSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaPath: freezed == mediaPath
          ? _value.mediaPath
          : mediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      hasBeenIndexed: freezed == hasBeenIndexed
          ? _value.hasBeenIndexed
          : hasBeenIndexed // ignore: cast_nullable_to_non_nullable
              as bool?,
      heroImage: freezed == heroImage
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: ProductFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      DateTime? createdAt,
      @JsonKey(name: ProductFields.productId) String? productId,
      @JsonKey(name: ProductFields.sellerId) String? sellerId,
      @JsonKey(name: ProductFields.label) String? label,
      @JsonKey(name: ProductFields.description) String? description,
      @JsonKey(name: ProductFields.price) double? price,
      @JsonKey(name: ProductFields.currency) String? currency,
      @JsonKey(name: ProductFields.category) String? category,
      @JsonKey(name: ProductFields.subCategory) String? subCategory,
      @JsonKey(name: ProductFields.images) List<String>? images,
      @JsonKey(name: ProductFields.isAvailable) bool? isAvailable,
      @JsonKey(name: ProductFields.isFeatured) bool? isFeatured,
      @JsonKey(name: ProductFields.isPopular) bool? isPopular,
      @JsonKey(name: ProductFields.isOnSale) bool? isOnSale,
      @JsonKey(name: ProductFields.isOnDiscount) bool? isOnDiscount,
      @JsonKey(name: ProductFields.isOnNew) bool? isOnNew,
      @JsonKey(name: ProductFields.isOnBestSeller) bool? isOnBestSeller,
      @JsonKey(name: ProductFields.isOnTopRated) bool? isOnTopRated,
      @JsonKey(name: ProductFields.isOnFeatured) bool? isOnFeatured,
      @JsonKey(name: ProductFields.isOnPopular) bool? isOnPopular,
      @JsonKey(name: ProductFields.isOnTrending) bool? isOnTrending,
      @JsonKey(name: ProductFields.likes) List<String>? likes,
      @JsonKey(name: ProductFields.views) List<String>? views,
      @JsonKey(name: ProductFields.shares) int? shares,
      @JsonKey(name: ProductFields.isVerified) bool? isVerified,
      @JsonKey(name: ProductFields.isApproved) bool? isApproved,
      @JsonKey(name: ProductFields.isSoldOut) bool? isSoldOut,
      @JsonKey(name: ProductFields.stock) int? stock,
      @JsonKey(name: ProductFields.discountPercentage)
      double? discountPercentage,
      @JsonKey(name: ProductFields.discountAmount) double? discountAmount,
      @JsonKey(name: ProductFields.discountStartDate) int? discountStartDate,
      @JsonKey(name: ProductFields.discountEndDate) int? discountEndDate,
      @JsonKey(name: ProductFields.availableColors)
      List<String>? availableColors,
      @JsonKey(name: ProductFields.availableSizes) List<String>? availableSizes,
      @JsonKey(name: ProductFields.shopId) String? shopId,
      @JsonKey(name: ProductFields.mediaPath) String? mediaPath,
      @JsonKey(name: ProductFields.lastUpdatedAt) int? lastUpdatedAt,
      @JsonKey(name: ProductFields.hasBeenIndexed) bool? hasBeenIndexed,
      @JsonKey(name: ProductFields.heroImage) String? heroImage});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? productId = freezed,
    Object? sellerId = freezed,
    Object? label = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? currency = freezed,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? images = freezed,
    Object? isAvailable = freezed,
    Object? isFeatured = freezed,
    Object? isPopular = freezed,
    Object? isOnSale = freezed,
    Object? isOnDiscount = freezed,
    Object? isOnNew = freezed,
    Object? isOnBestSeller = freezed,
    Object? isOnTopRated = freezed,
    Object? isOnFeatured = freezed,
    Object? isOnPopular = freezed,
    Object? isOnTrending = freezed,
    Object? likes = freezed,
    Object? views = freezed,
    Object? shares = freezed,
    Object? isVerified = freezed,
    Object? isApproved = freezed,
    Object? isSoldOut = freezed,
    Object? stock = freezed,
    Object? discountPercentage = freezed,
    Object? discountAmount = freezed,
    Object? discountStartDate = freezed,
    Object? discountEndDate = freezed,
    Object? availableColors = freezed,
    Object? availableSizes = freezed,
    Object? shopId = freezed,
    Object? mediaPath = freezed,
    Object? lastUpdatedAt = freezed,
    Object? hasBeenIndexed = freezed,
    Object? heroImage = freezed,
  }) {
    return _then(_$ProductImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isAvailable: freezed == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPopular: freezed == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnSale: freezed == isOnSale
          ? _value.isOnSale
          : isOnSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnDiscount: freezed == isOnDiscount
          ? _value.isOnDiscount
          : isOnDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnNew: freezed == isOnNew
          ? _value.isOnNew
          : isOnNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnBestSeller: freezed == isOnBestSeller
          ? _value.isOnBestSeller
          : isOnBestSeller // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnTopRated: freezed == isOnTopRated
          ? _value.isOnTopRated
          : isOnTopRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnFeatured: freezed == isOnFeatured
          ? _value.isOnFeatured
          : isOnFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnPopular: freezed == isOnPopular
          ? _value.isOnPopular
          : isOnPopular // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnTrending: freezed == isOnTrending
          ? _value.isOnTrending
          : isOnTrending // ignore: cast_nullable_to_non_nullable
              as bool?,
      likes: freezed == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      views: freezed == views
          ? _value._views
          : views // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      shares: freezed == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isApproved: freezed == isApproved
          ? _value.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSoldOut: freezed == isSoldOut
          ? _value.isSoldOut
          : isSoldOut // ignore: cast_nullable_to_non_nullable
              as bool?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountStartDate: freezed == discountStartDate
          ? _value.discountStartDate
          : discountStartDate // ignore: cast_nullable_to_non_nullable
              as int?,
      discountEndDate: freezed == discountEndDate
          ? _value.discountEndDate
          : discountEndDate // ignore: cast_nullable_to_non_nullable
              as int?,
      availableColors: freezed == availableColors
          ? _value._availableColors
          : availableColors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      availableSizes: freezed == availableSizes
          ? _value._availableSizes
          : availableSizes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaPath: freezed == mediaPath
          ? _value.mediaPath
          : mediaPath // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      hasBeenIndexed: freezed == hasBeenIndexed
          ? _value.hasBeenIndexed
          : hasBeenIndexed // ignore: cast_nullable_to_non_nullable
              as bool?,
      heroImage: freezed == heroImage
          ? _value.heroImage
          : heroImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {@JsonKey(
          name: ProductFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      this.createdAt,
      @JsonKey(name: ProductFields.productId) this.productId,
      @JsonKey(name: ProductFields.sellerId) this.sellerId,
      @JsonKey(name: ProductFields.label) this.label,
      @JsonKey(name: ProductFields.description) this.description,
      @JsonKey(name: ProductFields.price) this.price,
      @JsonKey(name: ProductFields.currency) this.currency,
      @JsonKey(name: ProductFields.category) this.category,
      @JsonKey(name: ProductFields.subCategory) this.subCategory,
      @JsonKey(name: ProductFields.images) final List<String>? images,
      @JsonKey(name: ProductFields.isAvailable) this.isAvailable,
      @JsonKey(name: ProductFields.isFeatured) this.isFeatured,
      @JsonKey(name: ProductFields.isPopular) this.isPopular,
      @JsonKey(name: ProductFields.isOnSale) this.isOnSale,
      @JsonKey(name: ProductFields.isOnDiscount) this.isOnDiscount,
      @JsonKey(name: ProductFields.isOnNew) this.isOnNew,
      @JsonKey(name: ProductFields.isOnBestSeller) this.isOnBestSeller,
      @JsonKey(name: ProductFields.isOnTopRated) this.isOnTopRated,
      @JsonKey(name: ProductFields.isOnFeatured) this.isOnFeatured,
      @JsonKey(name: ProductFields.isOnPopular) this.isOnPopular,
      @JsonKey(name: ProductFields.isOnTrending) this.isOnTrending,
      @JsonKey(name: ProductFields.likes) final List<String>? likes,
      @JsonKey(name: ProductFields.views) final List<String>? views,
      @JsonKey(name: ProductFields.shares) this.shares,
      @JsonKey(name: ProductFields.isVerified) this.isVerified,
      @JsonKey(name: ProductFields.isApproved) this.isApproved,
      @JsonKey(name: ProductFields.isSoldOut) this.isSoldOut,
      @JsonKey(name: ProductFields.stock) this.stock,
      @JsonKey(name: ProductFields.discountPercentage) this.discountPercentage,
      @JsonKey(name: ProductFields.discountAmount) this.discountAmount,
      @JsonKey(name: ProductFields.discountStartDate) this.discountStartDate,
      @JsonKey(name: ProductFields.discountEndDate) this.discountEndDate,
      @JsonKey(name: ProductFields.availableColors)
      final List<String>? availableColors,
      @JsonKey(name: ProductFields.availableSizes)
      final List<String>? availableSizes,
      @JsonKey(name: ProductFields.shopId) this.shopId,
      @JsonKey(name: ProductFields.mediaPath) this.mediaPath,
      @JsonKey(name: ProductFields.lastUpdatedAt) this.lastUpdatedAt,
      @JsonKey(name: ProductFields.hasBeenIndexed) this.hasBeenIndexed,
      @JsonKey(name: ProductFields.heroImage) this.heroImage})
      : _images = images,
        _likes = likes,
        _views = views,
        _availableColors = availableColors,
        _availableSizes = availableSizes;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(
      name: ProductFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  final DateTime? createdAt;
  @override
  @JsonKey(name: ProductFields.productId)
  final String? productId;
  @override
  @JsonKey(name: ProductFields.sellerId)
  final String? sellerId;
  @override
  @JsonKey(name: ProductFields.label)
  final String? label;
  @override
  @JsonKey(name: ProductFields.description)
  final String? description;
  @override
  @JsonKey(name: ProductFields.price)
  final double? price;
  @override
  @JsonKey(name: ProductFields.currency)
  final String? currency;
  @override
  @JsonKey(name: ProductFields.category)
  final String? category;
  @override
  @JsonKey(name: ProductFields.subCategory)
  final String? subCategory;
  final List<String>? _images;
  @override
  @JsonKey(name: ProductFields.images)
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: ProductFields.isAvailable)
  final bool? isAvailable;
  @override
  @JsonKey(name: ProductFields.isFeatured)
  final bool? isFeatured;
  @override
  @JsonKey(name: ProductFields.isPopular)
  final bool? isPopular;
  @override
  @JsonKey(name: ProductFields.isOnSale)
  final bool? isOnSale;
  @override
  @JsonKey(name: ProductFields.isOnDiscount)
  final bool? isOnDiscount;
  @override
  @JsonKey(name: ProductFields.isOnNew)
  final bool? isOnNew;
  @override
  @JsonKey(name: ProductFields.isOnBestSeller)
  final bool? isOnBestSeller;
  @override
  @JsonKey(name: ProductFields.isOnTopRated)
  final bool? isOnTopRated;
  @override
  @JsonKey(name: ProductFields.isOnFeatured)
  final bool? isOnFeatured;
  @override
  @JsonKey(name: ProductFields.isOnPopular)
  final bool? isOnPopular;
  @override
  @JsonKey(name: ProductFields.isOnTrending)
  final bool? isOnTrending;
  final List<String>? _likes;
  @override
  @JsonKey(name: ProductFields.likes)
  List<String>? get likes {
    final value = _likes;
    if (value == null) return null;
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _views;
  @override
  @JsonKey(name: ProductFields.views)
  List<String>? get views {
    final value = _views;
    if (value == null) return null;
    if (_views is EqualUnmodifiableListView) return _views;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: ProductFields.shares)
  final int? shares;
  @override
  @JsonKey(name: ProductFields.isVerified)
  final bool? isVerified;
  @override
  @JsonKey(name: ProductFields.isApproved)
  final bool? isApproved;
  @override
  @JsonKey(name: ProductFields.isSoldOut)
  final bool? isSoldOut;
  @override
  @JsonKey(name: ProductFields.stock)
  final int? stock;
  @override
  @JsonKey(name: ProductFields.discountPercentage)
  final double? discountPercentage;
  @override
  @JsonKey(name: ProductFields.discountAmount)
  final double? discountAmount;
  @override
  @JsonKey(name: ProductFields.discountStartDate)
  final int? discountStartDate;
  @override
  @JsonKey(name: ProductFields.discountEndDate)
  final int? discountEndDate;
  final List<String>? _availableColors;
  @override
  @JsonKey(name: ProductFields.availableColors)
  List<String>? get availableColors {
    final value = _availableColors;
    if (value == null) return null;
    if (_availableColors is EqualUnmodifiableListView) return _availableColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _availableSizes;
  @override
  @JsonKey(name: ProductFields.availableSizes)
  List<String>? get availableSizes {
    final value = _availableSizes;
    if (value == null) return null;
    if (_availableSizes is EqualUnmodifiableListView) return _availableSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: ProductFields.shopId)
  final String? shopId;
  @override
  @JsonKey(name: ProductFields.mediaPath)
  final String? mediaPath;
  @override
  @JsonKey(name: ProductFields.lastUpdatedAt)
  final int? lastUpdatedAt;
  @override
  @JsonKey(name: ProductFields.hasBeenIndexed)
  final bool? hasBeenIndexed;
  @override
  @JsonKey(name: ProductFields.heroImage)
  final String? heroImage;

  @override
  String toString() {
    return 'Product(createdAt: $createdAt, productId: $productId, sellerId: $sellerId, label: $label, description: $description, price: $price, currency: $currency, category: $category, subCategory: $subCategory, images: $images, isAvailable: $isAvailable, isFeatured: $isFeatured, isPopular: $isPopular, isOnSale: $isOnSale, isOnDiscount: $isOnDiscount, isOnNew: $isOnNew, isOnBestSeller: $isOnBestSeller, isOnTopRated: $isOnTopRated, isOnFeatured: $isOnFeatured, isOnPopular: $isOnPopular, isOnTrending: $isOnTrending, likes: $likes, views: $views, shares: $shares, isVerified: $isVerified, isApproved: $isApproved, isSoldOut: $isSoldOut, stock: $stock, discountPercentage: $discountPercentage, discountAmount: $discountAmount, discountStartDate: $discountStartDate, discountEndDate: $discountEndDate, availableColors: $availableColors, availableSizes: $availableSizes, shopId: $shopId, mediaPath: $mediaPath, lastUpdatedAt: $lastUpdatedAt, hasBeenIndexed: $hasBeenIndexed, heroImage: $heroImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular) &&
            (identical(other.isOnSale, isOnSale) ||
                other.isOnSale == isOnSale) &&
            (identical(other.isOnDiscount, isOnDiscount) ||
                other.isOnDiscount == isOnDiscount) &&
            (identical(other.isOnNew, isOnNew) || other.isOnNew == isOnNew) &&
            (identical(other.isOnBestSeller, isOnBestSeller) ||
                other.isOnBestSeller == isOnBestSeller) &&
            (identical(other.isOnTopRated, isOnTopRated) ||
                other.isOnTopRated == isOnTopRated) &&
            (identical(other.isOnFeatured, isOnFeatured) ||
                other.isOnFeatured == isOnFeatured) &&
            (identical(other.isOnPopular, isOnPopular) ||
                other.isOnPopular == isOnPopular) &&
            (identical(other.isOnTrending, isOnTrending) ||
                other.isOnTrending == isOnTrending) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._views, _views) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isSoldOut, isSoldOut) ||
                other.isSoldOut == isSoldOut) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.discountStartDate, discountStartDate) ||
                other.discountStartDate == discountStartDate) &&
            (identical(other.discountEndDate, discountEndDate) ||
                other.discountEndDate == discountEndDate) &&
            const DeepCollectionEquality()
                .equals(other._availableColors, _availableColors) &&
            const DeepCollectionEquality()
                .equals(other._availableSizes, _availableSizes) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.mediaPath, mediaPath) ||
                other.mediaPath == mediaPath) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            (identical(other.hasBeenIndexed, hasBeenIndexed) ||
                other.hasBeenIndexed == hasBeenIndexed) &&
            (identical(other.heroImage, heroImage) ||
                other.heroImage == heroImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        productId,
        sellerId,
        label,
        description,
        price,
        currency,
        category,
        subCategory,
        const DeepCollectionEquality().hash(_images),
        isAvailable,
        isFeatured,
        isPopular,
        isOnSale,
        isOnDiscount,
        isOnNew,
        isOnBestSeller,
        isOnTopRated,
        isOnFeatured,
        isOnPopular,
        isOnTrending,
        const DeepCollectionEquality().hash(_likes),
        const DeepCollectionEquality().hash(_views),
        shares,
        isVerified,
        isApproved,
        isSoldOut,
        stock,
        discountPercentage,
        discountAmount,
        discountStartDate,
        discountEndDate,
        const DeepCollectionEquality().hash(_availableColors),
        const DeepCollectionEquality().hash(_availableSizes),
        shopId,
        mediaPath,
        lastUpdatedAt,
        hasBeenIndexed,
        heroImage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {@JsonKey(
          name: ProductFields.createdAt,
          fromJson: DateUtils.timestampToDateTime,
          toJson: DateUtils.dateTimeToTimestamp)
      final DateTime? createdAt,
      @JsonKey(name: ProductFields.productId) final String? productId,
      @JsonKey(name: ProductFields.sellerId) final String? sellerId,
      @JsonKey(name: ProductFields.label) final String? label,
      @JsonKey(name: ProductFields.description) final String? description,
      @JsonKey(name: ProductFields.price) final double? price,
      @JsonKey(name: ProductFields.currency) final String? currency,
      @JsonKey(name: ProductFields.category) final String? category,
      @JsonKey(name: ProductFields.subCategory) final String? subCategory,
      @JsonKey(name: ProductFields.images) final List<String>? images,
      @JsonKey(name: ProductFields.isAvailable) final bool? isAvailable,
      @JsonKey(name: ProductFields.isFeatured) final bool? isFeatured,
      @JsonKey(name: ProductFields.isPopular) final bool? isPopular,
      @JsonKey(name: ProductFields.isOnSale) final bool? isOnSale,
      @JsonKey(name: ProductFields.isOnDiscount) final bool? isOnDiscount,
      @JsonKey(name: ProductFields.isOnNew) final bool? isOnNew,
      @JsonKey(name: ProductFields.isOnBestSeller) final bool? isOnBestSeller,
      @JsonKey(name: ProductFields.isOnTopRated) final bool? isOnTopRated,
      @JsonKey(name: ProductFields.isOnFeatured) final bool? isOnFeatured,
      @JsonKey(name: ProductFields.isOnPopular) final bool? isOnPopular,
      @JsonKey(name: ProductFields.isOnTrending) final bool? isOnTrending,
      @JsonKey(name: ProductFields.likes) final List<String>? likes,
      @JsonKey(name: ProductFields.views) final List<String>? views,
      @JsonKey(name: ProductFields.shares) final int? shares,
      @JsonKey(name: ProductFields.isVerified) final bool? isVerified,
      @JsonKey(name: ProductFields.isApproved) final bool? isApproved,
      @JsonKey(name: ProductFields.isSoldOut) final bool? isSoldOut,
      @JsonKey(name: ProductFields.stock) final int? stock,
      @JsonKey(name: ProductFields.discountPercentage)
      final double? discountPercentage,
      @JsonKey(name: ProductFields.discountAmount) final double? discountAmount,
      @JsonKey(name: ProductFields.discountStartDate)
      final int? discountStartDate,
      @JsonKey(name: ProductFields.discountEndDate) final int? discountEndDate,
      @JsonKey(name: ProductFields.availableColors)
      final List<String>? availableColors,
      @JsonKey(name: ProductFields.availableSizes)
      final List<String>? availableSizes,
      @JsonKey(name: ProductFields.shopId) final String? shopId,
      @JsonKey(name: ProductFields.mediaPath) final String? mediaPath,
      @JsonKey(name: ProductFields.lastUpdatedAt) final int? lastUpdatedAt,
      @JsonKey(name: ProductFields.hasBeenIndexed) final bool? hasBeenIndexed,
      @JsonKey(name: ProductFields.heroImage)
      final String? heroImage}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(
      name: ProductFields.createdAt,
      fromJson: DateUtils.timestampToDateTime,
      toJson: DateUtils.dateTimeToTimestamp)
  DateTime? get createdAt;
  @override
  @JsonKey(name: ProductFields.productId)
  String? get productId;
  @override
  @JsonKey(name: ProductFields.sellerId)
  String? get sellerId;
  @override
  @JsonKey(name: ProductFields.label)
  String? get label;
  @override
  @JsonKey(name: ProductFields.description)
  String? get description;
  @override
  @JsonKey(name: ProductFields.price)
  double? get price;
  @override
  @JsonKey(name: ProductFields.currency)
  String? get currency;
  @override
  @JsonKey(name: ProductFields.category)
  String? get category;
  @override
  @JsonKey(name: ProductFields.subCategory)
  String? get subCategory;
  @override
  @JsonKey(name: ProductFields.images)
  List<String>? get images;
  @override
  @JsonKey(name: ProductFields.isAvailable)
  bool? get isAvailable;
  @override
  @JsonKey(name: ProductFields.isFeatured)
  bool? get isFeatured;
  @override
  @JsonKey(name: ProductFields.isPopular)
  bool? get isPopular;
  @override
  @JsonKey(name: ProductFields.isOnSale)
  bool? get isOnSale;
  @override
  @JsonKey(name: ProductFields.isOnDiscount)
  bool? get isOnDiscount;
  @override
  @JsonKey(name: ProductFields.isOnNew)
  bool? get isOnNew;
  @override
  @JsonKey(name: ProductFields.isOnBestSeller)
  bool? get isOnBestSeller;
  @override
  @JsonKey(name: ProductFields.isOnTopRated)
  bool? get isOnTopRated;
  @override
  @JsonKey(name: ProductFields.isOnFeatured)
  bool? get isOnFeatured;
  @override
  @JsonKey(name: ProductFields.isOnPopular)
  bool? get isOnPopular;
  @override
  @JsonKey(name: ProductFields.isOnTrending)
  bool? get isOnTrending;
  @override
  @JsonKey(name: ProductFields.likes)
  List<String>? get likes;
  @override
  @JsonKey(name: ProductFields.views)
  List<String>? get views;
  @override
  @JsonKey(name: ProductFields.shares)
  int? get shares;
  @override
  @JsonKey(name: ProductFields.isVerified)
  bool? get isVerified;
  @override
  @JsonKey(name: ProductFields.isApproved)
  bool? get isApproved;
  @override
  @JsonKey(name: ProductFields.isSoldOut)
  bool? get isSoldOut;
  @override
  @JsonKey(name: ProductFields.stock)
  int? get stock;
  @override
  @JsonKey(name: ProductFields.discountPercentage)
  double? get discountPercentage;
  @override
  @JsonKey(name: ProductFields.discountAmount)
  double? get discountAmount;
  @override
  @JsonKey(name: ProductFields.discountStartDate)
  int? get discountStartDate;
  @override
  @JsonKey(name: ProductFields.discountEndDate)
  int? get discountEndDate;
  @override
  @JsonKey(name: ProductFields.availableColors)
  List<String>? get availableColors;
  @override
  @JsonKey(name: ProductFields.availableSizes)
  List<String>? get availableSizes;
  @override
  @JsonKey(name: ProductFields.shopId)
  String? get shopId;
  @override
  @JsonKey(name: ProductFields.mediaPath)
  String? get mediaPath;
  @override
  @JsonKey(name: ProductFields.lastUpdatedAt)
  int? get lastUpdatedAt;
  @override
  @JsonKey(name: ProductFields.hasBeenIndexed)
  bool? get hasBeenIndexed;
  @override
  @JsonKey(name: ProductFields.heroImage)
  String? get heroImage;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
