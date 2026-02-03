// lib/features/product/domain/entities/product_entity.dart
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final String sellerId;
  final String label;
  final String description;
  final double price;
  final String currency;
  final String category;
  final String subCategory;
  final List<String> images;
  final bool isAvailable;
  final bool isFeatured;
  final bool isPopular;
  final bool isOnSale;
  final bool isOnDiscount;
  final bool isOnNew;
  final bool isOnBestSeller;
  final bool isOnTopRated;
  final bool isOnTrending;
  final List<String> likes;
  final List<String> views;
  final int shares;
  final bool isVerified;
  final bool isApproved;
  final bool isSoldOut;
  final int stock;
  final double discountPercentage;
  final double discountAmount;
  final DateTime discountStartDate;
  final DateTime discountEndDate;
  final List<String> availableColors;
  final List<String> availableSizes;
  final String shopId;
  final int lastUpdatedAt;
  final bool hasBeenIndexed;

  const ProductEntity({
    required this.id,
    required this.createdAt,
    required this.sellerId,
    required this.label,
    required this.description,
    required this.price,
    required this.currency,
    required this.category,
    required this.subCategory,
    required this.images,
    required this.isAvailable,
    required this.isFeatured,
    required this.isPopular,
    required this.isOnSale,
    required this.isOnDiscount,
    required this.isOnNew,
    required this.isOnBestSeller,
    required this.isOnTopRated,
    required this.isOnTrending,
    required this.likes,
    required this.views,
    required this.shares,
    required this.isVerified,
    required this.isApproved,
    required this.isSoldOut,
    required this.stock,
    required this.discountPercentage,
    required this.discountAmount,
    required this.discountStartDate,
    required this.discountEndDate,
    required this.availableColors,
    required this.availableSizes,
    required this.shopId,
    required this.lastUpdatedAt,
    required this.hasBeenIndexed,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        sellerId,
        label,
        description,
        price,
        currency,
        category,
        subCategory,
        images,
        isAvailable,
        isFeatured,
        isPopular,
        isOnSale,
        isOnDiscount,
        isOnNew,
        isOnBestSeller,
        isOnTopRated,
        isOnTrending,
        likes,
        views,
        shares,
        isVerified,
        isApproved,
        isSoldOut,
        stock,
        discountPercentage,
        discountAmount,
        discountStartDate,
        discountEndDate,
        availableColors,
        availableSizes,
        shopId,
        lastUpdatedAt,
        hasBeenIndexed,
      ];
}