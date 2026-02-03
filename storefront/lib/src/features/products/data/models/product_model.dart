// lib/features/product/data/models/product_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/product_entity.dart';

class ProductModel {
  final DateTime createdAt;
  final String productId;
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

  ProductModel({
    required this.createdAt,
    required this.productId,
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

  factory ProductModel.fromFirestore(Map<String, dynamic> data) {
    return ProductModel(
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      productId: data['productId'] ?? '',
      sellerId: data['sellerId'] ?? '',
      label: data['label'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      currency: data['currency'] ?? 'USD',
      category: data['category'] ?? '',
      subCategory: data['subCategory'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      isAvailable: data['isAvailable'] ?? false,
      isFeatured: data['isFeatured'] ?? false,
      isPopular: data['isPopular'] ?? false,
      isOnSale: data['isOnSale'] ?? false,
      isOnDiscount: data['isOnDiscount'] ?? false,
      isOnNew: data['isOnNew'] ?? false,
      isOnBestSeller: data['isOnBestSeller'] ?? false,
      isOnTopRated: data['isOnTopRated'] ?? false,
      isOnTrending: data['isOnTrending'] ?? false,
      likes: List<String>.from(data['likes'] ?? []),
      views: List<String>.from(data['views'] ?? []),
      shares: data['shares'] ?? 0,
      isVerified: data['isVerified'] ?? false,
      isApproved: data['isApproved'] ?? false,
      isSoldOut: data['isSoldOut'] ?? false,
      stock: data['stock'] ?? 0,
      discountPercentage: (data['discountPercentage'] ?? 0.0).toDouble(),
      discountAmount: (data['discountAmount'] ?? 0.0).toDouble(),
      discountStartDate: DateTime.fromMillisecondsSinceEpoch(
          data['discountStartDate'] ?? 0),
      discountEndDate: DateTime.fromMillisecondsSinceEpoch(
          data['discountEndDate'] ?? 0),
      availableColors: List<String>.from(data['availableColors'] ?? []),
      availableSizes: List<String>.from(data['availableSizes'] ?? []),
      shopId: data['shopId'] ?? '',
      lastUpdatedAt: data['lastUpdatedAt'] ?? 0,
      hasBeenIndexed: data['hasBeenIndexed'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'createdAt': FieldValue.serverTimestamp(),
      'productId': productId,
      'sellerId': sellerId,
      'label': label,
      'description': description,
      'price': price,
      'currency': currency,
      'category': category,
      'subCategory': subCategory,
      'images': images,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'isPopular': isPopular,
      'isOnSale': isOnSale,
      'isOnDiscount': isOnDiscount,
      'isOnNew': isOnNew,
      'isOnBestSeller': isOnBestSeller,
      'isOnTopRated': isOnTopRated,
      'isOnTrending': isOnTrending,
      'likes': likes,
      'views': views,
      'shares': shares,
      'isVerified': isVerified,
      'isApproved': isApproved,
      'isSoldOut': isSoldOut,
      'stock': stock,
      'discountPercentage': discountPercentage,
      'discountAmount': discountAmount,
      'discountStartDate': discountStartDate.millisecondsSinceEpoch,
      'discountEndDate': discountEndDate.millisecondsSinceEpoch,
      'availableColors': availableColors,
      'availableSizes': availableSizes,
      'shopId': shopId,
      'lastUpdatedAt': lastUpdatedAt,
      'hasBeenIndexed': hasBeenIndexed,
    };
  }

  ProductEntity toEntity() => ProductEntity(
        id: productId,
        createdAt: createdAt,
        sellerId: sellerId,
        label: label,
        description: description,
        price: price,
        currency: currency,
        category: category,
        subCategory: subCategory,
        images: images,
        isAvailable: isAvailable,
        isFeatured: isFeatured,
        isPopular: isPopular,
        isOnSale: isOnSale,
        isOnDiscount: isOnDiscount,
        isOnNew: isOnNew,
        isOnBestSeller: isOnBestSeller,
        isOnTopRated: isOnTopRated,
        isOnTrending: isOnTrending,
        likes: likes,
        views: views,
        shares: shares,
        isVerified: isVerified,
        isApproved: isApproved,
        isSoldOut: isSoldOut,
        stock: stock,
        discountPercentage: discountPercentage,
        discountAmount: discountAmount,
        discountStartDate: discountStartDate,
        discountEndDate: discountEndDate,
        availableColors: availableColors,
        availableSizes: availableSizes,
        shopId: shopId,
        lastUpdatedAt: lastUpdatedAt,
        hasBeenIndexed: hasBeenIndexed,
      );

      factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] ?? 0),
      productId: json['productId'] ?? '',
      sellerId: json['sellerId'] ?? '',
      label: json['label'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      currency: json['currency'] ?? '',
      category: json['category'] ?? '',
      subCategory: json['subCategory'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      isAvailable: json['isAvailable'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      isPopular: json['isPopular'] ?? false,
      isOnSale: json['isOnSale'] ?? false,
      isOnDiscount: json['isOnDiscount'] ?? false,
      isOnNew: json['isOnNew'] ?? false,
      isOnBestSeller: json['isOnBestSeller'] ?? false,
      isOnTopRated: json['isOnTopRated'] ?? false,
      isOnTrending: json['isOnTrending'] ?? false,
      likes: List<String>.from(json['likes'] ?? []),
      views: List<String>.from(json['views'] ?? []),
      shares: json['shares'] ?? 0,
      isVerified: json['isVerified'] ?? false,
      isApproved: json['isApproved'] ?? false,
      isSoldOut: json['isSoldOut'] ?? false,
      stock: json['stock'] ?? 0,
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      discountAmount: (json['discountAmount'] ?? 0).toDouble(),
      discountStartDate: DateTime.fromMillisecondsSinceEpoch(json['discountStartDate'] ?? 0),
      discountEndDate: DateTime.fromMillisecondsSinceEpoch(json['discountEndDate'] ?? 0),
      availableColors: List<String>.from(json['availableColors'] ?? []),
      availableSizes: List<String>.from(json['availableSizes'] ?? []),
      shopId: json['shopId'] ?? '',
      lastUpdatedAt: json['lastUpdatedAt'] ?? 0,
      hasBeenIndexed: json['hasBeenIndexed'] ?? false,
    );
  }

  List<Object> get props => [
        createdAt,
        productId,
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