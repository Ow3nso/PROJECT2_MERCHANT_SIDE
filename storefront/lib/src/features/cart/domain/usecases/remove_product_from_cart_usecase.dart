import '../entities/entity_cart.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases_types/future_style_use_case_types.dart';


import '../repositories/cart_repository.dart';

/// A concrete implementation of [CartUseCase] with parameters.
///
/// This class requires a [CartRepository] to function.
/// It calls the repository method with the given parameters.
class RemoveProductFromCartUseCase implements UseCase<EntityCart, RemoveProductFromCartUseCaseParams> {

  /// Repository to interact with data layer.
  final CartRepository repository;

  /// Constructor for the use case, requiring a [repository].
  const RemoveProductFromCartUseCase({required this.repository});

  /// Calls the repository method with the given parameters.
  ///
  /// The method returns a [Future] or [Stream] based on the [usecaseType].
  @override
  Future<(Failure?, EntityCart?)> call(RemoveProductFromCartUseCaseParams params) async {
    return await repository.removeProductFromCart(id: params.id, createdAt: params.createdAt, sellerId: params.sellerId, label: params.label, description: params.description, price: params.price, currency: params.currency, category: params.category, subCategory: params.subCategory, images: params.images, isAvailable: params.isAvailable, isFeatured: params.isFeatured, isPopular: params.isPopular, isOnSale: params.isOnSale, isOnDiscount: params.isOnDiscount, isOnNew: params.isOnNew, isOnBestSeller: params.isOnBestSeller, isOnTopRated: params.isOnTopRated, isOnTrending: params.isOnTrending, likes: params.likes, views: params.views, shares: params.shares, isVerified: params.isVerified, isApproved: params.isApproved, isSoldOut: params.isSoldOut, stock: params.stock, discountPercentage: params.discountPercentage, discountAmount: params.discountAmount, discountStartDate: params.discountStartDate, discountEndDate: params.discountEndDate, availableColors: params.availableColors, availableSizes: params.availableSizes, shopId: params.shopId, lastUpdatedAt: params.lastUpdatedAt, hasBeenIndexed: params.hasBeenIndexed);
  }
}

/// Parameter class for [RemoveProductFromCartUseCase].
///
/// Contains all the attributes required for the use case.
class RemoveProductFromCartUseCaseParams {
  final dynamic id;
  final dynamic createdAt;
  final dynamic sellerId;
  final dynamic label;
  final dynamic description;
  final dynamic price;
  final dynamic currency;
  final dynamic category;
  final dynamic subCategory;
  final dynamic images;
  final dynamic isAvailable;
  final dynamic isFeatured;
  final dynamic isPopular;
  final dynamic isOnSale;
  final dynamic isOnDiscount;
  final dynamic isOnNew;
  final dynamic isOnBestSeller;
  final dynamic isOnTopRated;
  final dynamic isOnTrending;
  final dynamic likes;
  final dynamic views;
  final dynamic shares;
  final dynamic isVerified;
  final dynamic isApproved;
  final dynamic isSoldOut;
  final dynamic stock;
  final dynamic discountPercentage;
  final dynamic discountAmount;
  final dynamic discountStartDate;
  final dynamic discountEndDate;
  final dynamic availableColors;
  final dynamic availableSizes;
  final dynamic shopId;
  final dynamic lastUpdatedAt;
  final dynamic hasBeenIndexed;

  /// Creates an instance of [RemoveProductFromCartUseCaseParams].
    const RemoveProductFromCartUseCaseParams({ required this.id, required this.createdAt, required this.sellerId, required this.label, required this.description, required this.price, required this.currency, required this.category, required this.subCategory, required this.images, required this.isAvailable, required this.isFeatured, required this.isPopular, required this.isOnSale, required this.isOnDiscount, required this.isOnNew, required this.isOnBestSeller, required this.isOnTopRated, required this.isOnTrending, required this.likes, required this.views, required this.shares, required this.isVerified, required this.isApproved, required this.isSoldOut, required this.stock, required this.discountPercentage, required this.discountAmount, required this.discountStartDate, required this.discountEndDate, required this.availableColors, required this.availableSizes, required this.shopId, required this.lastUpdatedAt, required this.hasBeenIndexed });
}
