
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lukhu_packages_pkg/src/models/product/fields.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import '../../utils/date/date_utils.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product, DateUtils{
    @JsonSerializable(explicitToJson: true)

    factory Product({
      @JsonKey(name: ProductFields.createdAt, fromJson: DateUtils.timestampToDateTime, toJson: DateUtils.dateTimeToTimestamp)
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
      @JsonKey(name: ProductFields.discountPercentage) double? discountPercentage,
      @JsonKey(name: ProductFields.discountAmount) double? discountAmount,
      @JsonKey(name: ProductFields.discountStartDate) int? discountStartDate,
      @JsonKey(name: ProductFields.discountEndDate) int? discountEndDate,
      @JsonKey(name: ProductFields.availableColors) List<String>? availableColors,
      @JsonKey(name: ProductFields.availableSizes) List<String>? availableSizes,
      @JsonKey(name: ProductFields.shopId) String? shopId,
       @JsonKey(name: ProductFields.mediaPath) String? mediaPath,
      @JsonKey(name: ProductFields.lastUpdatedAt) int? lastUpdatedAt,
      @JsonKey(name: ProductFields.hasBeenIndexed) bool? hasBeenIndexed,
      @JsonKey(name: ProductFields.heroImage) String? heroImage,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

    factory Product.empty() => Product(
      createdAt: DateTime.now(),
      productId: '',
      sellerId: '',
      label: '',
      description: '',
      price: 0.0,
      currency: '',
      category: '',
      subCategory: '',
      images: [],
      isAvailable: false,
      isFeatured: false,
      isPopular: false,
      isOnSale: false,
      isOnDiscount: false,
      isOnNew: false,
      isOnBestSeller: false,
      isOnTopRated: false,
      isOnFeatured: false,
      isOnPopular: false,
      isOnTrending: false,
      likes: [],
      views: [],
      shares: 0,
      isVerified: false,
      isApproved: false,
      isSoldOut: false,
      stock: 0,
      discountPercentage: 0.0,
      discountAmount: 0.0,
      discountStartDate: 0,
      discountEndDate: 0,
      availableColors: [],
      availableSizes: [],
      shopId: '',
      lastUpdatedAt: DateTime.now().millisecondsSinceEpoch,
      hasBeenIndexed: false,
    );

    factory Product.fromDS(String id, Map<String, dynamic> json) => Product.fromJson(json);
    
}